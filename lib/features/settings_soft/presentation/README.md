# Settings Soft Presentation Layer

This directory handles the user interface layer for local application preferences (Settings Soft) such as local theme modes, font sizing, and font family choices.

## Directory Structure

```text
presentation/
├── README.md           # This documentation
├── signals/            # State management via Signals
│   └── settings_soft_signals.dart # Reactive local settings signals
└── widgets/            # UI components and layout panels
    ├── account_tab.dart # User account details tab
    ├── general_tab.dart # Theme, font sizing, and font selection tab
    ├── info_row.dart # Read-only data presentation layout row
    ├── setting_row.dart # Actionable settings line with description labels
    ├── settings_soft_dialog.dart # Preferences dialog containing the tabs
    └── settings_soft_divider.dart # Stylized preference section divider
```

### 1. `/signals` (State Management)
This folder contains files managing the reactive preferences state. Specifically, `settings_soft_signals.dart` uses `signals_flutter` to manage:
- `themeMode`: Active `ThemeMode` choice (Dark, Light, or System) which persists to `SharedPreferences`.
- `fontSize`: Active `AppFontSize` multiplier (Small, Medium, or Large).
- `fontFamily`: Active `AppFontFamily` choice (System or Inter).

### 2. `/widgets` (UI Components & Dialog)
This folder contains the preference settings dialog and its component panels:
- `SettingsSoftDialog`: The main dialog surface. It uses a sliding segment selector to toggle between the **General** tab and the **Account Info** tab.
- `GeneralTab`: Lets users dynamically adjust application themes and typographic scales.
- `AccountTab`: Displays active session user profiles (utilizes the authentication `UserViewModel`) and offers a quick sign-out hook.
- **Utility Rows**: Small visual helpers (`InfoRow`, `SettingRow`, and `SettingsSoftDivider`) that maintain layout cleanliness.

---

## Best Practices

1. **Do NOT add trailing commas (STRICT)**: Never add trailing commas at the end of lists, arguments, or parameters in code files.
2. **Shorthands**: Always use implicit member access (dot shorthands like `.bold`, `.translucent`, `.all(16)`) wherever the context type is known.
3. **Alphabetical Imports (STRICT)**: Always sort import statements alphabetically by package and filename.
