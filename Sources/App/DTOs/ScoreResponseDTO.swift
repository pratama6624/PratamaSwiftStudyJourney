//
//  ScoreResponseDTO.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 24/04/25.
//

import Vapor

// For Basic Assertions and Preconditions
// Implementasi ke versi Vapor / versi REST API

struct ScoreRequest: Content {
    let name: String
    let score: Int
}

struct ScoreResponseDTO: Content {
    let message: String
}
