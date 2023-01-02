//
//  APIManager.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 13/12/2022.
//

import Foundation
import Alamofire

class APIManager {
    static let shareInstance = APIManager()
    // Đăng Kí
    func callingRegisterAPI(register: RegisterModel, completionhandler: @escaping (Bool) -> ()){
        let headers: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{
            response in
            print(response)
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    completionhandler(true)
                } catch {

                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    // Dăng Nhập
    func callingLoginAPI(Login: loginModel, completionhandler: @escaping (ResponseLogin) -> Void){
        let headers: HTTPHeaders = [.contentType("application/json")]
        AF.request(login_url, method: .post, parameters: Login, encoder: JSONParameterEncoder.default, headers: headers).responseData{
            respones in
            switch respones.result{
            case .success(let data):
                do{
                    let js = try JSONDecoder().decode(ResponseLogin.self, from: data)
                    print(js)
                    completionhandler(js)
                } catch {
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    var tokencode = UserDefaults.standard
    // Thay đỏi Mật khẩu
    func callingChangePassAPI(parame: changePassModel, completionhandler: @escaping (Bool) -> ()){
        let js = tokencode.string(forKey: "accessToken")
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .init(name: "user-token", value: js!)]
        AF.request(changePass_url, method: .post, parameters: parame, encoder: JSONParameterEncoder.default, headers: headers).response{
            response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    completionhandler(true)
                } catch {

                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
    }
    // profile
    func callingProfileAPI(completionhandler: @escaping (ResponseProfile) -> ()){
        let js = tokencode.string(forKey: "accessToken")
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .init(name: "user-token", value: js!)]
        AF.request(profile_url, method: .get, headers: headers).responseData{
            respones in
            switch respones.result{
            case .success(let data):
                do{
                    let js = try JSONDecoder().decode(ResponseProfile.self, from: data)
                    print(js)
                    completionhandler(js)
                } catch {
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    // update
    func callingUpdateProfileAPI(parame: updateProfile, completionhandler: @escaping (Bool) -> ()){
        let js = tokencode.string(forKey: "accessToken")
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .init(name: "user-token", value: js!)]
        AF.request(changePass_url, method: .post, parameters: parame, encoder: JSONParameterEncoder.default, headers: headers).response{
            response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    completionhandler(true)
                } catch {

                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
    }
}


