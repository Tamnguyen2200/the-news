//
//  DANGKIViewController.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 13/12/2022.
//

import UIKit
import SwiftUI

class DANGKIViewController: UIViewController {

    @IBOutlet weak var gmailRegister: UITextField!
    @IBOutlet weak var passwordRegister: UITextField!
    @IBOutlet weak var confirmPasswordRegister: UITextField!
    
    @IBOutlet weak var gmailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var confirmError: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    
    @IBAction func gmailChanged(_ sender: Any)
    {
        if let gmail = gmailRegister.text
        {
            if let errorMessage = invalidGmail (gmail)
            {
                gmailError.text = errorMessage
                gmailError.isHidden = false
            }
            else
            {
                gmailError.isHidden = true
            }
        }
    }
    
    func invalidGmail(_ value: String) -> String?
    {
        let reqularExpression = "[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Error Format"
        }
        return nil
    }
    
    @IBAction func passwordChanged(_ sender: Any)
    {
        if let  passwordNumber = passwordRegister.text
        {
            if let errorMessage = invalidPasswordNumber (passwordNumber)
            {
                passwordError.text = errorMessage
                passwordError.isHidden = false
            }
            else
            {
                passwordError.isHidden = true
            }
        }
    }
    
    func invalidPasswordNumber(_ value: String) -> String?
    {
        let reqularExpression = "[A-Z0-9a-z.%+-]+[A-Za-z0-9.-]"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Error Format"
        }
        return nil
    }
    
    @IBAction func confirmChanged(_ sender: Any)
    {
        let  passwordNumber = passwordRegister.text
        if let  confirmPassword = confirmPasswordRegister.text
        {
            if let errorMessage = invalidConfirmPassword (confirmPasswordvalue:confirmPassword, Passwordvalue: passwordNumber!)
            {
                confirmError.text = errorMessage
                confirmError.isHidden = false
            }
            else
            {
                confirmError.isHidden = true
            }
        }
    }
    
    func invalidConfirmPassword(confirmPasswordvalue: String, Passwordvalue: String) -> String?
    {
        if confirmPasswordvalue != Passwordvalue
        {
          return  " Did is not at same"
        }
        return nil
    }
    
    
    @IBAction func submitAction(_ sender: Any)
    {
        guard let gmail = self.gmailRegister.text,
              let password = self.passwordRegister.text,
              let confirmPassword = self.confirmPasswordRegister.text else {return}
        if gmail.isEmpty && password.isEmpty && confirmPassword.isEmpty {
            print("err")
        }
        else
        {
            let regiter = RegisterModel (email: gmail, password: password, confirmpassword: confirmPassword)
            APIManager.shareInstance.callingRegisterAPI(register: regiter){result in
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
    
    
    
