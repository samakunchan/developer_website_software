# Projects Data Layer

This directory handles the data retrieval and persistence for the Projects feature, acting as the interface between the core domain rules and external APIs.

## Directory Structure

```text
data/
├── README.md           # This documentation
├── datasources/        # Remote API integrations
│   └── projects_remote_data_source.dart
├── models/             # JSON serialization models (generated using Freezed)
│   ├── project_model.dart             # Freezed schema definitions
│   ├── project_model.freezed.dart     # Generated immutable model helpers
│   └── project_model.g.dart           # Generated JSON converters
└── repositories/       # Concrete implementation of domain repository contract
    └── projects_repository_impl.dart
```

### 1. `/datasources` (API Clients)
- `ProjectsRemoteDataSourceImpl`: Concrete data source that communicates with the portfolio backend using `ApiService` to fetch, save, delete, or toggle project configurations.

### 2. `/models` (JSON Serialization & Immutable Structures)
- `ProjectModel`: Built using `package:freezed` and `package:json_serializable` for strong typing, complete immutability, and painless JSON mapping. It translates backend API objects and provides mapping helpers to transform models into domain-layer entities.

### 3. `/repositories` (Error Handling & Mapping)
- `ProjectsRepositoryImpl`: Coordinates API lookups from `ProjectsRemoteDataSource` and maps raw models to their corresponding `ProjectEntity`. It catches low-level HTTP exceptions and returns `Either<Failure, ProjectEntity>` to keep the caller's logic clean.

---

## Code Generation

This layer utilizes `build_runner` for generating model files. If you add fields to `ProjectModel` in [project_model.dart](file:///Users/samakunchan/Desktop/developpement/samaapps/developer_website_software/lib/features/projects/data/models/project_model.dart), run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## Best Practices

1. **Leverage Code Generation**: Never write serialization code by hand; use `Freezed` to guarantee safety and avoid manual typo bugs.
2. **Abstract Exception Handling**: Ensure all exceptions thrown in `ProjectsRemoteDataSource` are captured in the repository implementation and converted into structured `Failure` types.
3. **Alphabetical Imports (STRICT)**: Always sort import statements alphabetically by package and filename.
