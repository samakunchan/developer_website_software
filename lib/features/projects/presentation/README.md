# Projects Presentation Layer

This directory handles the user interface layer for the Projects feature of the application, utilizing a clean, platform-adaptive structure and state-management optimizations.

## Directory Structure

```text
presentation/
├── README.md           # Documentation for the presentation layer
├── controllers/        # UI logic and transient form controllers
│   └── project_controller.dart # Unified flow controller for create/edit forms
├── enums/              # Feature-specific enums
│   └── enums.dart
├── screens/            # Screen scaffolds and layouts
│   ├── projects_screen.dart # Screen entry wrapper (PlatformWidget)
│   ├── macos/          # Cupertino (macOS/iOS) scaffolds
│   │   └── cupertino_projects_app_scaffold.dart
│   ├── others/         # Material (Web/Android/etc.) scaffolds
│   │   └── material_projects_app_scaffold.dart
│   └── windows/        # Fluent (Windows) scaffolds
│       └── fluent_projects_app_scaffold.dart
├── signals/            # State management via Signals
│   └── projects_signals.dart
├── viewmodels/         # Presentation View Models
│   └── project_view_model.dart # Display state and reactive signals
└── widgets/            # UI components and dialogs
    ├── project_create_dialog.dart # Stepper/Create dialog wrapper
    ├── project_edit_dialog.dart   # Edit dialog wrapper
    ├── macos/          # Cupertino (macOS/iOS) widgets
    │   ├── cupertino_project_create_dialog.dart
    │   ├── cupertino_project_edit_dialog.dart
    │   ├── cupertino_projects_main_content_area.dart
    │   ├── cupertino_projects_sidebar.dart
    │   └── components/ # Cupertino leaf elements
    │       ├── cupertino_project_card.dart
    │       └── cupertino_projects_list.dart
    ├── others/         # Material (Web/Android/etc.) widgets
    │   ├── material_project_create_dialog.dart
    │   ├── material_project_edit_dialog.dart
    │   ├── material_projects_main_content_area.dart
    │   ├── material_projects_sidebar.dart
    │   └── components/ # Material leaf elements
    │       ├── material_project_card.dart
    │       └── material_projects_list.dart
    └── windows/        # Fluent (Windows) widgets
        ├── fluent_project_create_dialog.dart
        ├── fluent_project_edit_dialog.dart
        ├── fluent_projects_main_content_area.dart
        ├── fluent_projects_sidebar.dart
        └── components/ # Fluent leaf elements
            ├── fluent_project_card.dart
            └── fluent_projects_list.dart
```

## Architectural Highlights

To optimize performance and code structure, this feature splits responsibilities between a **View Model** and a **Controller**.

### 1. The Presentation View Model (`ProjectViewModel`)
Located in `/viewmodels`, the `ProjectViewModel` wraps the domain `ProjectEntity` and exposes individual fields as reactive `Signal` variables:
* **Exposed Signals**: `isFeatured` (featured status) and `status` (publish status).
* **Forwarding Getters**: Non-reactive properties (like `title`, `description`, `category`) are exposed via read-only getters forwarding to the underlying domain entity.

> [!TIP]
> **Why it is useful**:
> - **Granular Updates**: By using signals for specific fields on the View Model, individual project cards can wrap only the toggles/badges (like the star or publish eye icons) in local `SignalBuilder`s.
> - **Performance (Zero Full-List Rebuilds)**: Toggling the featured or published state updates only the single widget observing that property. It avoids rebuilding the entire list of projects or even the whole card.
> - **Purity**: Prevents importing presentation state management packages (like `signals_flutter`) into the core domain layer (`ProjectEntity`).

---

### 2. The Form Controller (`ProjectController`)
Located in `/controllers`, `ProjectController` handles transient user input, state transitions, and business operations when creating or updating a project:
* **Transient State**: Manages stepper steps, input validation, and loading indicators during creation or update.
* **Separation from Display State**: Keeping form editing transient ensures that uncommitted text fields do not affect the main list rendering until the user clicks "Save" and the changes are persisted to the database.

---

## Guidelines to Maintain this Structure

To implement or extend this architecture:

### 1. Keep Platform Isolation Strict
* **Cupertino files (`macos/`):** Only import `package:flutter/cupertino.dart`. Never import Material or Fluent.
* **Fluent files (`windows/`):** Only import `package:fluent_ui/fluent_ui.dart`.
* **Material/Universal files (`others/`):** Only import `package:flutter/material.dart`.

### 2. Leverage the View Model Extension
* Use the helper extension `ProjectViewModelExtension` on lists of view models to sort elements chronologically:
  `projects.value = list.map(ProjectViewModel.new).toList().sortedByDateDesc();`
* This parses `createdAt` dates into actual `DateTime` instances for true chronological sorting rather than simple alphabetical string comparison.

### 3. Minimize Monolithic Code files
* Break down multi-step forms or long card sections into components inside the respective platform `components/` subfolder.
* Pass data and callbacks down from parent dialogs or content areas to keep child elements stateless and easily testable.
