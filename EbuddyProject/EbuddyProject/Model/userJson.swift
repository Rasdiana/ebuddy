//
//  userJson.swift
//  EbuddyProject
//
//  Created by Rasdiana Sari on 19/12/24.
//
import Foundation
import SwiftUICore

//COMMIT 6
public struct UserJson : Identifiable, Codable {
    public let id = UUID()
    public let uid: String?
    public let ge: Int?
    public let phoneNumber : String?
    public let email : String?
    public let rating : Float?
    public let servicePrice : Int?
    public let media : String?
    public let gender : String?
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.ge = try container.decodeIfPresent(Int.self, forKey: .ge)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.rating = try container.decodeIfPresent(Float.self, forKey: .rating)
        self.servicePrice = try container.decodeIfPresent(Int.self, forKey: .servicePrice)
        self.media = try container.decodeIfPresent(String.self, forKey: .media)
        self.gender = try container.decodeIfPresent(String.self, forKey: .media)
    }
   
    enum CodingKeys: String, CodingKey {
        case uid
        case ge
        case phoneNumber = "phone_number"
        case email
        case rating
        case servicePrice = "service_price"
        case media
        case gender
    }
    
    
//    func getGenderStatus() -> GenderEnum{
//        return gender == String(ge ?? 0) ? .female : .male
//    }
}

public enum GenderEnum : Int{
    case female = 0
    case male = 1
   
}

