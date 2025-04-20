//
//  BookDTO.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 20/04/25.
//

import Vapor

struct BookDTO: Content {
    var title: String
    var author: String
    var publicationYear: Int?
    var summary: String?
}
