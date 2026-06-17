import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:developer_website_software/core/errors/failures.dart';
import 'package:developer_website_software/features/settings_app/domain/entities/theme_entity.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/get_theme_use_case.dart';
import 'package:developer_website_software/features/settings_app/domain/usecases/set_theme_use_case.dart';
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
  SettingsAppSignals({
    required this.getThemeUseCase,
    required this.setThemeUseCase,
  });

  final GetThemeUseCase getThemeUseCase;
  final SetThemeUseCase setThemeUseCase;

  static const List<ThemeOption> themes = [
    ThemeOption(
      id: 'dark',
      name: 'Dark (Modern)',
      primaryColor: Color(0xFF25F4F4),
      secondaryColor: Color(0xFF102222),
      category: 'Défaut',
    ),
    ThemeOption(
      id: 'light',
      name: 'Light (Blue)',
      primaryColor: Color(0xFF0660F2),
      secondaryColor: Color(0xFFFFFFFF),
      category: 'Défaut',
    ),
    ThemeOption(
      id: 'forest',
      name: 'Forest',
      primaryColor: Color(0xFF006D36),
      secondaryColor: Color(0xFFF8F8F8),
      category: 'Nature',
    ),
    ThemeOption(
      id: 'ocean',
      name: 'Ocean',
      primaryColor: Color(0xFF0B1326),
      secondaryColor: Color(0xFF8ED5FF),
      category: 'Nature',
    ),
    ThemeOption(
      id: 'desert',
      name: 'Desert',
      primaryColor: Color(0xFF974225),
      secondaryColor: Color(0xFFFCF9F4),
      category: 'Nature',
    ),
    ThemeOption(
      id: 'guardian',
      name: 'Guardian',
      primaryColor: Color(0xFFE01A4F),
      secondaryColor: Color(0xFF1D1E2C),
      category: 'Vaisseaux',
    ),
    ThemeOption(
      id: 'aegis',
      name: 'Aegis',
      primaryColor: Color(0xFFF15152),
      secondaryColor: Color(0xFF3C3744),
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
