# CHANGELOG developer_website_software

## 🚀 0.11.0+13 - 24/06/2026

### Added
- **macOS (Cupertino) Detail Pane Extraction**: Extracted inline widgets from `cupertino_messages_scaffold.dart` into clean, modularized components under `lib/features/messages/presentation/widgets/macos/components/`:
  - `CupertinoMessageSenderProfileCard`: Renders initials avatar, name, email, and localized timestamp.
  - `CupertinoMessageMetadataTags`: Renders service types and price range tags.
  - `CupertinoMessageProjectBrief`: Displays selection-enabled project brief text.
  - `CupertinoMessageDetailBody`: Composes detail sub-elements inside a scrollable layout.
- **Windows (Fluent UI) Componentization**: Refactored the Windows scaffolding layout by extracting all elements under `lib/features/messages/presentation/widgets/windows/components/`:
  - `FluentMessageSearchBox`: Search box text field wrapper.
  - `FluentMessageFiltersSegment`: Segmented list filters.
  - `FluentMessageList`: Interactive messages list view.
  - `FluentMessagePaginationFooter`: Page sizes ComboBox and page navigation.
  - `FluentMessageDetailHeader`: Detail view navigation header toolbar.
  - `FluentMessageSenderProfileCard`, `FluentMessageMetadataTags`, `FluentMessageProjectBrief`, and `FluentMessageDetailBody`.
- **Other Platforms (Material 3) Componentization**: Modularized all components of `material_messages_scaffold.dart` under `lib/features/messages/presentation/widgets/others/components/`:
  - `MaterialMessageSearchBox`, `MaterialMessageFiltersSegment`, `MaterialMessageList`, `MaterialMessagePaginationFooter`, `MaterialMessageDetailHeader`.
  - `MaterialMessageSenderProfileCard`, `MaterialMessageMetadataTags`, `MaterialMessageProjectBrief`, and `MaterialMessageDetailBody`.
- **Cross-Platform Badge Counts**: Created and integrated `CupertinoMessageBadgeCount`, `FluentMessageBadgeCount`, and `MaterialMessageBadgeCount` to display unread badge counts within segmented sliding tab selectors, adapting colors dynamically based on selection state.

### Changed
- **Shorthand Syntax Overhaul**: Cleaned all newly created and updated `messages` components to use Dart dot-shorthand member and constructor notation (`.symmetric`, `.circular`, `.bold`, `.normal`, `.min`, `.center`, `.stretch`, and `.dark`) where types are statically known.
- **Formatting Standards Compliance**: Formatted all codebase files under `lib/features/messages/` to remove trailing commas from argument lists, parameter lists, constructor calls, and list/map literals to prevent vertical line splitting and maximize horizontal code space.
- **Cleaned Scaffolding Code**: Refactored the core Cupertino, Fluent, and Material message scaffolds to use the extracted sub-widgets, reducing file sizes and improving maintainability.

### Fixed
- N/A

## 🚀 0.10.0+12 - 24/06/2026

### Added
- N/A

### Changed
- **Freezed Settings App Models**: Refactored `PolicyModel` and `ThemeModel` under `lib/features/settings_app/data/models/` to use the `freezed` package for code generation, immutability, and JSON serialization.
- **Granular Signal Rebuilds**: Optimized theme selection content widgets across macOS (Cupertino), Windows (Fluent), and Web/others (Material) to prevent full-page/full-grid rebuilds when changing themes or encountering validation errors.
- **Dampen Theme Selection Blinking**: Separated refresh button loading state into `isFetchingTheme` and prevented clearing the `errorMessage` immediately at the start of theme updates, eliminating UI layout blinking.

### Fixed
- N/A

## 🚀 0.9.2+11 - 23/06/2026

### Added
- **Multi-Platform Settings Soft widgets**: Created folder-based native implementations (`macos/` for Cupertino, `windows/` for Fluent UI, `others/` for Material 3) under `lib/features/settings_soft/presentation/widgets/`.

### Changed
- **Adaptive Settings Soft Wrapper widgets**: Updated settings dialog, general settings tab, account info tab, setting row, info row, and divider to extend `PlatformWidget` or `PlatformStatefulWidget`, automatically routing to the platform-specific layouts.

### Fixed
- N/A

## 🚀 0.9.1+10 - 23/06/2026

