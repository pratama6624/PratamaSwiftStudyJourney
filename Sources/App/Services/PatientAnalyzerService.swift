//
//  PatientAnalyzerService.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 20/04/25.
//

import Vapor

struct PatientAnalyzerService {
    static func analyzePatientData(age: Int, weight: Double, bloodPressure: BloodPressure) -> AnalysisResult {
        var status = "Normal"
        var advice = "Maintain current lifestyle"
        var risk = 1
        
        if age > 50 || weight > 90 {
            status = "At Risk"
            advice = "Consider regular check-ups and reduce salt intake"
            risk = 2
        }
        
        if bloodPressure.systolic > 140 || bloodPressure.diastolic > 90 {
            status = "High Blood Pressure"
            advice = "Start hypertension treatment"
            risk = 3
        }
        
        return AnalysisResult(status: status, advice: advice, risk: risk)
    }
}
