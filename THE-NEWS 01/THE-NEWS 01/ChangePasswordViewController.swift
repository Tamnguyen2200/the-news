//
//  ChangePasswordViewController.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 20/12/2022.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var currentPass: UITextField!
    @IBOutlet weak var newPass: UITextField!
    @IBOutlet weak var confirmNewPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func Verificationbtn(_ sender: Any) {
        let pass1 = currentPass.text
        let pass2 = newPass.text
        let pass3 = confirmNewPass.text
        APIManager.shareInstance.callingChangePassAPI(parame: changePassModel(currentPassword: pass1, newPassword: pass2, confirmpassword: pass3), completionhandler: {_ in
            self.navigationController?.popViewController(animated: true)
        })
    }
}
