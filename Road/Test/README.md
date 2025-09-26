[Back to Main Road](https://github.com/pratama6624/PratamaSwiftStudyJourney/tree/main)

## Road Map (Low-Level Roadmap) - Unit Test & UI Test

### Unit Test
    On Going

    [ ] Framework - XCTest
    [ ] Structure
        [ ] XCTestCase Subclasses
        [ ] AAA (Arrange–Act–Assert)
    [ ] Dependencies
        [ ] Mock Dependencies
        [ ] Dependency Injection
    [ ] Coverage
        [ ] Core Logic & Edge Cases
        [ ] Measure {}
    [ ] Access - @testable import
    [ ] Stability - Isolated & Idempotent
    [ ] Automation - CI/CD

### UI Test
    On Going

    [ ] Framework - XCTest UI Testing
    [ ] Setup
        [ ] XCUIApplication()
        [ ] XCTWaiter/expectation(for:) Async
    [ ] Scenario
        [ ] Test key flows: login, navigation, data loading
        [ ] Reset app state before each test
        [ ] Mock network responses for stability
    [ ] Devices
        [ ] Test across multiple devices & orientations
    [ ] CI/CD
        [ ] Integrate with CI pipelines
    
### General
    On Going

    [ ] Coverage
        [ ] Track coverage with Xcode tools
        [ ] Cover high-risk modules + edge cases
    [ ] Focus on Critical Paths
        [ ] Test core business flows first
        [ ] Prioritize risky/error-prone parts
    [ ] Automation Tools
        [ ] Use Fastlane for automated runs & reports
        [ ] Trigger tests via GitHub Actions / CI
    [ ] Environment
        [ ] Run on simulators + real devices
        [ ] Test multiple iOS versions & screen sizes
    [ ] Regression
        [ ] Use Snapshot UI Testing to catch UI changes
        [ ] Compare reference snapshots automatically
    [ ] Organization
        [ ] Separate UnitTests & UITests targets
        [ ] Group tests by feature/module
    [ ] Documentation
        [ ] Keep a simple test plan/checklist
        [ ] Note inputs & expected results per test

    