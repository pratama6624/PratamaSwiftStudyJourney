import Foundation

// Defining and Calling Asynchronous Functions
func fetchData() async -> String {
    print("Mulai fetch di background...")
    try? await Task.sleep(nanoseconds: 2_000_000_000)
    return "data berhasil diambil"
}
func main() {
    Task {
        print("Memulai task")
        let result = await fetchData()
        print(result)
        print("Selesai")
    }
}
main()
RunLoop.main.run() // Agar CLI tidak berhenti dan mau menunggu