//
//  Dictionary.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 20/04/25.
//

import Vapor

extension Dictionary where Key == String, Value == String {
    func encodeToJSONString() throws -> String {
        let jsonData = try JSONEncoder().encode(self)
        return String(data: jsonData, encoding: .utf8) ?? "{}"
    }
}
