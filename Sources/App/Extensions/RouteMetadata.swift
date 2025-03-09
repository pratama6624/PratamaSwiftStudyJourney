//
//  RouteMetadata.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 09/03/25.
//

import Vapor

extension Route {
    @discardableResult
    func withMetadata(_ description: String, _ category: String) -> Route {
        self.description(description)
        self.userInfo["category"] = category
        return self
    }
}
