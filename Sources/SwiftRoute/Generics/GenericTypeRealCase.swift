struct NavigationStack<Screen> {
    private var screens: [Screen] = []

    mutating func push(_ screen: Screen) {
        screens.append(screen)
        print("Pushed \(screen)")
    }

    mutating func pop() -> Screen? {
        guard !screens.isEmpty else { return nil }
        let removed = screens.removeLast()
        print("Popped \(removed)")
        return removed
    }

    func top() -> Screen? {
        return screens.last
    }
}

enum AppScreen {
    case home, profile, settings
}

var navStack = NavigationStack<AppScreen>()
navStack.push(.home)
navStack.push(.profile)
print(navStack.top()!)  // profile
navStack.pop()          // Popped profile
print(navStack.top()!)  // home