# Settings App Presentation Layer

This directory handles the user interface layer for the Settings App feature of the application, utilizing a clean, platform-adaptive structure.

## Directory Structure

```text
presentation/
├── README.md           # Documentation for the presentation layer
├── screens/            # Screen scaffolds and layouts
│   ├── settings_app_screen.dart # Screen entry wrapper (PlatformWidget)
│   ├── macos/          # Cupertino (macOS/iOS) scaffold
│   │   └── cupertino_settings_app_scaffold.dart # Direct binding to macOS widgets
│   ├── others/         # Material (Web/Android/etc.) scaffold
│   │   └── material_settings_app_scaffold.dart # Direct binding to Material widgets
│   └── windows/        # Fluent (Windows) scaffold
│       └── fluent_settings_app_scaffold.dart # Direct binding to Fluent widgets
├── signals/            # State management via Signals
│   └── settings_app_signals.dart
└── widgets/            # UI components
    ├── macos/          # Cupertino (macOS/iOS) widgets
    │   ├── cupertino_settings_main_content_area.dart
    │   ├── cupertino_settings_sidebar.dart
    │   └── components/ # Cupertino leaf elements
    │       ├── cupertino_policy_content.dart
    │       ├── cupertino_theme_card_label.dart
    │       ├── cupertino_theme_color_preview.dart
    │       ├── cupertino_theme_content.dart
    │       ├── cupertino_theme_option_card.dart
    │       └── cupertino_theme_selector_grid.dart
    ├── others/         # Material (Web/Android/etc.) widgets
    │   ├── material_settings_main_content_area.dart
    │   ├── material_settings_sidebar.dart
    │   └── components/ # Material leaf elements
    │       ├── material_policy_content.dart
    │       ├── material_theme_card_label.dart
    │       ├── material_theme_color_preview.dart
    │       ├── material_theme_content.dart
    │       ├── material_theme_option_card.dart
    │       └── material_theme_selector_grid.dart
    └── windows/        # Fluent (Windows) widgets
        ├── fluent_settings_main_content_area.dart
        ├── fluent_settings_sidebar.dart
        └── components/ # Fluent leaf elements
            ├── fluent_policy_content.dart
            ├── fluent_theme_card_label.dart
            ├── fluent_theme_color_preview.dart
            ├── fluent_theme_content.dart
            ├── fluent_theme_option_card.dart
            └── fluent_theme_selector_grid.dart
```

### 1. `/screens` (Screen-Level Scaffolds)
This folder contains screen-level layout scaffolds. The root `settings_app_screen.dart` is a `PlatformWidget` wrapper that adaptively renders `CupertinoSettingsAppScaffold`, `FluentSettingsAppScaffold`, or `MaterialSettingsAppScaffold` depending on the current OS.

### 2. `/widgets` (UI Components)
Contains all sub-widgets and layout panels, divided strictly by platform into `/macos`, `/windows`, and `/others`.
- **Platform Main Components**: Direct layout entry points (such as `cupertino_settings_sidebar.dart` and `cupertino_settings_main_content_area.dart`) called by the platform scaffolds.
- **`/components` Subfolder**: Contains modular, platform-specific leaf widgets (cards, preview blocks, specific page contents, grids) to avoid monolithic files.

> [!NOTE]
> **Conditional Rendering Choice**: Unlike the `admin` main content area which uses `IndexedStack` to persist sub-screen state, the Settings App main content area utilizes **Conditional Rendering** (via a `switch` statement on the section index).
>
> **Pros**:
> - **Memory Efficiency**: Only the active settings page is mounted in the widget tree. Inactive pages are disposed of, releasing system memory.
> - **Clean State Recalculation**: Since pages are rebuilt when visited, they always render up-to-date values, avoiding stale state display issues.
> - **Standard Lifecycle**: Regular widget lifecycle events (`initState()`, `dispose()`) trigger normally, making analytics tracking and resource management simple.
>
> **Cons**:
> - **State Loss**: Transient layout states (such as scroll positions) are lost when navigating away. However, unsaved text changes and editor documents are persisted globally within `SettingsAppSignals` to prevent data loss during tab switches.

---

## Guidelines to Reproduce this Structure

To implement or extend this architecture for other settings tabs or features, adhere to the following rules:

### 1. Avoid Double-Platform Checks
- Never call a cross-platform wrapper (e.g. `PlatformWidget` subclass) from inside a platform-specific file (such as a file in `macos/` or `windows/`).
- Let the screen scaffold (e.g., `CupertinoSettingsAppScaffold`) directly bind to its corresponding platform-specific views (`CupertinoSettingsSidebar` and `CupertinoSettingsMainContentArea`).

### 2. Enforce Strict Platform Isolation
- **Cupertino/macOS files (`macos/`):** Only import `package:flutter/cupertino.dart` and other files within `macos/`. Never import `package:flutter/material.dart` or `package:fluent_ui/fluent_ui.dart`.
- **Fluent/Windows files (`windows/`):** Only import `package:fluent_ui/fluent_ui.dart` and files in `windows/`.
- **Material/Universal files (`others/`):** Only import `package:flutter/material.dart` and files in `others/`.

### 3. Extract Leaf Components into `/components`
When a main content widget grows large (e.g. over 150 lines or containing complex nested items):
- Group related leaf components inside a `components/` subfolder.
- Name them with the platform prefix (e.g. `cupertino_theme_option_card.dart` vs `fluent_theme_option_card.dart`).
- Pass the state (such as `signals` or values) and callbacks down to the leaf widgets to keep them stateless and testable.

### 4. Direct Binding to Scaffolds
Instead of creating cross-platform wrappers for small layout pieces:
- Let the platform-specific scaffold directly structure the view.
- Delete unused wrapper widgets when all child elements have been successfully divided into direct platform-specific implementations.

---

## Best Practices

1. **Do NOT add trailing commas (STRICT)**: Never add trailing commas at the end of lists, arguments, or parameters in code files.
2. **Shorthands**: Always use implicit member access (dot shorthands like `.bold`, `.translucent`, `.all(16)`) wherever the context type is known.
3. **Alphabetical Imports (STRICT)**: Always sort import statements alphabetically by package and filename.
