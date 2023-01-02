//
//  ProfileModel.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 21/12/2022.
//

import Foundation

struct updateProfile: Encodable{
    let dateofbirth:String?
    let address:String?
    let phone:Int?
    let sex:Bool?
    let Name:String?
}

struct ResponseProfile: Codable {
    var dateofbirth: String?
    var address: String?
    var phone: Int?
    var created: Int?
    var sex: Bool?
    var Name: String?
    var objectId: String?
    var ownerId: String?
    var welcomeClass: String?
    
    private enum CodingKeys: String, CodingKey{
        case dateofbirth
        case address
        case phone
        case created
        case sex
        case Name
        case objectId = "objectId"
        case ownerId = "ownerId"
        case welcomeClass = "___class"
    }
}