### Added
- **Settings App ViewModels**: Introduced `ThemeViewModel` and `PolicyViewModel` to the `settings_app` presentation layer. Exposes fields (`theme`, `title`, `content`) as reactive signals.
- **Authentication ViewModels**: Introduced `UserViewModel` and `SessionViewModel` to the `authentication` presentation layer. Wraps user profile information (`name`, `email`, `role`) as reactive signals while offering read-only getters for seamless integration.
- **Settings Soft Documentation**: Added `README.md` for the `settings_soft` presentation layer detailing local preferences state and tab configurations.
- **Settings App Layer Documentation**: Added `README.md` files for both the `data` layer (datasources, models, repositories) and `domain` layer (entities, repository contracts, use cases).
- **Projects Layer Documentation**: Added `README.md` files for the `domain` layer and `data` layer detailing the codegen process, project model entities, and repositories.
- **Dashboard Placeholder Documentation**: Added `README.md` for the `dashboard` feature indicating that development is in progress.

### Changed
- **State Management Integration**: Refactored `SettingsAppSignals` and `AuthSignals` to manage and propagate the new ViewModels rather than raw entities.
- **UI Platform Parity**: Updated all platform-specific login scaffolds, admin toolbars, `AuthGate`, `AccountTab`, and theme content areas to consume the new ViewModel properties across macOS, Windows, and Web/Others.

### Fixed

- N/A

## 🚀 0.9.0+9 - 23/06/2026

### Added
- **Full Projects Feature Set**: Designed and implemented the complete domain, data, and presentation layers for project management.
- **Domain Layer Entities & Use Cases**: Defined the `ProjectEntity`, `TechStackItem`, `ProjectFeatureItem`, and `ProjectImageEntity` models. Created core use cases for getting, creating, updating, toggling featured status, and deleting projects.
- **Data Layer Models & Repositories**: Implemented `ProjectsRemoteDataSource` using the HTTP client, `ProjectModel` with full JSON deserialization/serialization, and `ProjectsRepositoryImpl` supporting robust error handling and failure mapping.
- **Unified Project Form Controller**: Built `ProjectController` to manage the multi-step creation stepper and editing state across all platforms.
- **Cross-Platform Responsive UI**: Implemented `ProjectsScreen` which adaptively renders native Cupertino (macOS), Fluent (Windows), and Material UI (Web/Android) scaffold views, sidebar configurations, list views, and action cards.
- **Project Presentation View Model**: Created `ProjectViewModel` to wrap domain entities and expose featured (`isFeatured`) and publish (`status`) statuses as reactive signals, forwarding read-only fields.
- **Granular List Updates**: Refactored `ProjectsSignals` and card widgets to use `ProjectViewModel` and scoped `SignalBuilder`s, mutating featured/publish state in-place to avoid full-list and full-card rebuilds.
- **Real DateTime List Sorting**: Implemented `ProjectViewModelExtension` on lists to parse and compare actual `DateTime` values, sorting projects chronologically descending (newest first) during fetch, create, and update operations.
- **Presentation Architecture Documentation**: Added a comprehensive `README.md` in the projects presentation folder detailing directory structure, ViewModel performance benefits, and platform isolation guidelines.
- **String Extension**: Added `.slugify()` extension helper to generate clean, URL-friendly slugs from project titles automatically.
- **Dependency Injection**: Wired up the new repositories, remote datasources, use cases, controller, and signals inside the global `injection_container.dart`.

### Changed
- **Platform Parity Updates**: Integrated `ProjectViewModel` across macOS, Windows, and Web/Others widgets to keep platform compatibility and performance optimizations synchronized.

### Fixed
- **Linter & Cascade Warnings**: Corrected various unnecessary lambda closure warnings (`unnecessary_lambdas`), single cascade usages (`avoid_single_cascade_in_expression_statements`), and import organization lints across the projects module.

## 🚀 0.8.0+8 - 22/06/2026

### Added
- **Rich Text Settings Editing**: Replaced Quill editor with `fleather: 1.27.0` and implemented dynamic settings editing for Legal Mentions, CGU, Privacy Policy, and Cookie Policy.
- **Signals-Based State Management**: Migrated editor controllers, title text field controllers, focus nodes, change listeners, and state initialization logic into the `SettingsAppSignals` singleton, enabling stateless UI components and global state persistence.
- **Cross-Platform Policy Content Widgets**: Implemented adaptive stateless widgets `CupertinoPolicyContent`, `MaterialPolicyContent`, and `FluentPolicyContent` to natively bind the Fleather editor and status indicators across macOS, Windows, and Web/Others.
- **Interactive Save Status Indicators**: Introduced the modular `PolicySaveStatusIndicator` component next to the Save button on all platforms to replace SnackBar alerts with native state indicators (green checkmark for saved, orange dot for modified, red warning for validation/API errors).
- **Bidirectional Lexical Parser**: Integrated `LexicalConverter` to bidirectional translate between Delta formats and Lexical JSON schema, ensuring perfect data alignment with the remote backend database.

