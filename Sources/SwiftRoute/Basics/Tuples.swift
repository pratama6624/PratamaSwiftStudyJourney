//
//  Tuples.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 20/04/25.
//

import Foundation

func analyzePatientData(age: Int, weight: Double, bloodPressure: (systolic: Int, diastolic: Int)) -> (healthStatus: String, advice: String, riskLevel: Int) {
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
    
    return (status, advice, risk)
}

let patientResult = analyzePatientData(age: 55, weight: 95.0, bloodPressure: (systolic: 145, diastolic: 92))

print("Health Status: \(patientResult.healthStatus)")
print("Advice: \(patientResult.advice)")
print("Risk Level: \(patientResult.riskLevel)")
