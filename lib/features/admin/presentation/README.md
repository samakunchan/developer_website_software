# Admin Presentation Layer

This directory handles the user interface layer for the Admin feature of the application, utilizing a clean, platform-adaptive structure.

## Directory Structure

```text
presentation/
├── screens/            # Screen scaffolds and layouts
│   ├── admin_screen.dart # Screen entry wrapper (PlatformWidget)
│   ├── macos/          # Cupertino (macOS/iOS) scaffold
│   ├── others/         # Material (Web/Android/etc.) scaffold
│   └── windows/        # Fluent (Windows) scaffold
└── widgets/            # UI components and platform wrappers
    ├── admin_sidebar.dart # Adaptive sidebar wrapper (PlatformWidget)
    ├── admin_toolbar.dart # Adaptive toolbar wrapper (PlatformWidget)
    ├── admin_main_content_area.dart # Adaptive main content area wrapper (PlatformWidget)
    ├── macos/          # Cupertino (macOS/iOS) component implementations
    │   ├── cupertino_admin_main_content_area.dart
    │   ├── cupertino_admin_sidebar.dart
    │   └── cupertino_admin_toolbar.dart
    ├── others/         # Material (Web/Android/etc.) component implementations
    │   ├── material_admin_main_content_area.dart
    │   ├── material_admin_sidebar.dart
    │   └── material_admin_toolbar.dart
    └── windows/        # Fluent (Windows) component implementations
        ├── fluent_admin_main_content_area.dart
        ├── fluent_admin_sidebar.dart
        └── fluent_admin_toolbar.dart
```

### 1. `/screens` (Screen-Level Scaffolds)
This folder contains screen-level layout scaffolds. The root `admin_screen.dart` is a `PlatformStatefulWidget` wrapper that adaptively renders `CupertinoAdminScaffold`, `FluentAdminScaffold`, or `MaterialAdminScaffold` depending on the current OS.

### 2. `/widgets` (UI Components & Adaptability Wrappers)
This folder contains all sub-widgets and components (like sidebar, toolbar, and main content area) divided into:
- **Root Wrappers**: Extend the custom `PlatformWidget` to adaptively check the OS at runtime and render the correct platform implementation.
- **Platform Implementations** (under `/macos`, `/windows`, `/others` subdirectories): The actual platform-specific layout implementations utilizing the respective native design frameworks (Cupertino, Fluent UI, and Material).

---

## Best Practices

1. **Do NOT add trailing commas (STRICT)**: Never add trailing commas at the end of lists, arguments, or parameters in code files. The formatter and IDE handle spacing, keeping the lines horizontal and utilizing the `130`-character width limit.
2. **Shorthands**: Always use implicit member access (dot shorthands like `.bold`, `.translucent`, `.all(16)`) wherever the context type is known.
