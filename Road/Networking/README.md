[Back to Main Road](https://github.com/pratama6624/PratamaSwiftStudyJourney/tree/main)

## Road Map (Low-Level Roadmap) - Networking (API/JSON & Codable)

### Networking (API/JSON & Codable)
    On Going

    [ ] Use URLSession + async/await
    [ ] Separate layers: Networking → Service → ViewModel → View
    [ ] Use Result<T, Error> or async throws
    [ ] Define struct/class models conforming to Codable
    [ ] Use JSONDecoder / JSONEncoder
    [ ] Set keyDecodingStrategy & dateDecodingStrategy
    [ ] Use CodingKeys for custom mapping
    [ ] Update state on MainActor (@Published in ViewModel)
    [ ] Update state on MainActor (@Published in ViewModel)
    [ ] Use Task or Combine (DataTaskPublisher)
	[ ] Handle errors (do/try/await/catch) + NetworkError enum
	[ ] Implement retry, timeout, fallback
	[ ] Store API keys/tokens securely in Keychain
	[ ] Use HTTPS (ATS)
	[ ] Use URLCache / NSCache for caching
	[ ] Use URLSessionConfiguration.background for background upload/download
	[ ] Use BGTaskScheduler for background refresh
	[ ] Mock NetworkService for unit testing
	[ ] Test JSON decoding with XCTest
	[ ] Use App Groups to share data between App and Extension/Widget
	[ ] Respect scenePhase to pause/resume tasks
