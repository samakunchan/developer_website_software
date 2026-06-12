# CHANGELOG developer_website_software

## 🚀 0.2.0+2 - 12/06/2026

*Note: Only tested for the Cupertino platform.*

### Added
- Custom `FluentScaffoldPage`, `CupertinoScaffoldPage`, and `MaterialScaffoldPage` widgets to standardize page layouts.
- Reusable core widgets: `DWSTextField` and `NotificationMessage`.
- New cross-platform UI helpers: `PlatformWidget` and `PlatformStatefulWidget` to build adaptive layouts across platforms.
- Modular theme system in `lib/core/themes/` supporting Cupertino, Material, and Fluent platforms (with dark/light dynamic colors).

### Changed
- Removed `macos_ui` dependency and replaced with standard `Cupertino` widgets.
- Refactored `LoginScreen` to extend `PlatformStatefulWidget` with native renderers.
- Removed redundant `theme_constants.dart` file.

### Fixed

- N/A

## 🚀 0.1.0+1 - 11/06/2026

### Added
- Clean Architecture scaffolding for the `authentication` feature.
- Layer-specific documentation (`README.md`) for authentication `domain`, `data`, and `presentation` layers.
- Core network infrastructure (`BaseService`, `ApiService`, `ExceptionModel`) with functional error handling using the `Either` pattern.
- Transparent Bearer auth token injection via network interceptors.
- `AuthCacheDataSource` for secure session token caching using `SharedPreferences`.
- `AuthSignals` reactive state manager using `signals_flutter`.
- macOS native style `LoginScreen` form using `macos_ui` and `SignalBuilder`.
- Dependency injection container setup using `GetIt`.

### Changed
- Updated `pubspec.yaml` with core packages (`dio`, `get_it`, `signals_flutter`, `dartz`, `macos_ui`, `macos_window_utils`, `window_manager`, `freezed`, `json_serializable`).
- Configured linter rules and files exclusions in `analysis_options.yaml` based on `very_good_analysis`.
- Updated `main.dart` to initialize desktop window setups and dependencies.
- Refactored imports to use direct package paths instead of relative imports.
- Changed local data source terminology to cache (`AuthCacheDataSource`).

### Fixed
- Resolved macOS solid black window background issue by integrating `MacOSWindowUtilsViewController` in native Swift (`MainFlutterWindow.swift`) and initializing `WindowManipulator` in Dart.
