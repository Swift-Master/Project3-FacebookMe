//
//  ViewController.swift
//  FaceBookProfile
//
//  Created by 최우태 on 2023/04/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = [[Model]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        
        loadData()
        
        print(model.count)
    }
    
    func setupUI() {
        // NavigationBar Color 설정
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.361, green: 0.447, blue: 0.627, alpha: 1.000)
        
        // TableView 스크롤 시, NavigationBar 색상 변경
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.361, green: 0.447, blue: 0.627, alpha: 1.000)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.953, alpha: 1.000)
        
        // ProfileXib 등록
        let profileXib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        tableView.register(profileXib, forCellReuseIdentifier: "ProfileTableViewCell")
        
        // MenuXib 등록
        let menuXib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        tableView.register(menuXib, forCellReuseIdentifier: "MenuTableViewCell")
        
        // LogOutXib 등록
        let logOutXib = UINib(nibName: "LogOutTableViewCell", bundle: nil)
        tableView.register(logOutXib, forCellReuseIdentifier: "LogOutTableViewCell")
        
    }
    
    func loadData() {
        // Section1
        model.append(
            [Model(leftImageName: "bayMax", userName: "BayMax", menuName: nil)]
        )
        
        // Section2
        model.append(
            [Model(leftImageName: "fb_friends", userName: nil, menuName: "Friends")
            ,Model(leftImageName: "fb_events", userName: nil, menuName: "Events")
            ,Model(leftImageName: "fb_groups", userName: nil, menuName: "Groups")
            ,Model(leftImageName: "fb_education", userName: nil, menuName: "CMU")
            ,Model(leftImageName: "fb_town_hall", userName: nil, menuName: "Town Hall")
            ,Model(leftImageName: "fb_games", userName: nil, menuName: "Instant Games")
            ,Model(leftImageName: nil, userName: nil, menuName: "See More...")]
        )
        
        // Section3
        model.append(
            [Model(leftImageName: nil, userName: nil, menuName: "Add Favorites...")]
        )
        
        // Section4
        model.append(
            [Model(leftImageName: "fb_settings", userName: nil, menuName: "Settings")
            ,Model(leftImageName: "fb_privacy_shortcuts", userName: nil, menuName: "Privacy Shortcuts")
            ,Model(leftImageName: "fb_help_and_support", userName: nil, menuName: "Help and Support")]
        )
        
        // Section5
        model.append(
            [Model(leftImageName: "", userName: "", menuName: "Log Out")]
        )
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            // Section1 Profile
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            cell.profileImageView.image = UIImage(named: model[indexPath.section][indexPath.row].leftImageName ?? "")
            cell.userNameLabel.text = model[indexPath.section][indexPath.row].userName
            return cell
        } else if indexPath.section == model.count - 1 {
            // Section5 LogOut
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogOutTableViewCell", for: indexPath) as! LogOutTableViewCell
            return cell
        } else {
            // Section2 ~ Section4
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
            cell.menuImageView.image = UIImage(named: model[indexPath.section][indexPath.row].leftImageName ?? "")
            cell.menuName.text = model[indexPath.section][indexPath.row].menuName
            
            if cell.menuImageView.image == nil {
                cell.rightLabel.text = ""
                cell.menuName.textColor = UIColor(red: 0.361, green: 0.447, blue: 0.627, alpha: 1.000)
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 60
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2 {
            return "FAVORITES"
        }
        return ""
    }
    
}
