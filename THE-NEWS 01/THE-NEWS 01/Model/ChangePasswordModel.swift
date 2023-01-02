//
//  ChangePasswordModel.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 21/12/2022.
//

import Foundation

struct changePassModel: Encodable {
    let currentPassword: String?
    let newPassword: String?
    let confirmpassword: String?
}
