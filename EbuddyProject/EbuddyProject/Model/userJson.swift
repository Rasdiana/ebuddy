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
   
    enum CodingKeys: String, CodingKey {
        case uid
        case ge
        case phoneNumber = "phone_number"
        case email
        case rating
        case servicePrice = "service_price"
        case media
    }
}

public enum GenderEnum : Int{
    case female = 0
    case male = 1
   
}

