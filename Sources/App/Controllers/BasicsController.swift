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
}
