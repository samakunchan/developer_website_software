# Authentication - Presentation Layer

This layer handles the visual representation and reactive state management of the Authentication feature on macOS.

## Contents

1. **Signals** (`AuthSignals`): Manages the reactive state of the login flow. Uses `signals_flutter` to expose signals for:
   - `currentUser`: The current signed-in user entity (or null).
   - `isLoading`: A boolean indicating if a background operation is active.
   - `authError`: A string containing login or password reset errors.
   - Exposes methods like `signIn(email, password)` and `signOut()` which invoke the corresponding use cases and update these state signals.
2. **Screens**:
   - `LoginScreen`: Built using `macos_ui` components, featuring standard login forms (email, password, login button).
   - `ForgotPasswordScreen` / `ResetPasswordScreen`: Interfaces for requesting reset mail and resetting passwords.
3. **Widgets**: Custom visual items scoped only to this feature (e.g., auth-specific buttons, error banners).
