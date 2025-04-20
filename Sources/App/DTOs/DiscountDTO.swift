//
//  DiscountDTO.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 20/04/25.
//

import Vapor

// For Optional Fallback Value Test
// Implementasi ke versi Vapor / versi REST API

struct DisorderDTO: Content {
    var username: String
    var discountPercentage: Int?
}
