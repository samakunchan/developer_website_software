import 'dart:convert';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/settings_app/domain/entities/policy_entity.dart';
import 'package:developer_website_software/features/settings_app/domain/entities/theme_entity.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/get_policy_use_case.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/get_theme_use_case.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/set_theme_use_case.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/update_policy_use_case.dart';
import 'package:developer_website_software/features/settings_app/presentation/utils/lexical_converter.dart';
import 'package:developer_website_software/features/settings_app/presentation/viewmodels/policy_view_model.dart';
import 'package:developer_website_software/features/settings_app/presentation/viewmodels/theme_view_model.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/widgets.dart' show FocusNode, TextEditingController;
import 'package:signals_flutter/signals_flutter.dart';

enum PolicySaveStatus { loaded, modified, saving, error }

class ThemeOption {
  const ThemeOption({
    required this.id,
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
    required this.category,
  });

  final String id;
  final String name;
  final Color primaryColor;
  final Color secondaryColor;
  final String category;
}

class SettingsAppSignals {
  SettingsAppSignals({
    required this.getThemeUseCase,
    required this.setThemeUseCase,
    required this.getPolicyUseCase,
    required this.updatePolicyUseCase,
  });

  final GetThemeUseCase getThemeUseCase;
  final SetThemeUseCase setThemeUseCase;
  final GetPolicyUseCase getPolicyUseCase;
  final UpdatePolicyUseCase updatePolicyUseCase;

  static const List<ThemeOption> themes = <ThemeOption>[
    ThemeOption(
      id: 'dark',
      name: 'Dark (Modern)',
      primaryColor: kDarkPrimaryColor,
      secondaryColor: kDarkSecondaryColor,
      category: 'Défaut',
    ),
    ThemeOption(
      id: 'light',
      name: 'Light (Blue)',
      primaryColor: kLightPrimaryColor,
      secondaryColor: kLightSecondaryColor,
      category: 'Défaut',
    ),
    ThemeOption(
      id: 'forest',
      name: 'Forest',
      primaryColor: kForestPrimaryColor,
      secondaryColor: kForestSecondaryColor,
      category: 'Nature',
    ),
    ThemeOption(
      id: 'ocean',
      name: 'Ocean',
      primaryColor: kOceanPrimaryColor,
      secondaryColor: kOceanSecondaryColor,
      category: 'Nature',
    ),
    ThemeOption(
      id: 'desert',
      name: 'Desert',
      primaryColor: kDesertPrimaryColor,
      secondaryColor: kDesertSecondaryColor,
      category: 'Nature',
    ),
    ThemeOption(
      id: 'guardian',
      name: 'Guardian',
      primaryColor: kGuardianPrimaryColor,
      secondaryColor: kGuardianSecondaryColor,
      category: 'Vaisseaux',
    ),
    ThemeOption(
      id: 'aegis',
      name: 'Aegis',
      primaryColor: kAegisPrimaryColor,
      secondaryColor: kAegisSecondaryColor,
      category: 'Vaisseaux',
    ),
  ];

  final Signal<ThemeViewModel> currentTheme = signal<ThemeViewModel>(ThemeViewModel(const ThemeEntity(theme: 'light')));
  final Signal<bool> isLoading = signal<bool>(false);
  final Signal<bool> isFetchingTheme = signal<bool>(false);
  final Signal<String?> errorMessage = signal<String?>(null);

  final Signal<PolicyViewModel?> privacyPolicy = signal<PolicyViewModel?>(null);
  final Signal<bool> isLoadingPrivacyPolicy = signal<bool>(false);
  final Signal<String?> errorPrivacyPolicy = signal<String?>(null);

  final Signal<PolicyViewModel?> cgu = signal<PolicyViewModel?>(null);
  final Signal<bool> isLoadingCGU = signal<bool>(false);
  final Signal<String?> errorCGU = signal<String?>(null);

  final Signal<PolicyViewModel?> legalMentions = signal<PolicyViewModel?>(null);
  final Signal<bool> isLoadingLegalMentions = signal<bool>(false);
  final Signal<String?> errorLegalMentions = signal<String?>(null);

  final Signal<PolicyViewModel?> cookiePolicy = signal<PolicyViewModel?>(null);
  final Signal<bool> isLoadingCookiePolicy = signal<bool>(false);
  final Signal<String?> errorCookiePolicy = signal<String?>(null);

  final Map<String, Signal<PolicySaveStatus>> _saveStatusSignals = {};
  final Map<String, Signal<FleatherController?>> _fleatherControllers = {};
  final Map<String, TextEditingController> _titleControllers = {};
  final Map<String, FocusNode> _focusNodes = {};
  final Map<String, bool> _isInitializing = {};

  Signal<PolicySaveStatus> getPolicySaveStatusSignal(String type) {
    return _saveStatusSignals.putIfAbsent(type, () => signal<PolicySaveStatus>(PolicySaveStatus.loaded));
  }

  Signal<FleatherController?> getFleatherControllerSignal(String type) {
    return _fleatherControllers.putIfAbsent(type, () => signal<FleatherController?>(null));
  }

  TextEditingController getOrCreateTitleController(String type, String defaultTitle) {
    return _titleControllers.putIfAbsent(type, () {
      final controller = TextEditingController(text: defaultTitle)..addListener(() => _onContentChanged(type));
      return controller;
    });
  }

  FocusNode getOrCreateFocusNode(String type) {
    return _focusNodes.putIfAbsent(type, FocusNode.new);
  }

  void _onContentChanged(String type) {
    if (_isInitializing[type] == true) return;
    final statusSig = getPolicySaveStatusSignal(type);
    if (statusSig.value == PolicySaveStatus.loaded || statusSig.value == PolicySaveStatus.error) {
      statusSig.value = PolicySaveStatus.modified;
      getPolicyErrorSignal(type).value = null;
    }
  }

