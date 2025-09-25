[Back to Main Road](https://github.com/pratama6624/PratamaSwiftStudyJourney/tree/main)

## Road Map (Low-Level Roadmap) - Local Data (UserDefaults, Core Data, Keychain)

### Best Practices
    On Going

    [ ] Use @AppStorage for simple key–value data
    Use UserDefaults only for lightweight, non-sensitive data
	[ ] Keep keys consistent and centralized
	[ ] Use @SceneStorage to persist state between scenes
	[ ] Use Core Data for complex structured/local databases
	[ ] Design entities and relationships carefully
	[ ] Use NSPersistentContainer for setup
	[ ] Fetch data with @FetchRequest or NSFetchedResultsController
	[ ] Perform heavy Core Data operations on background contexts
	[ ] Save frequently but efficiently (batch updates, merges)
	[ ] Handle migrations with lightweight migration when possible
	[ ] Use Keychain for sensitive data (tokens, passwords)
	[ ] Store credentials securely, never in UserDefaults
	[ ] Use Apple’s Keychain APIs or wrappers like KeychainAccess
	[ ] Use Access Groups to share Keychain data between apps/extensions
	[ ] Use CloudKit for syncing data across devices in Apple ecosystem
	[ ] Combine CloudKit with Core Data if needed (NSPersistentCloudKitContainer)
	[ ] Encrypt local files if storing private information
	[ ] Keep a single source of truth for local data
	[ ] Respect scenePhase to save state when app moves to background
	[ ] Test data persistence and migration paths with XCTest
	[ ] Handle error states gracefully (disk full, permission denied)
    