import UIKit
import SnapKit
class ViewController: UIViewController {
    private var tabledProfile = UITableView(frame: .zero, style: .grouped)
    var sectionWithRows = Menu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setNavigationBar()
        setTableView()
        setUI()
    }
    
    func setNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = #colorLiteral(red: 0.1678575873, green: 0.4667304158, blue: 0.7120113969, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationController?.setNeedsStatusBarAppearanceUpdate()
        title = "Facebook"
    }
    
    func setTableView() {
        
        tabledProfile.dataSource = self
        tabledProfile.register(MenuCell.self, forCellReuseIdentifier: "menu")
    }
    
    func setUI() {
        self.view.addSubview(tabledProfile)
        tabledProfile.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        
    }
    
    
}

extension ViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2 {return "Favorites"}
        else {return nil}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        guard let sectionCount = sectionWithRows.menus?.count else{return 0}
        return sectionCount
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let currentRows = sectionWithRows.menus?[section] else {return 0}
        return currentRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabledProfile.dequeueReusableCell(withIdentifier: "menu", for: indexPath) as! MenuCell
        guard let currentMenu = sectionWithRows.menus?[indexPath.section][indexPath.row] else {return cell}
        if let currentImage = currentMenu[0] {
            cell.menuImage.image = UIImage(named: currentImage)
        }else {
            cell.menuTitle.snp.updateConstraints { make in
                make.leading.equalTo(cell.menuImage.snp.trailing).offset(30)
            }
            cell.menuTitle.textColor = .systemBlue
        }
        cell.menuTitle.text = currentMenu[1]
        if currentMenu[1] == "Log Out" {
            cell.menuTitle.textColor = .systemRed
            cell.menuTitle.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            cell.accessoryType = .none
        }
        return cell
    }
}

