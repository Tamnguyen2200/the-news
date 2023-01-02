//
//  ProfileViewController.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 20/12/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var dateofbirth: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var uibtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        // Do any additional setup after loading the view.
        name.isEnabled = true
        address.isEnabled = true
        sex.isEnabled = true
        dateofbirth.isEnabled = true
        phone.isEnabled = true
        APIManager.shareInstance.callingProfileAPI(completionhandler: { [self] result in
            name.text = result.Name
            address.text = result.address
            if result.sex == true {
                sex.text = "Nam"
            } else {
                sex.text = "Nữ"
            }
            dateofbirth.text = result.dateofbirth
            phone.text = String(result.phone!)
        })
    }

    var isExpanded: Bool = false
    @IBAction func btnTap(_ sender: Any) {
        if !isExpanded {
            name.isEnabled = false
            address.isEnabled = false
            sex.isEnabled = false
            dateofbirth.isEnabled = false
            phone.isEnabled = false
            isExpanded = true
        }
        else {
            isExpanded = false
            
        }
        
        
    }
   

}
