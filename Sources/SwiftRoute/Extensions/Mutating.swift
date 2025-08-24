struct StepCounter {
    var steps: Int
}

extension StepCounter {
    mutating func addSteps(_ count: Int) {
        steps += count
    }

    mutating func resetSteps() {
        steps = 0
    }
}

var mySteps = StepCounter(steps: 1_200)

mySteps.addSteps(400)
print("Total steps today: \(mySteps.steps)") 

// Reset -> Next Day
mySteps.resetSteps()
print("Steps after reset: \(mySteps.steps)") 