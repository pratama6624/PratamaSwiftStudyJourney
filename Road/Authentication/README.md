[Back to Main Road](https://github.com/pratama6624/PratamaSwiftStudyJourney/tree/main)

## Road Map (Low-Level Roadmap) - Authentication

### Account & Credentials Handling
    On Going

    [ ] Store tokens/credentials securely in Keychain
    [ ] Never store sensitive data in UserDefaults
    [ ] Use Access Groups if sharing credentials with extensions
    [ ] Invalidate tokens properly on logout

### Networking & Security
    On Going

    [ ] Always use HTTPS with App Transport Security (ATS)
    [ ] Send credentials via secure headers or OAuth2 flow
    [ ] Use URLSession + async/await for requests
    [ ] Handle API errors (401, 403) and refresh tokens if needed

### UI & State Management
    On Going

    [ ] Create a dedicated AuthViewModel (ObservableObject)
    [ ] Use @Published state for login/register loading & error
    [ ] Navigate between Auth screens using NavigationStack or sheet
    [ ] Show proper error messages (invalid credentials, network error)

### Apple Ecosystem Integration
    On Going

    [ ] Support Sign in with Apple where possible
    [ ] Integrate Keychain with Apple ID credentials if allowed
    [ ] Use LocalAuthentication (Face ID / Touch ID) for quick re-login
    [ ] Handle App Lifecycle & scenePhase to refresh/revalidate sessions

### Testing & Validation
    On Going

    [ ] Mock auth API for unit/UI tests
    [ ] Validate JSON decoding for login responses with XCTest
    [ ] Test edge cases: expired tokens, network offline, invalid credentials

### Best Practice Flow
    On Going

    [ ] Validate user input locally before sending to API
    [ ] Show loading indicators during network calls
    [ ] Keep auth logic in one place (AuthService) separate from UI
    [ ] Securely persist session data and refresh tokens automatically