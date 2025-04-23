//
//  UserResponseDTO.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 24/04/25.
//

import Vapor

// For Basic Error Handling
// Implementasi ke versi Vapor / versi REST API

enum UserError: Error {
    case invalidAge
    case missingName
}

struct UserRequest: Content {
    var name: String?
    var age: Int?
}

struct UserResponseDTO: Content {
    var message: String
}
