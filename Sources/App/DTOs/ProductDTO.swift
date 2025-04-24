//
//  ProductDTO.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 24/04/25.
//

import Vapor

// For Basic Preconditions - Enforcing Preconditions
// Implementasi ke versi Vapor / versi REST API

struct ProductDTO: Content {
    var id: UUID
    var name: String
    var stock: Int
}
