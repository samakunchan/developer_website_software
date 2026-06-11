# Authentication - Data Layer

This layer handles retrieving, saving, and serializing authentication data. It implements the repository interfaces defined in the Domain layer.

## Contents

1. **Models**: Concrete data models extending the Domain Entities (e.g., `UserModel`, `SessionModel`). These models include JSON serialization logic (`fromJson`, `toJson`) which is generated using `freezed` and `json_serializable`.
2. **Data Sources**:
   - **Remote Data Source** (`AuthRemoteDataSource`): Direct HTTP interface talking to the `/auth/api` REST endpoints of the backend using the shared `ApiService`.
   - **Cache Data Source** (`AuthCacheDataSource`): Manages persisting the Bearer access token in cache on the device (e.g., via `SharedPreferences`).
3. **Repository Implementation** (`AuthRepositoryImpl`): Implements `AuthRepository`. It interacts with remote and cache data sources to perform actions like signing in, storing the session token in cache, signing out, and fetching the session user. It converts network models to domain entities and handles errors functionally by returning a `Left(Failure)` or `Right(Data)`.
