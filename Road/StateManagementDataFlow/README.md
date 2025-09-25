[Back to Main Road](https://github.com/pratama6624/PratamaSwiftStudyJourney/tree/main)

## Road Map (Low-Level Roadmap) - State Management & Data Flow

### Property Wrappers Fundamental
    On Going

    [ ] @State
    [ ] @Binding
    [ ] @StateObject
    [ ] @ObservedObject
    [ ] @EnvironmentObject
    [ ] @Environment
    [ ] @AppStorage
    [ ] @SceneStorage

### Data Flow Between Flows
    On Going

    [ ] One-Way Data Flow
        [ ] Parent - Child parsing Regulat Parameters
    [ ] Two-Way Data Flow
        [ ] Parent - Child via @Binding
    [ ] Global / Shared State
        [ ] ObservableObject + @EnvironmentObject
    [ ] State Across Scenes / App Lifecycle
        [ ] SceneDelegate + @SceneStorage
    
### Pattern Manajemen State
    On Going

    [ ] Combine Framework
        [ ] Publisher
        [ ] Subscriber
        [ ] AnyCancellable
        [ ] ViewModel (ObservableObject) with SwiftUI View
        [ ] Handling Error & Sink Async
    [ ] Swift Concurrency
        [ ] async/await
        [ ] Task
        [ ] TaskGroup
        [ ] Combine & ObservableObject (MainActor) Integration
    [ ] MVVM + SwiftUI
        [ ] ViewModel ObservableObject holds state + logic
        [ ] View displays data
        [ ] ViewModel that updates state
    [ ] Dependency Injection
    [ ] Single Source of Truth

### External Data Integration
    On Going

    [ ] Networking (URLSession/async-await)
        [ ] Get API Data
        [ ] Update state in ViewModel
        [ ] Parsing JSON With Codable
        [ ] Handle loading/error state
    [ ] Local Persistence
        [ ] UserDefaults / @AppStorage
        [ ] Core Data + SwiftUI (@FetchRequest, NSFetchedResultsController)
        [ ] CloudKit (sync between Apple devices)
    [ ] Keychain & Secure Enclave
        [ ] Credential / Token

### Apple Ecosystem Advanced
    On Going

    [ ] Combine + NotificationCenter
        [ ] State update from system events
    [ ] Background Tasks & State
        [ ] Maintain state when app is in background
    [ ] WidgetKit & App Groups
    [ ] App Lifecycle
    [ ] Accessibility & Localization State