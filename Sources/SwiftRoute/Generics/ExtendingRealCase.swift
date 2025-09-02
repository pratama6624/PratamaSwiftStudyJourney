import Foundation

// MARK: - Definisi Generic Stack
struct Stack<Element> {
    private var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element? {
        return items.popLast()
    }
}

extension Stack {
    var isEmpty: Bool { items.isEmpty }
    var count: Int { items.count }
    var topItem: Element? { items.last }  // ✅ Tambahin ini
}

struct UndoRedoManager<Action> {
    private var undoStack = Stack<Action>()
    private var redoStack = Stack<Action>()

    mutating func perform(_ action: Action) {
        undoStack.push(action)
        redoStack = Stack<Action>() // Reset redo
        print("Performed action: \(action)")
    }

    mutating func undo() -> Action? {
        guard let action = undoStack.pop() else { return nil }
        redoStack.push(action)
        print("Undo action: \(action)")
        return action
    }

    mutating func redo() -> Action? {
        guard let action = redoStack.pop() else { return nil }
        undoStack.push(action)
        print("Redo action: \(action)")
        return action
    }
}

var editor = UndoRedoManager<String>()
editor.perform("Type A")
editor.perform("Type B")
editor.perform("Delete B")

editor.undo() // Undo action: Delete B
editor.undo() // Undo action: Type B
editor.redo() // Redo action: Type B