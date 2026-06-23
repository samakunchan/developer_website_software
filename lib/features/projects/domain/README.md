# Projects Domain Layer

This directory contains the domain layer for the Projects feature. Following Clean Architecture guidelines, it holds the core business logic, entities, and use case definitions, remaining completely isolated from details like databases, network clients, or UI frameworks.

## Directory Structure

```text
domain/
├── README.md           # This documentation
├── entities/           # Core domain models
│   └── project_entity.dart # Represents project metadata, features, tech stack & image info
├── repositories/       # Abstract repository interfaces (contracts)
│   └── projects_repository.dart
└── usecases/           # Individual business workflow interactor files
    ├── create_project_use_case.dart
    ├── delete_project_use_case.dart
    ├── get_projects_use_case.dart
    ├── toggle_project_featured_use_case.dart
    └── update_project_use_case.dart
```

### 1. `/entities` (Business Objects)
Contains the core project models:
- `ProjectEntity`: Represents a single project containing ID, slug, title, description, category, case study tags, features checklist, tech stack references, and dates.
- `ProjectImageEntity`: Wraps image configuration detail (ID, path, and public URL).
- `TechStackItem` & `ProjectFeatureItem`: Sub-entities representing individual technologies used and features implemented.

### 2. `/repositories` (Contracts)
- `ProjectsRepository`: Abstract definition outlining all CRUD capabilities for project management (fetching all, creating, updating, toggling features, and deleting).

### 3. `/usecases` (Business Logics)
- `GetProjectsUseCase`: Fetches all projects.
- `CreateProjectUseCase`: Adds a new project.
- `UpdateProjectUseCase`: Modifies an existing project's metadata.
- `ToggleProjectFeaturedUseCase`: Flags a project as "Featured" on the portfolio website.
- `DeleteProjectUseCase`: Removes a project by ID.

---

## Best Practices

1. **Independent of External Entities**: Do not import HTTP clients, databases, or state management classes into this folder.
2. **Strict Typings**: Ensure all parameter classes passed to usecases (e.g. `UpdateProjectParams`) are encapsulated within their respective files or in common parameter objects in domain.
3. **Alphabetical Imports (STRICT)**: Always sort import statements alphabetically by package and filename.
