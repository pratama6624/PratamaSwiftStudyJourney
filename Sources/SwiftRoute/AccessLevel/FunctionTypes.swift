internal struct Person {}
private struct Secret {}

// Error
// func test(secret: Secret) -> Person {
//     return Person()
// }

private func test(secret: Secret) -> Person {
    return Person()
}