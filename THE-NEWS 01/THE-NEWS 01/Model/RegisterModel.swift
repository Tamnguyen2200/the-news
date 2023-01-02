//
//  RegisterModel.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 13/12/2022.
//

import Foundation
struct RegisterModel: Encodable {
    let email: String?
    let password: String?
    let confirmpassword: String?
}