### Changed
- **Settings Navigation Wiring**: Updated `CupertinoSettingsMainContentArea`, `MaterialSettingsMainContentArea`, and `FluentSettingsMainContentArea` to instantiate the new widgets with dynamic configuration parameters and `ValueKey` tags.
- **Presentation Layer Readme**: Updated `README.md` to document the global state persistence within `SettingsAppSignals` during tab switches.

### Deleted
- **Obsolete Files**: Removed `cupertino_policy_content_beta.dart`.

### Fixed

- N/A

## 🚀 0.7.0+7 - 17/06/2026

### Added
- **Dynamic Window Resizing**: Added reactive window resizing based on active session status (`1280x1024` on login, `900x650` on logout).
- **Toolbar Window Dragging**: Wrapped `AdminToolbar` in a `DragToMoveArea` from `window_manager` to allow dragging and moving the desktop window by grabbing any empty space on the toolbar.
- **Grab Indicator**: Created a shared `GrabIndicator` component presenting a sleek, slate-colored drag handle and displaying a grab cursor on hover.
- **Platform Toolbar Integration**: Added the `GrabIndicator` next to the search bars in Cupertino, Fluent, and Material admin toolbars.
- **Modular Theme Selection Grid Components**: Extracted layout blocks inside platform components folders:
  - Cupertino elements: `CupertinoThemeSelectorGrid`, `CupertinoThemeOptionCard`, `CupertinoThemeColorPreview`, and `CupertinoThemeCardLabel`.
  - Fluent elements: `FluentThemeSelectorGrid`, `FluentThemeOptionCard`, `FluentThemeColorPreview`, and `FluentThemeCardLabel`.
  - Material elements: `MaterialThemeSelectorGrid`, `MaterialThemeOptionCard`, `MaterialThemeColorPreview`, and `MaterialThemeCardLabel`.
- **Platform Content & Policy Widgets**: Moved helper methods into stateless components:
  - `CupertinoThemeContent` and `CupertinoPolicyContent` for macOS.
  - `FluentThemeContent` and `FluentPolicyContent` for Windows.
  - `MaterialThemeContent` and `MaterialPolicyContent` for other platforms.

### Changed
- **Theme Color Constants**: Extracted hardcoded `Color` instances in the `ThemeOption` list inside `SettingsAppSignals` and defined them as constants in `constantes.dart`.
- **Scaffold Direct Binding**: Refactored settings scaffolds to remove double-adaptation wrappers (`SettingsSidebar`, `SettingsMainContentArea`, `ThemeSelectorGrid`), enabling direct bindings to native widgets.
- **Presentation Layer Readme**: Updated `README.md` with the new modular structure and included reproduction guidelines.

### Deleted
- **Obsolete Files**: Removed `settings_sidebar.dart`, `settings_main_content_area.dart`, `theme_selector_grid.dart`, and `utils.dart`.

### Fixed
- **Tear-off Lints**: Fixed unnecessary lambda closure lints in the Fluent refresh button callback.

## 🚀 0.6.0+6 - 16/06/2026

### Added
- **Platform-Specific Settings Content Areas**: Created `MaterialSettingsMainContentArea` and `FluentSettingsMainContentArea` to manage policy document layouts adaptively.
- **Adaptive Settings Widgets**: Introduced clean `SettingsSidebar` and `SettingsMainContentArea` widgets that mirror the architecture of the admin feature.
- **Refactored Settings Scaffolds**: Refactored `CupertinoSettingsAppScaffold`, `MaterialSettingsAppScaffold`, and `FluentSettingsAppScaffold` to compose the new widgets.
- **Settings Presentation Readme**: Created `lib/features/settings_app/presentation/README.md` to document the new directory structure, adaptive widgets, and the Pros/Cons of the Conditional Rendering pattern.

### Changed
- **Authentication Presentation Restructuring**: Renamed `DWSTextField` to `AuthenticationTextField` and `NotificationMessage` to `AuthenticationNotificationMessage`, refactoring them to use the adaptive wrapper pattern with platform-specific implementations under `widgets/macos/`, `widgets/others/`, and `widgets/windows/`.
- **Auth Scaffolds Refactoring**: Refactored the authentication scaffolds/screens (`cupertino_login_scaffold.dart`, `material_login_scaffold.dart`, `fluent_login_scaffold.dart`) to consume the renamed `AuthenticationTextField` and `AuthenticationNotificationMessage` widgets.
- **Dynamic Version Display**: Integrated `package_info_plus` in the dependency injection container and sidebars to dynamically display the active version instead of using hardcoded version strings.

### Fixed
- **Scaffold End-Of-File Lints**: Fixed trailing linter warnings (missing end-of-file newlines) on the refactored scaffold files.

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
