# Learning Swift – For the Apple Ecosystem

This repository documents my structured journey to deeply learn **Swift**, Apple’s official language for iOS, iPadOS, macOS, watchOS, and tvOS development.

Although I already have experience with Swift, my learning was previously unstructured. Now, I’m following the [official Swift documentation](https://swift.org/documentation/) step-by-step to strengthen my foundation and fill in any gaps.

### What's inside:
- Code examples and experiments  
- Notes from official docs  
- Integration with the [Vapor](https://vapor.codes) framework for server-side Swift  

> Combining client-side and server-side Swift for full-stack mastery.

---

## 🚀 Road to iOS Developer 2027 (High-Level Roadmap)

This section outlines my long-term learning goals to become a professional iOS Developer by early 2027.

```bash
    [ ] Fundamental Programming (Swift)
    [√] Version Control (Git & GitHub)
    [ ] Basic Xcode & SwiftUI/UIKit Familiarity
    [ ] Layouting & Navigation
    [ ] State Management & Data Flow
    [ ] Networking (API/JSON & Codable)
    [ ] Local Data (UserDefaults, Core Data, Keychain)
    [ ] Authentication (Login/Register Basic)
    [ ] Project Architecture (MVVM, Clean Code)
    [ ] Unit Test & UI Test
    [ ] Debugging & Profiling Tools
    [ ] Error Handling & Logging
    [ ] Push Notification & Background Task
    [ ] Working with Media (Camera, Gallery, File)
    [ ] Accessibility & Localization
    [ ] App Lifecycle & SceneDelegate
    [ ] App Performance Optimization
    [ ] Working with Frameworks (MapKit, HealthKit, etc.)
    [ ] App Store Preparation
    [ ] TestFlight & Beta Testing
    [ ] App Store Submission
    [ ] Freelance / Real Project Simulation
    [ ] Contribute to Open Source / Build Personal Portfolio
    [ ] Stay Updated (WWDC, Swift Evolution, Apple Docs)
    [ ] Soft Skills: Problem Solving & Communication
```

> This roadmap serves as a guide to track my growth and keep me accountable.


## Road Map (Low-Level Roadmap)

### Basics
```bash
    Complete
    
    [√] Constants and Variables
    [√] Declaring Constants and Variables
    [√] Type Annotations
    [√] Naming Constants and Variables
    [√] Printing Constants and Variables
    [√] Comments
    [√] Semicolons
    [√] Integers
        [√] Int
        [√] UInt
        [√] Floating-Point Numbers
    [√] Type Safety and Type Inference
    [√] Booleans
    [√] Tuples
    [√] Optionals
    [√] Optional Binding
    [√] Providing a Fallback Value
    [√] Implicitly Unwrapped Optionals
    [√] Error Handling
    [√] Assertions and Preconditions
    [√] Debugging with Assertions
    [√] Enforcing Preconditions
```

### Basic Operators
```bash
    Complete

    [√] Assignment
    [√] Arithmetic
    [√] String
    [√] Remainder or Modulus
    [√] Unary Minus
    [√] Unary Plus
    [√] Compound Assignment
    [√] Comparison Operators
    [√] Ternary Conditional
    [√] Nil-Coalescing Operator
    [√] Range
    [√] Logical
```

### Strings and Characters
```bash
    Complete

    [√] String Literals
    [√] Multiline String Literals
    [√] Special Characters in String Literals
    [√] Extended String Delimiters
    [√] Initializing an Empty String
    [√] String Mutability
    [√] Strings Are Value Types
    [√] Working with Characters
    [√] Concatenating Strings and Characters
    [√] String Interpolation
    [√] Unicode
    [√] Unicode Scalar Values
    [√] Extended Grapheme Clusters
    [√] Counting Characters
    [√] Accessing and Modifying a String
    [√] String Indices
    [√] Inserting and Removing
    [√] Substrings
    [√] Comparing Strings
    [√] String and Character Equality
    [√] Prefix and Suffix Equality
    [√] Unicode Representations of Strings
    [√] UTF-8 Representation
    [√] UTF-16 Representation
    [√] Unicode Scalar Representation
```

### Collection Types
```bash
    Complete

    [√] Mutability of Collections
    [√] Arrays
    [√] Array Type Shorthand Syntax
    [√] Creating an Empty Array
    [√] Creating an Array with a Default Value
    [√] Creating an Array by Adding Two Arrays Together
    [√] Creating an Array with an Array Literal
    [√] Accessing and Modifying an Array
    [√] Iterating Over an Array
    [√] Sets
    [√] Hash Values for Set Types
    [√] Set Type Syntax
    [√] Creating and Initializing an Empty Set
    [√] Creating a Set with an Array Literal
    [√] Accessing and Modifying a Set
    [√] Iterating Over a Set
    [√] Performing Set Operations
    [√] Fundamental Set Operations
        [√] intersection
        [√] symmetric difference
        [√] union
        [√] subtracting
    [√] Set Membership and Equality
        [√] is equal (==)
        [√] isSubset
        [√] isSuperset
        [√] isStrictSubset
        [√] isDisjoint
    [√] Dictionaries
    [√] Dictionary Type Shorthand Syntax
    [√] Creating an Empty Dictionary
    [√] Creating a Dictionary with a Dictionary Literal
    [√] Accessing and Modifying a Dictionary
    [√] Iterating Over a Dictionary
```

### Control Flow
```bash
    Complete

    [√] For-In Loops
    [√] While Loops
    [√] While
    [√] Repeat While
    [√] Conditional Statements
    [√] If
    [√] Switch
        [√] No Implicit Fallthrough
        [√] Interval Matching
        [√] Tuples
        [√] Value Bindings
        [√] Where
        [√] Compound Cases
    [√] Control Transfer Statements
        [√] Continue
        [√] Break
        [√] Break in a Loop Statement
        [√] Break in a Switch Statement
        [√] Fallthrough
        [√] Labeled Statements
    [√] Early Exit
    [√] Deferred Actions
    [√] Checking API Availability
```

### Functions
```bash
    Complete

    [√] Defining and Calling Functions
    [√] Function Parameters and Return Values
    [√] Functions Without Parameters
    [√] Functions With Multiple Parameters
    [√] Functions Without Return Values
    [√] Functions with Multiple Return Values
    [√] Optional Tuple Return Types
    [√] Functions With an Implicit Return
    [√] Function Argument Labels and Parameter Names
    [√] Specifying Argument Labels
    [√] Omitting Argument Labels
    [√] Default Parameter Values
    [√] Variadic Parameters
    [√] In-Out Parameters
    [√] Function Types
    [√] Using Function Types
    [√] Function Types as Parameter Types
    [√] Function Types as Return Types
    [√] Nested Functions
```

### Closures
```bash
    On Going

    [√] Closure Expressions
    [√] The Sorted Method
        [√] Full Closure Expression
        [√] Type Inference
        [√] Implicit Return
        [√] Shorthand Argument Names
        [√] Trailing Closure Syntax
    [√] Closure Expression Syntax
    [ ] Inferring Type From Context
    [ ] Implicit Returns from Single-Expression Closures
    [ ] Shorthand Argument Names
    [ ] Operator Methods
    [ ] Trailing Closures
    [ ] Capturing Values
    [ ] Closures Are Reference Types
    [ ] Escaping Closures
    [ ] Autoclosures
    [√] Closures Challenge
        [√] Filter, Map & Reduce (Case Study 1)
        [√] Filter, Reduce, Sorted & Prefix Advanced (Case Study 2)
        [√] Leaderboard Category Challenge (Case Study 3)
        [√] Top Contributor Tracker (Case Study 4)
```