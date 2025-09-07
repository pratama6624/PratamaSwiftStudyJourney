// Sample Basic
public enum Direction: String {
    case north = "N"
    case south = "S"
}

internal enum ApiResponse {
    case success(data: String)
    case failure(error: CustomError)
}

// Error bree
// fileprivate struct CustomError {
//     let message: String
// }

internal struct CustomError {
    let message: String
}