# Authentication - Domain Layer

This is the core business logic layer for the Authentication feature. It is written in pure Dart and does not depend on any Flutter framework classes or specific database/networking implementations.

## Contents

1. **Entities**: Domain models representing core business data structures (e.g., `UserEntity`, `SessionEntity`). These are simple Dart objects that do not know about JSON parsing or server DTO formats.
2. **Repositories (Contracts)**: Abstract class interfaces defining data contracts (e.g., `AuthRepository`). The Data layer is responsible for implementing these contracts.
3. **Use Cases**: Individual classes representing a single application action (e.g., `SignInUseCase`, `SignOutUseCase`). Use cases encapsulate domain logic and call Repository methods.

## Authentication Flows

- **Sign In**: Takes email and password credentials, performs validation, calls repository to authenticate, and returns the active session.
- **Sign Out**: Signs out the current user and invalidates the session.
- **Get Session**: Retrieves current user session state if a token is present in cache.
- **Forgot Password / Reset Password**: Request and complete password reset links.
