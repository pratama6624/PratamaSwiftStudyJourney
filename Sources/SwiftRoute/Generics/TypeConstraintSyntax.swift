import Foundation

// MARK: - Protocol untuk API Endpoint
protocol APIEndpoint {
    var url: URL { get }
}

// MARK: - Implementasi Endpoint User
struct UserEndpoint: APIEndpoint {
    var url: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/users")!
    }
}

// MARK: - Model User
struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let email: String
}

// MARK: - Generic DataFetcher dengan Type Constraint
class DataFetcher {
    func fetchData<T: Decodable, U: APIEndpoint>(from endpoint: U, completion: @escaping (Result<[T], Error>) -> Void) {
        URLSession.shared.dataTask(with: endpoint.url) {
            data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1)))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([T].self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}

// MARK: - Example Usage
let fetcher = DataFetcher()
let endpoint = UserEndpoint()

fetcher.fetchData(from: endpoint) { (result: Result<[User], Error>) in
    switch result {
    case .success(let users):
        print("Berhasil dapat data:")
        for user in users {
            print("- \(user.name) (\(user.email))")
        }
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}