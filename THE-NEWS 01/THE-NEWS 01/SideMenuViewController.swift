//
//  SideMenuViewController.swift
//  THE-NEWS 01
//
//  Created by TamNguyen on 20/12/2022.
//

import UIKit
import SideMenu

class SideMenuViewController: UITabBarController, MenuControllerDelegate{

    private var sideMenu: SideMenuNavigationController?
    private let profileController = ProfileViewController()
    private let changePasswordController = ChangePasswordViewController()
    private let activeController = ActiveUserViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu?.leftSide = true
        
        let menu = MenuController(with: ["Thông Tin Cá Nhân",
                                         "Đổi Mật Khẩu",
                                         "Hoạt Động của tôi",
                                         "Đăng Xuất"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        // Do any additional setup after loading the view.
    }
    func didSelectMenuItems(named: String) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            
            if named == "Thông Tin Cá Nhân" {
                let ScrProfile = self?.storyboard!.instantiateViewController(withIdentifier: "ProfileID") as! ProfileViewController
                self?.navigationController!.pushViewController(ScrProfile, animated: true)
            }
            else if named == "Đổi Mật Khẩu" {
                let ScrChangePass = self?.storyboard!.instantiateViewController(withIdentifier: "ChangePassID") as! ChangePasswordViewController
                self?.navigationController!.pushViewController(ScrChangePass, animated: true)
            }
            else if named == "Hoạt Động của tôi" {
                let ScrActive = self?.storyboard!.instantiateViewController(withIdentifier: "ActiveID") as! ActiveUserViewController
                self?.navigationController!.pushViewController(ScrActive, animated: true)
            }
            else if named == "Đăng Xuất" {
                self?.profileController.view.isHidden = true
                self?.changePasswordController.view.isHidden = true
                self?.activeController.view.isHidden = true
            }
        })
    }

    @IBAction func tappedSideMenu(_ sender: Any) {
        present(sideMenu!, animated: true)
    }
}

protocol MenuControllerDelegate{
    func didSelectMenuItems(named: String)
}

class MenuController: UITableViewController{
    
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [String]
    
    init(with menuItems: [String]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .systemCyan
        view.backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .systemCyan
        cell.contentView.backgroundColor = .systemCyan
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItems(named: selectedItem)
        
    }
}
