//
//  AppConfig.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 23/04/25.
//

import Vapor

// For Implicitly Unwrapped Optionals
// Implementasi ke versi Vapor / versi REST API

struct AppConfig {
    var appName: String
    var version: String
}

// Gunakan Implicitly Unwrapped Optional
var globalConfig: AppConfig!
