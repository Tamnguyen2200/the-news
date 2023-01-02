//
//  ViewController.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 13/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gmailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    var tokencode = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitActionlogin(_ sender: Any) {
        let gmailLogin = gmailLogin.text
        let passwordLogin = passwordLogin.text
//        checkgmail(gmaill: gmailLogin!, password: passwordLogin!)
        APIManager.shareInstance.callingLoginAPI(Login: loginModel(login: gmailLogin, password: passwordLogin), completionhandler: {
            result in
            let token = result.userToken
            print(token as Any)
            self.tokencode.set(token, forKey: "accessToken")
            let scr = UIStoryboard(name: "Main", bundle: nil)
            let vcHomeViewController = scr.instantiateViewController(withIdentifier: "HomeID")
            UIApplication.shared.windows.first?.rootViewController = vcHomeViewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        })
    }
    
    func checkgmail (gmaill: String, password: String)
    {
        let gmail = "[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", gmail)
        if !predicate.evaluate(with: gmaill)
        {
            print("err")
        }
        let reqularExpression = "[A-Z0-9a-z.%+-]+[A-Za-z0-9.-]"
        let predicatePass = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicatePass.evaluate(with: password){
            print("err")
        }
    }
    
}

