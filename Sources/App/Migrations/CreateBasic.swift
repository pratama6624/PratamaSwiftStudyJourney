//
//  CreateHuman.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 09/03/25.
//

import Fluent

struct CreateBasic: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("person")
            .id()
            .field("fullname", .string, .required)
            .field("nickname", .string, .required)
            .field("age", .int, .required)
            .field("height", .double, .required)
            .field("weight", .double, .required)
            .field("blood_type", .string, .required)
            .field("is_marriage", .bool, .required)
            .field("species", .string, .required)
            .field("eye_count", .int, .required)
            .field("hand_count", .int, .required)
            .field("heart_count", .int, .required)
            .field("dna_structure", .string, .required)
            .field("needs_oxygen", .bool, .required)
            .field("hobbies", .array(of: .string), .required)
            .field("unique_skills", .array(of: .string), .required)
            .field("contact_info", .json, .required)
            .create()
            
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("person").delete()
    }
}
