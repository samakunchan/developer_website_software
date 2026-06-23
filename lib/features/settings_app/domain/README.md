# Settings App Domain Layer

This directory handles the domain layer for the Settings App feature. In accordance with Clean Architecture principles, the domain layer contains the core business rules, entities, and use cases. It is completely independent of other layers (data and presentation) and external libraries.

## Directory Structure

```text
domain/
├── README.md           # This documentation
├── entities/           # Core domain models (plain Dart objects)
│   ├── policy_entity.dart
│   └── theme_entity.dart
├── repositories/       # Abstract repository interfaces (contracts)
│   └── settings_app_repository.dart
└── usecases/           # Individual business logic operations
    ├── get_policy_use_case.dart
    ├── get_theme_use_case.dart
    ├── set_theme_use_case.dart
    └── update_policy_use_case.dart
```

### 1. `/entities` (Business Objects)
Entities represent the core business models. They are simple, plain Dart objects that do not contain any framework-specific annotations (except for `Equatable` to simplify equality comparison):
- `ThemeEntity`: Represents the website's configured theme option.
- `PolicyEntity`: Represents policy documents (CGU, privacy, cookie, and legal policies) with title, content, and timestamp properties.

### 2. `/repositories` (Contracts)
The repository interfaces define the contract for data operations:
- `SettingsAppRepository`: An abstract class specifying the capabilities of the settings data source (getting/setting themes, fetching/updating policies). The concrete implementation of this contract is handled by the data layer.

### 3. `/usecases` (Interactors)
Use cases contain the orchestration logic for specific business workflows:
- `GetThemeUseCase`: Orchestrates the action of retrieving the active theme.
- `SetThemeUseCase`: Orchestrates setting/changing the active theme.
- `GetPolicyUseCase`: Retrieves a policy document of a specific type (e.g. `cgu`, `privacy-policy`).
- `UpdatePolicyUseCase`: Updates the title and content of a specific policy type.

---

## Best Practices

1. **No External Dependencies**: Keep the domain layer pure. Do not import packages like `dio`, `shared_preferences`, or `signals_flutter` here.
2. **One Use Case Per File**: Keep use cases focused. Each usecase class should represent a single action and implement a `call()` method.
3. **Depend on Abstractions**: Domain use cases must only interact with abstract repository interfaces, not concrete implementations.
4. **Alphabetical Imports (STRICT)**: Always sort import statements alphabetically by package and filename.
