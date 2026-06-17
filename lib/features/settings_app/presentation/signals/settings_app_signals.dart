import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/settings_app/domain/entities/theme_entity.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/get_theme_use_case.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/set_theme_use_case.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:signals_flutter/signals_flutter.dart';

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
  SettingsAppSignals({required this.getThemeUseCase, required this.setThemeUseCase});

  final GetThemeUseCase getThemeUseCase;
  final SetThemeUseCase setThemeUseCase;

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

  final Signal<String> currentTheme = signal<String>('light');
  final Signal<bool> isLoading = signal<bool>(false);
  final Signal<String?> errorMessage = signal<String?>(null);

  Future<void> fetchTheme() async {
    isLoading.value = true;
    errorMessage.value = null;

    final Either<Failure, ThemeEntity> result = await getThemeUseCase();

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (ThemeEntity entity) {
        currentTheme.value = entity.theme;
        errorMessage.value = null;
      },
    );

    isLoading.value = false;
  }

  Future<void> updateTheme(String theme) async {
    isLoading.value = true;
    errorMessage.value = null;

    final Either<Failure, ThemeEntity> result = await setThemeUseCase(theme);

    result.fold(
      (Failure failure) {
        errorMessage.value = failure.message;
      },
      (ThemeEntity entity) {
        currentTheme.value = entity.theme;
        errorMessage.value = null;
      },
    );

    isLoading.value = false;
  }
}
