//
//  PatientInput.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 20/04/25.
//

import Vapor

// For Tuples Test
// Implementasi dari Tuples di Swift Route ke versi Vapor / versi REST API

struct PatientDTO: Content {
    var age: Int
    var weight: Double
    var bloodPressure: BloodPressure
}

struct BloodPressure: Content {
    var systolic: Int
    var diastolic: Int
}

struct AnalysisResult: Content {
    var status: String
    var advice: String
    var risk: Int
}
