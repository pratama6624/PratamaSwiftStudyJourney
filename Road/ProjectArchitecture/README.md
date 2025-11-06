[Back to Main Road](https://github.com/pratama6624/PratamaSwiftStudyJourney/tree/main)

## Road Map (Low-Level Roadmap) - Project Architecture (MVVM, Clean Code)

### Project Structure
    On Going

    [√] Modules/Folders
    [√] Models
    [√] ViewModels
    [√] Views
    [√] Services
    [√] Utilities
    [√] Resources
    [√] Grouped Folders Xcode Matching Namespaces
    [√] Keep each file small & single-purpose

### MVVM Pattern
    On Going

    [√] Model: Pure data structures, Codable, business logic only
    [√] ViewModel
        [√] ObservableObject
        [√] Holds State & Business Logic
        [√] Talks to Services
        [√] Exposes @Published properties
    [√] View
        [√] SwiftUI View
        [√] Declarative UI bound to ViewModel
        [√] No business logic

### Clean Code Principles
    On Going

    [ ] Single Responsibility for every class/struct
    [ ] Short, meaningful names (camelCase)
    [ ] Use protocols for abstraction & mocking
    [ ] Dependency Injection
        [ ] Pass services into ViewModels instead of hardcoding
    [ ] Avoid “Massive ViewModel” by splitting into smaller components when needed
    [ ] Keep constants and configuration in dedicated files

### Services & Networking
    On Going

    [ ] Create Service Layer
        [ ] AuthService
        [ ] NetworkService
        [ ] DataService
    [ ] Service layer handles
        [ ] All API
        [ ] Database
        [ ] External Calls
    [ ] ViewModel interacts only with Services, not directly with URLSession or Core Data

### State Management
    On Going

    [ ] Single source of truth for shared data
    [ ] Use @StateObject
    [ ] Use @ObservedObject
    [ ] Use @EnvironmentObject appropriately
    [ ] Keep state updates on MainActor

### Error Handling & Logging
    On Going

    [ ] Centralize error types (enums)
    [ ] Propagate errors up from Services to ViewModels
    [ ] Log errors with unified logging (os.log / print in dev, disable in prod)

### Navigation
    On Going

    [ ] Complex Flows
        [ ] Use NavigationStack
        [ ] Use NavigationPath
    [ ] Pass ViewModels or IDs to next screen, not entire objects if possible
    [ ] Keep navigation logic separate from business logic

### Persistence
    On Going

    [ ] Use dedicated Data Layer (Core Data, UserDefaults, Keychain)
    [ ] Abstract persistence behind protocols for testing and flexibility

### Testing
    On Going

    [ ] Use protocols to mock Services for unit testing ViewModels
    [ ] Test ViewModels independently (business logic, state updates)
    [ ] Write UI tests for key flows
    [ ] Keep tests in mirrored folder structure

### Scalability & Maintenance
    On Going

    [ ] Break features into modules (Feature-based foldering)
    [ ] Use Swift Package Manager for shared code if needed
    [ ] Follow Apple naming and file conventions
    [ ] Document public interfaces and architecture decisions

### Apple Ecosystem Integration
    On Going

    [ ] Use @MainActor to ensure UI updates on main thread
    [ ] Respect scenePhase and App Lifecycle in ViewModels
    [ ] Integrate Swift Concurrency and Combine where appropriate
    [ ] Consider WidgetKit/Extension data sharing via App Groups

### General Clean Code Habits
    On Going

    [ ] Remove dead code regularly
    [ ] Prefer composition over inheritance
    [ ] Keep functions small, focus on one task
    [ ] Comment “why”, not “what” (code should be self-explanatory)
    [ ] Lint/format code consistently (SwiftLint, SwiftFormat)
