//
//  BookDTO.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 20/04/25.
//

import Vapor

// For Optionals Test
// Implementasi ke versi Vapor / versi REST API

struct BookDTO: Content {
    var title: String
    var author: String
    var publicationYear: Int?
    var summary: String?
}
