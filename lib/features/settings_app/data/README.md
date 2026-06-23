# Settings App Data Layer

This directory handles the data layer for the Settings App feature. It is responsible for calling external APIs, mapping raw JSON responses into Dart models, and returning clean domain entities or failure objects to the domain layer.

## Directory Structure

```text
data/
├── README.md           # This documentation
├── datasources/        # Remote and local data provider interfaces & implementations
│   └── settings_app_remote_data_source.dart
├── models/             # Data models extending domain entities (JSON serialization)
│   ├── policy_model.dart
│   └── theme_model.dart
└── repositories/       # Implementation of domain repository contracts
    └── settings_app_repository_impl.dart
```

### 1. `/datasources` (Data Providers)
Data sources perform the raw HTTP network calls. Specifically:
- `SettingsAppRemoteDataSource`: Abstract interface defining theme and policy API endpoints.
- `SettingsAppRemoteDataSourceImpl`: Concrete implementation calling `ApiService` endpoints using `ApiConfig` paths. It throws a structured `ExceptionModel` in case of API failure.

### 2. `/models` (JSON Serialization & Entities Mapping)
Models extend the core domain entities to keep domain logic independent of backend JSON serialization structures:
- `ThemeModel`: Extends `ThemeEntity`. Deserializes backend theme objects and provides a `toEntity()` mapper.
- `PolicyModel`: Extends `PolicyEntity`. Deserializes CGU, privacy, cookie, and legal policies and provides a `toEntity()` mapper.

### 3. `/repositories` (Data Flow Coordination & Exception Handling)
The repository implementations coordinate data sources and handle exceptions:
- `SettingsAppRepositoryImpl`: Implements the `SettingsAppRepository` interface defined in the domain layer. It catches `ExceptionModel` (or generic runtime errors), wraps them in a `Failure` instance (e.g. `ServerFailure`), and returns a functional `Either<Failure, Entity>` result.

---

## Best Practices

1. **Keep Models Clean**: Avoid putting presentation or business logic inside the models. They should only handle JSON mapping (`fromJson`, `toJson`) and domain entity conversion (`toEntity`).
2. **Handle All Exceptions**: Always catch and handle data source exceptions within the repository implementation, translating them into unified domain `Failure` types.
3. **No Domain Imports in Datasources**: Data sources should return models (or maps/lists), not domain entities. Let the Repository coordinate conversion to entities.
4. **Alphabetical Imports (STRICT)**: Always sort import statements alphabetically by package and filename.
