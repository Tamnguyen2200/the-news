//
//  Login.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 20/12/2022.
//
import Foundation

struct loginModel: Encodable {
    let login: String?
    let password: String?
}

struct ResponseLogin: Codable {
    var lastLogin: Int?
    var userStatus: String?
    var socialAccount: String?
    var created: Int?
    var email: String?
    var blUserLocale: String?
    var confirmpassword: String?
    var objectId: String?
    var ownerId: String?
    var welcomeClass: String?
    var userToken: String?
    
    private enum CodingKeys: String, CodingKey{
        case lastLogin
        case userStatus
        case socialAccount
        case created
        case email
        case blUserLocale
        case objectId = "objectId"
        case ownerId = "ownerId"
        case welcomeClass = "___class"
        case userToken = "user-token"
    }
}
