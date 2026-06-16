# CHANGELOG developer_website_software

## 🚀 0.5.0+5 - 16/06/2026

### Added
- **Reactive Authentication Gate (`AuthGate`)**: Introduced a central `AuthGate` widget that listens to `AuthSignals.currentUser` state changes to reactively and seamlessly redirect users between the `LoginScreen` and the `AdminScreen` based on active session status.
- **Unified Component Wrappers**: Created `PlatformWidget`-based `AdminSidebar`, `AdminToolbar`, and `AdminMainContentArea` wrappers to handle cross-platform widget layout selection.
- **Platform-Specific Sub-Widgets**: Added folder-based native implementations for sidebar, toolbar, and content area widgets (`macos/`, `windows/`, and `others/`) organized under the `/widgets` folder.
- **Multi-Platform Scaffolding**: Added unified `DashboardScreen` and `SettingsAppScreen` entry points with Cupertino, Fluent, and Material layout scaffolds.
- **Persistent Screen Navigation**: Integrated `IndexedStack` across all platform admin layouts to preserve state and scroll positions when navigating between sidebar menus.
- **Persistent Global Toolbar**: Relocated the toolbar component to the parent platform scaffolds, rendering it globally across all selected views instead of only on the main dashboard.

### Changed
- **Admin Presentation Restructuring (Option 1)**: Reorganized the entire `lib/features/admin/presentation` folder to enforce clear semantic separation, reserving `/screens` exclusively for top-level layout scaffolds and moving all sub-components, wrappers, and platform-specific implementations into `/widgets`.
- **Formatting Guidelines**: Updated code style parameters in `SKILL.md` and `cleaning_code.md` to format Dart code to 130-character lines and strictly prohibit trailing commas.
- **Sidebar Hardcoded Versions**: Upgraded version tags across all native sidebars to version `0.5.0`.

### Fixed
- **Dashboard setState Crash**: Added unmounted safeguards (`if (!mounted) return;`) after asynchronous session checking operations (`checkSession` and `getToken`) inside `DashboardScreen` to prevent `setState()` after dispose exceptions.
- **AuthGate Linter Warning**: Added `const` to the `CupertinoActivityIndicator` widget builder in `AuthGate`.

## 🚀 0.4.0+4 - 15/06/2026

### Added
- Native macOS Menu Bar integration (`PlatformMenuBar` / `PlatformMenu`) with standard shortcuts like `Cmd + ,` for Preferences.
- Dynamic theme and appearance setting controls (Light, Dark, System Theme).
- Custom font family configurations (`System`, `Inter` via new `AppFontFamily` enum) and dynamic font scaling (`small`, `medium`, `large` via `AppFontSize` enum).
- Local SharedPreferences persistence for user preference settings.
- Segmented settings preferences page (`SettingsDialog`) with a local tab control for **General** preferences and **Account Info**.
- Extracted clean, modular widget classes: `GeneralTab`, `AccountTab`, `SettingRow`, `InfoRow`, and `SettingsDivider` for cleaner, decoupled widget layouts.

### Changed
- Renamed the macOS application menu header to **DevSuite**.
- Reorganized directory structure: moved Settings signals into `features/settings/presentation/signals/settings_signals.dart` to follow clean architecture feature folder guidelines.
- Reorganized themes directory: migrated the entire `core/themes` folder into the presentation layer under `features/themes/presentation/`.
- Updated all dependency injections and import statements alphabetically.

### Fixed
- N/A

## 🚀 0.3.0+3 - 15/06/2026

### Added
- Automatic session restoration/check on application startup.

### Changed
- Refactored `ExceptionModel` and `ServerFailure` to parse and map the API's new `message` property.
- Renamed the `exception` property to `exceptionName` in `ExceptionModel` for naming consistency with the backend API.

### Fixed
- Prevented a `TypeError` crash in `ExceptionModel.fromJson` by parsing `statusCode` safely via `int.tryParse`.
- Fixed token cleanup by automatically clearing the cached token when the API returns an authentication exception.
- Cleaned up a static analysis warning (extra semicolon/dead code) in `cupertino_login_scaffold.dart`.

## 🚀 0.2.0+2 - 12/06/2026

*Note: Only tested for the Cupertino platform.*

### Added
- Custom `FluentScaffoldPage`, `CupertinoScaffoldPage`, and `MaterialScaffoldPage` widgets to standardize page layouts.
- Reusable core widgets: `DWSTextField` and `NotificationMessage`.
- New cross-platform UI helpers: `PlatformWidget` and `PlatformStatefulWidget` to build adaptive layouts across platforms.
- Modular theme system in `lib/core/themes/` supporting Cupertino, Material, and Fluent platforms (with dark/light dynamic colors).
- Added fonts `Inter` with static files.

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
