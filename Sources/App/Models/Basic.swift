//
//  Basics.swift
//  PratamaSwiftStudyJourney
//
//  Created by Pratama One on 09/03/25.
//

import Vapor
import Fluent

struct ContactInfo: Content {
    var email: String
    var phone: String
    var address: String
}

// AS Person
final class Basic: Model, Content, Validatable, @unchecked Sendable {
    static let schema = "person"
    
    // UUID String
    @ID(key: .id)
    var id: UUID?
    
    // String
    @Field(key: "fullname")
    var fullname: String
    
    // String
    @Field(key: "nickname")
    var nickname: String
    
    // UInt -> Only positive number
    // But PostgreSQL doesn't support UInt
    @Field(key: "age")
    var age: Int
    
    // Double
    @Field(key: "height")
    var height: Double
    
    // Double
    @Field(key: "weight")
    var weight: Double
    
    // Character
    @Field(key: "blood_type")
    var blood_type: String
    
    // Bool
    @Field(key: "is_marriage")
    var is_marriage: Bool
    
    // Contanst
    @Field(key: "species")
    var species: String
    
    @Field(key: "eye_count")
    var eye_count: Int
    
    @Field(key: "hand_count")
    var hand_count: Int
    
    @Field(key: "heart_count")
    var heart_count: Int
    
    @Field(key: "dna_structure")
    var dna_structure: String
    
    @Field(key: "needs_oxygen")
    var needs_oxygen: Bool
    
    // Weird
    @Field(key: "hobbies")
    var hobbies: [String]
    
    @Field(key: "unique_skills")
    var unique_skills: [String]
    
    @Field(key: "contact_info")
    var contact_info: ContactInfo
    
    init() { }
    
    init(id: UUID? = nil, fullname: String, nickname: String, age: Int, height: Double, weight: Double, blood_type: String, is_marriage: Bool = false, species: String, eye_count: Int, hand_count: Int, heart_count: Int, dna_structure: String, needs_oxygen: Bool = true, hobbies: [String] = [], unique_skills: [String] = [], contact_info: ContactInfo) async throws {
        self.id = id
        self.fullname = fullname
        self.nickname = nickname
        self.age = age
        self.height = height
        self.weight = weight
        self.blood_type = blood_type
        self.is_marriage = is_marriage
        
        // Contanst
        self.species = species
        self.eye_count = eye_count
        self.hand_count = hand_count
        self.heart_count = heart_count
        self.dna_structure = dna_structure
        self.needs_oxygen = needs_oxygen
        
        // Weird
        self.hobbies = hobbies
        self.unique_skills = unique_skills
        self.contact_info = contact_info
    }
    
    static func validations(_ validations: inout Validations) {
        validations.add("fullname", as: String.self, is: .count(3...50))
        validations.add("nickname", as: String.self, is: .count(2...20))
        validations.add("age", as: Int.self, is: .range(0...120))
        validations.add("height", as: Double.self, is: .range(50...300))
        validations.add("weight", as: Double.self, is: .range(20...300))
        validations.add("blood_type", as: String.self, is: .in("A", "B", "AB", "O"))
        validations.add("species", as: String.self, is: .count(3...50))
        validations.add("eye_count", as: Int.self, is: .range(0...10))
        validations.add("hand_count", as: Int.self, is: .range(0...10))
        validations.add("heart_count", as: Int.self, is: .range(0...5))
        validations.add("dna_structure", as: String.self, is: .count(3...50))
        validations.add("hobbies", as: [String].self, is: .count(1...10))
        validations.add("unique_skills", as: [String].self, is: .count(1...10))
    }
    
    func toBasicDTO() -> BasicDTO {
        return BasicDTO(
            id: id,
            fullname: fullname,
            nickname: nickname,
            age: age,
            height: height,
            weight: weight,
            blood_type: blood_type,
            is_marriage: is_marriage,
            hobbies: hobbies,
            unique_skills: unique_skills,
            contact_info: contact_info
        )
    }
}
