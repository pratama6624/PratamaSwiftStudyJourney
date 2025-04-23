//
//  UserError.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 24/04/25.
//

import Vapor

extension UserError: AbortError {
    var status: HTTPResponseStatus {
        switch self {
        case .invalidAge:
            return .badRequest
        case .missingName:
            return .unprocessableEntity
        }
    }
    
    var reason: String {
        switch self {
        case .invalidAge:
            return "Age must be a positive number."
        case .missingName:
            return "Name is required."
        }
    }
}
