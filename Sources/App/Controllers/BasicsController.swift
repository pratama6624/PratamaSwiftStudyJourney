//
//  BasicsController.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 09/03/25.
//

import Vapor

struct BasicsController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let basics = routes.grouped("basics")
        
        // GET Request /basics
        basics.get(use: self.getPerson)
            .withMetadata("Get all person", "Basic Controller")
        
        // POST Request /basics
        basics.post(use: self.createPerson)
            .withMetadata("Create new person", "Basic Controller")
        
        // For Tuples Test
        // Implementasi dari Tuples di Swift Route ke versi Vapor / versi REST API
        basics.post("analyze-patient", use: self.analyzePatientData)
            .withMetadata("Check health status", "Basic Controller -> Tuples")
        
        // For Optionals Test
        // Implementasi ke versi Vapor / versi REST API
        basics.post("create-book", use: self.createBook)
            .withMetadata("Create a book", "Basic Controller -> Optionals")
        
        // For Optional Binding Test
        // Implementasi ke versi Vapor / versi REST API
        basics.post("analyze-movie", use: self.analyzeMovie)
            .withMetadata("Analyze movie", "Basic Controller -> Optional Binding")
        
        // For Optional Fallback Value Test
        // Implementasi ke versi Vapor / versi REST API
        basics.post("calculate", use: self.calculateDiscount)
            .withMetadata("Calculate", "Basic Controller -> Optional Fallback Value")
        
        // For Implicitly Unwrapped Optionals
        // Implementasi ke versi Vapor / versi REST API
        basics.post("app-info", use: self.appInfo)
            .withMetadata("App info", "Basic Controller -> Optional Fallback Value")
        
        // For Basic Error Handling
        // Implementasi ke versi Vapor / versi REST API
        basics.post("test-error-handling", use: self.errorHandlingTest)
            .withMetadata("Test error handling", "Basic Controller -> Error Handling")
        
        // For Basic Assertions and Preconditions
        // Implementasi ke versi Vapor / versi REST API
        basics.post("check-score", use: self.checkScore)
            .withMetadata("Test score", "Basic Controller -> Assertions and Preconditions")
        
        // For Basic Assertions - Debugging with Assertions
        // Implementasi ke versi Vapor / versi REST API
        basics.get("check-age", use: self.checkAge)
            .withMetadata("Check age", "Basic Controller -> Debugging with Assertions")
        
        // For Basic Preconditions - Enforcing Preconditions
        // Implementasi ke versi Vapor / versi REST API
        basics.get(":id", use: self.getProduct)
            .withMetadata("Get product", "Basic Controller -> Enforcing Preconditions")
    }
    
    @Sendable
    func getPerson(req: Request) async throws -> [BasicDTO] {
        try await Basic.query(on: req.db).all().map { $0.toBasicDTO() }
    }
    
    @Sendable
    func createPerson(req: Request) async throws -> BasicDTO {
        let person = try req.content.decode(Basic.self)
        
        try await person.create(on: req.db)
        return person.toBasicDTO()
    }
    
    @Sendable
    func analyzePatientData(req: Request) async throws -> AnalysisResult {
        let input = try req.content.decode(PatientDTO.self)
        
        return PatientAnalyzerService.analyzePatientData(age: input.age, weight: input.weight, bloodPressure: input.bloodPressure)
    }
    
    @Sendable
    func createBook(req: Request) async throws -> BookDTO {
        let input = try req.content.decode(BookDTO.self)
        
        return input
    }
    
    @Sendable
    func analyzeMovie(req: Request) async throws -> Response {
        let movie = try req.content.decode(MovieDTO.self)
        
        // Optional Binding with if let
        if let favorite = movie.favoriteMovie {
            let response = ["message": "\(movie.username)'s favorite movie is \(favorite)."]
            return Response(status: .ok, body: .init(string: try response.encodeToJSONString()))
        } else {
            let response = ["message": "We don't know \(movie.username)'s favorite movie"]
            return Response(status: .ok, body: .init(string: try response.encodeToJSONString()))
        }
    }
    
    @Sendable
    func calculateDiscount(req: Request) async throws -> Response {
        let data = try req.content.decode(DisorderDTO.self)
        
        // Fellback Optional Value
        let discount = data.discountPercentage ?? 0
        
        let message = "\(data.username) gets a \(discount)% discount."
        let response = ["message": message]
        return Response(status: .ok, body: .init(string: try response.encodeToJSONString()))
    }
    
    @Sendable
    func appInfo(req: Request) async throws -> String {
        // Cara lama -> return Response
        /*
        let message = "\(globalConfig.appName) - Version \(globalConfig.version)"
        let response = ["info": message]
        
        return Response(status: .ok, body: .init(string: try response.encodeToJSONString()))
         */
        
        // Cara baru dengan swift 6 -> return String
        let appName = req.application.config.appName
        return "Welcome to \(appName)"
    }
    
    @Sendable
    func errorHandlingTest(req: Request) async throws -> UserResponseDTO {
        let data = try req.content.decode(UserRequest.self)
        
        guard let name = data.name, !name.isEmpty else {
            throw UserError.missingName
        }
        
        guard let age = data.age, age > 0 else {
            throw UserError.invalidAge
        }
        
        return UserResponseDTO(message: "Hello \(name), Age \(age)")
    }
    
    @Sendable
    func checkScore(req: Request) async throws -> ScoreResponseDTO {
        let data = try req.content.decode(ScoreRequest.self)
        
        // Assertion : Hanya aktif saat debug
        assert(data.score >= 0, "Score must not be negative!")
        
        // Precondition : Aktif di debug & release
        precondition(!data.name.isEmpty, "Name must not be empty")
        
        return ScoreResponseDTO(message: "Score for \(data.name) is \(data.score)")
    }
    
    @Sendable
    func checkAge(req: Request) async throws -> String {
        let age = try req.query.get(Int.self, at: "age")
        
        // Aplikasi langsung crash jika tidak memenuhi syarat
        // Only for developer, not for end-user
        assert(age >= 0, "A person's age can't be less than zero.")
        
        if age > 17 {
            return "You can vote"
        } else if age >= 0 {
            return "You can't vote yet"
        } else {
            assertionFailure("Age is invalid")
            return "This should never happen"
        }
    }
    
    @Sendable
    func getProduct(req: Request) async throws -> ProductDTO {
        let dummyProducts: [UUID: ProductDTO] = [
            UUID(uuidString: "11111111-1111-1111-1111-111111111111")!: ProductDTO(id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!, name: "MacBook Pro", stock: 15)
        ]
        
        guard let idString = req.parameters.get("id"), let uuid = UUID(uuidString: idString) else {
            throw Abort(.badRequest, reason: "Invalid UUID")
        }
        
        // Preconditions -> Harusnya uuid valid karena sudah melewati guard diatasnya
        precondition(dummyProducts.keys.contains(uuid), "Product with ID \(uuid) must exist in system."
        
        )
        
        // Kalo sudah sampai sini berarti kita sudah yakin ID valid
        guard let product = dummyProducts[uuid] else {
            // Tidak seharusnya terjadi karena state invalid
            preconditionFailure("Product lookup failed despite passing precondition.")
        }
        
        return product
    }
}
