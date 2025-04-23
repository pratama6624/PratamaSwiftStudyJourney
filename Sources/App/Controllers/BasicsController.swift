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
    func appInfo(req: Request) async throws -> Response {
        let message = "\(globalConfig.appName) - Version \(globalConfig.version)"
        let response = ["info": message]
        
        return Response(status: .ok, body: .init(string: try response.encodeToJSONString()))
    }
}
