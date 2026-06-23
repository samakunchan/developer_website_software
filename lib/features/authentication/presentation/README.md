# Authentication Presentation Layer

This directory handles the user interface layer for the Authentication feature of the application, utilizing a clean, platform-adaptive structure.

## Directory Structure

```text
presentation/
├── README.md           # This documentation
├── screens/            # Screen scaffolds and layouts
│   ├── login_screen.dart # Screen entry wrapper (PlatformStatefulWidget)
│   ├── macos/          # Cupertino (macOS/iOS) scaffold
│   │   └── cupertino_login_scaffold.dart
│   ├── others/         # Material (Web/Android/etc.) scaffold
│   │   └── material_login_scaffold.dart
│   └── windows/        # Fluent (Windows) scaffold
│       └── fluent_login_scaffold.dart
├── signals/            # State management using signals
│   └── auth_signals.dart # Reactive authentication signals
├── viewmodels/         # Presentation View Models
│   ├── session_view_model.dart
│   └── user_view_model.dart
└── widgets/            # UI components and platform wrappers
    ├── auth_gate.dart  # Authentication gate (non-adaptive logical router widget)
    ├── authentication_text_field.dart # Adaptive text field wrapper (PlatformWidget)
    ├── authentication_notification_message.dart # Adaptive notification message wrapper (PlatformWidget)
    ├── macos/          # Cupertino (macOS/iOS) component implementations
    │   ├── cupertino_authentication_text_field.dart
    │   └── cupertino_authentication_notification_message.dart
    ├── others/         # Material (Web/Android/etc.) component implementations
    │   ├── material_authentication_text_field.dart
    │   └── material_authentication_notification_message.dart
    └── windows/        # Fluent (Windows) component implementations
        ├── fluent_authentication_text_field.dart
        └── fluent_authentication_notification_message.dart
```

### 1. `/screens` (Screen-Level Scaffolds)
This folder contains screen-level layout scaffolds. The root `login_screen.dart` is a `PlatformStatefulWidget` wrapper that adaptively renders `CupertinoLoginScaffold`, `FluentLoginScaffold`, or `MaterialLoginScaffold` depending on the current OS.

### 2. `/signals` (State Management)
This folder contains files managing the reactive state of the login flow. Specifically, `auth_signals.dart` uses `signals_flutter` to manage:
- `currentUser`: The current signed-in user entity (or null).
- `isLoading`: A boolean indicating if a background operation is active.
- `authError`: A string containing login or password reset errors.

### 3. `/viewmodels` (Presentation View Models)
This folder contains the view models that wrap the domain entities to expose them to the presentation layer:
- `UserViewModel`: Wraps `UserEntity` and exposes fields (`name`, `email`, `role`) as reactive signals while preserving direct getter access.
- `SessionViewModel`: Wraps `SessionEntity` and exposes token and user sub-view model.

### 4. `/widgets` (UI Components & Adaptability Wrappers)
This folder contains all sub-widgets and components (like fields, gates, and alerts) divided into:
- **Root Wrappers**: Extend the custom `PlatformWidget` (or `StatelessWidget` for logical routing like `AuthGate`) to adaptively check the OS at runtime and render the correct platform implementation.
- **Platform Implementations** (under `/macos`, `/windows`, `/others` subdirectories): The actual platform-specific layout implementations utilizing the respective native design frameworks (Cupertino, Fluent UI, and Material).

---

## Best Practices

1. **Do NOT add trailing commas (STRICT)**: Never add trailing commas at the end of lists, arguments, or parameters in code files. The formatter and IDE handle spacing, keeping the lines horizontal and utilizing the `130`-character width limit.
2. **Shorthands**: Always use implicit member access (dot shorthands like `.bold`, `.translucent`, `.all(16)`) wherever the context type is known.
