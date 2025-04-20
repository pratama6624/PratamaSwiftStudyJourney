//
//  MovieDTO.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 20/04/25.
//

import Vapor

// For Optional Binding Test
// Implementasi ke versi Vapor / versi REST API

struct MovieDTO: Content {
    var username: String
    var favoriteMovie: String?
}