  void _initEditor(String type, String? lexicalContent) {
    List<dynamic> deltaJson = [];
    if (lexicalContent != null && lexicalContent.isNotEmpty) {
      try {
        final Map<String, dynamic> lexicalMap = json.decode(lexicalContent) as Map<String, dynamic>;
        deltaJson = LexicalConverter.lexicalToDelta(lexicalMap);
      } on Object {
        deltaJson = <Map<String, dynamic>>[
          <String, dynamic>{'insert': '\n'},
        ];
      }
    } else {
      deltaJson = <Map<String, dynamic>>[
        <String, dynamic>{'insert': '\n'},
      ];
    }

    final controllerSig = getFleatherControllerSignal(type);
    if (controllerSig.value != null) {
      controllerSig.value!.removeListener(() => _onContentChanged(type));
      controllerSig.value!.dispose();
    }

    final newController = FleatherController(document: ParchmentDocument.fromJson(deltaJson))
      ..addListener(() => _onContentChanged(type));
    controllerSig.value = newController;
  }

  Signal<PolicyViewModel?> getPolicySignal(String type) {
    switch (type) {
      case 'cgu':
        return cgu;
      case 'legal-mentions':
        return legalMentions;
      case 'cookie-policy':
        return cookiePolicy;
      case 'privacy-policy':
      default:
        return privacyPolicy;
    }
  }

  Signal<bool> getPolicyLoadingSignal(String type) {
    switch (type) {
      case 'cgu':
        return isLoadingCGU;
      case 'legal-mentions':
        return isLoadingLegalMentions;
      case 'cookie-policy':
        return isLoadingCookiePolicy;
      case 'privacy-policy':
      default:
        return isLoadingPrivacyPolicy;
    }
  }

  Signal<String?> getPolicyErrorSignal(String type) {
    switch (type) {
      case 'cgu':
        return errorCGU;
      case 'legal-mentions':
        return errorLegalMentions;
      case 'cookie-policy':
        return errorCookiePolicy;
      case 'privacy-policy':
      default:
        return errorPrivacyPolicy;
    }
  }

  Future<void> fetchTheme() async {
    isFetchingTheme.value = true;
    isLoading.value = true;
    errorMessage.value = null;

    final Either<Failure, ThemeEntity> result = await getThemeUseCase();

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (ThemeEntity entity) {
        currentTheme.value = ThemeViewModel(entity);
        errorMessage.value = null;
      }
    );

    isLoading.value = false;
    isFetchingTheme.value = false;
  }

  Future<void> updateTheme(String theme) async {
    isLoading.value = true;

    final Either<Failure, ThemeEntity> result = await setThemeUseCase(theme);

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (ThemeEntity entity) {
        currentTheme.value = ThemeViewModel(entity);
        errorMessage.value = null;
      }
    );

    isLoading.value = false;
  }

  Future<void> fetchPolicy(String type, String defaultTitle) async {
    final Signal<bool> loading = getPolicyLoadingSignal(type);
    final Signal<String?> error = getPolicyErrorSignal(type);
    final Signal<PolicyViewModel?> policySig = getPolicySignal(type);

    loading.value = true;
    error.value = null;

    final Either<Failure, PolicyEntity> result = await getPolicyUseCase(type);

    _isInitializing[type] = true;

    final titleController = getOrCreateTitleController(type, defaultTitle);

    result.fold(
      (Failure failure) {
        error.value = failure.message;
        titleController.text = defaultTitle;
        _initEditor(type, null);
      },
      (PolicyEntity entity) {
        policySig.value = PolicyViewModel(entity);
        error.value = null;
        titleController.text = entity.title;
        _initEditor(type, entity.content);
      }
    );

    getPolicySaveStatusSignal(type).value = PolicySaveStatus.loaded;
    _isInitializing[type] = false;
    loading.value = false;
  }

  Future<bool> savePolicy(String type, String title, String content) async {
    final Signal<bool> loading = getPolicyLoadingSignal(type);
    final Signal<String?> error = getPolicyErrorSignal(type);
    final Signal<PolicyViewModel?> policySig = getPolicySignal(type);

    loading.value = true;
    error.value = null;

    final Either<Failure, PolicyEntity> result = await updatePolicyUseCase(type, title, content);

    final bool success = result.fold(
      (Failure failure) {
        error.value = failure.message;
        return false;
      },
      (PolicyEntity entity) {
        policySig.value = PolicyViewModel(entity);
        error.value = null;
        return true;
      }
    );

    loading.value = false;
    return success;
  }

  Future<void> savePolicyChanges(String type) async {
    final fleatherController = getFleatherControllerSignal(type).value;
    final titleController = _titleControllers[type];
    if (fleatherController == null || titleController == null) return;

    final String title = titleController.text.trim();
    if (title.isEmpty) {
      getPolicySaveStatusSignal(type).value = PolicySaveStatus.error;
      getPolicyErrorSignal(type).value = 'Title cannot be empty';
      return;
    }

    final List<dynamic> deltaJson = fleatherController.document.toDelta().toJson();
    final Map<String, dynamic> lexicalMap = LexicalConverter.deltaToLexical(deltaJson);
    final String stringifiedLexical = json.encode(lexicalMap);

    getPolicySaveStatusSignal(type).value = PolicySaveStatus.saving;

    final bool success = await savePolicy(type, title, stringifiedLexical);

    getPolicySaveStatusSignal(type).value = success ? PolicySaveStatus.loaded : PolicySaveStatus.error;
  }
}
