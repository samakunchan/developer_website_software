# Settings App Presentation Layer

This directory handles the user interface layer for the Settings App feature of the application, utilizing a clean, platform-adaptive structure.

## Directory Structure

```text
presentation/
├── screens/            # Screen scaffolds and layouts
│   ├── settings_app_screen.dart # Screen entry wrapper (PlatformWidget)
│   ├── macos/          # Cupertino (macOS/iOS) scaffold
│   ├── others/         # Material (Web/Android/etc.) scaffold
│   └── windows/        # Fluent (Windows) scaffold
└── widgets/            # UI components and platform wrappers
    ├── settings_sidebar.dart # Adaptive sidebar wrapper (PlatformWidget)
    ├── settings_main_content_area.dart # Adaptive main content area wrapper (PlatformWidget)
    ├── macos/          # Cupertino (macOS/iOS) component implementations
    │   ├── cupertino_settings_main_content_area.dart
    │   └── cupertino_settings_sidebar.dart
    ├── others/         # Material (Web/Android/etc.) component implementations
    │   ├── material_settings_main_content_area.dart
    │   └── material_settings_sidebar.dart
    └── windows/        # Fluent (Windows) component implementations
        ├── fluent_settings_main_content_area.dart
        └── fluent_settings_sidebar.dart
```

### 1. `/screens` (Screen-Level Scaffolds)
This folder contains screen-level layout scaffolds. The root `settings_app_screen.dart` is a `PlatformWidget` wrapper that adaptively renders `CupertinoSettingsAppScaffold`, `FluentSettingsAppScaffold`, or `MaterialSettingsAppScaffold` depending on the current OS.

### 2. `/widgets` (UI Components & Adaptability Wrappers)
This folder contains all sub-widgets and components (like sidebar and main content area) divided into:
- **Root Wrappers**: Extend the custom `PlatformWidget` to adaptively check the OS at runtime and render the correct platform implementation.
- **Platform Implementations** (under `/macos`, `/windows`, `/others` subdirectories): The actual platform-specific layout implementations utilizing the respective native design frameworks (Cupertino, Fluent UI, and Material).

> [!NOTE]
> **Conditional Rendering Choice**: Unlike the `admin` main content area which uses `IndexedStack` to persist sub-screen state, the Settings App main content area utilizes **Conditional Rendering** (via a `switch` statement on the section index).
>
> **Pros**:
> - **Memory Efficiency**: Only the active settings page is mounted in the widget tree. Inactive pages are disposed of, releasing system memory.
> - **Clean State Recalculation**: Since pages are rebuilt when visited, they always render up-to-date values, avoiding stale state display issues.
> - **Standard Lifecycle**: Regular widget lifecycle events (`initState()`, `dispose()`) trigger normally, making analytics tracking and resource management simple.
>
> **Cons**:
> - **State Loss**: Transient UI states (such as scroll positions or unsubmitted inputs) are lost when navigating away, unless persisted globally.



---

## Best Practices

1. **Do NOT add trailing commas (STRICT)**: Never add trailing commas at the end of lists, arguments, or parameters in code files. The formatter and IDE handle spacing, keeping the lines horizontal and utilizing the `130`-character width limit.
2. **Shorthands**: Always use implicit member access (dot shorthands like `.bold`, `.translucent`, `.all(16)`) wherever the context type is known.
