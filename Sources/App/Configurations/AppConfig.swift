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

// Cara lama
// Gunakan Implicitly Unwrapped Optional
//var globalConfig: AppConfig!

// Cara baru di swift 6
extension Application {
    private struct AppConfigKey: StorageKey {
        typealias Value = AppConfig
    }
    
    var config: AppConfig {
        get {
            self.storage[AppConfigKey.self]!
        }
        set {
            self.storage[AppConfigKey.self] = newValue
        }
    }
}
