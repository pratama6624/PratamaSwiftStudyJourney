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
    var bloodType: String
    
    // Bool
    @Field(key: "is_marriage")
    var isMarriage: Bool
    
    // Contanst
    @Field(key: "species")
    var species: String?
    
    @Field(key: "eye_count")
    var eyeCount: Int?
    
    @Field(key: "hand_count")
    var handCount: Int?
    
    @Field(key: "heart_count")
    var heartCount: Int?
    
    @Field(key: "dna_structure")
    var dnaStructure: String?
    
    @Field(key: "needs_oxygen")
    var needsOxygen: Bool?
    
    // Weird
    @Field(key: "hobbies")
    var hobbies: [String]
    
    @Field(key: "unique_skills")
    var uniqueSkills: [String]
    
    @Field(key: "contact_info")
    var contactInfo: ContactInfo
    
    init() {}
    
    init(id: UUID? = nil, fullname: String, nickname: String, age: Int, height: Double, weight: Double, bloodType: String, isMarriage: Bool = false, species: String? = "Homo sapiens", eyeCount: Int? = 2, handCount: Int? = 2, heartCount: Int? = 1, dnaStructure: String? = "ATCG Sequence", needsOxygen: Bool? = true, hobbies: [String] = [], uniqueSkills: [String] = [], contactInfo: ContactInfo) async throws {
        self.id = id
        self.fullname = fullname
        self.nickname = nickname
        self.age = age
        self.height = height
        self.weight = weight
        self.bloodType = bloodType
        self.isMarriage = isMarriage
        
        // Contanst
        self.species = species ?? "Homo sapiens"
        self.eyeCount = eyeCount ?? 2
        self.handCount = handCount ?? 2
        self.heartCount = heartCount ?? 1
        self.dnaStructure = dnaStructure ?? "ATCG Sequence"
        self.needsOxygen = needsOxygen ?? true
        
        // Weird
        self.hobbies = hobbies
        self.uniqueSkills = uniqueSkills
        self.contactInfo = contactInfo
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
            bloodType: bloodType,
            isMarriage: isMarriage,
            hobbies: hobbies,
            uniqueSkills: uniqueSkills,
            contactInfo: contactInfo
        )
    }
}
