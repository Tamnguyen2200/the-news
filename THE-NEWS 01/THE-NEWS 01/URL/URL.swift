//
//  URL.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 13/12/2022.
//

import Foundation
let app_id = "04FB87AF-B757-A19D-FFD9-534298DF8F00"
let rest_key = "B18F303E-92BC-4382-8534-A44AE866FD76"
let base_url = "https://api.backendless.com/\(app_id)/\(rest_key)"
let register_url = "\(base_url)/users/register"
let login_url = "\(base_url)/users/login"
let changePass_url = "\(base_url)/services/UserService/ChangePassword"
let profile_url = "\(base_url)/data/profile"
