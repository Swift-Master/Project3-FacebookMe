import UIKit
import SnapKit
class ViewController: UIViewController {
    private var tabledProfile = UITableView(frame: .zero, style: .grouped)
    var dataModel :  [[[String]]] {
        return Menu.menus
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setNavigationBar()
        setTableView()
        setUI()
    }
    
    func Row(at indexPath : IndexPath) -> [String] {
        return dataModel[indexPath.section][indexPath.row]
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
        tabledProfile.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
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
        if section == 2 {return UtilDatas.cellStandard.sectionTitle}
        else {return nil}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabledProfile.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
        let currentRow = Row(at: indexPath)
        var currentImageName : String? = currentRow[0]
        let currentTitle = currentRow[1]
        var currentSubTitle : String?
        var currentTitleColor = UtilDatas.cellStandard.titleColor
        var currentTitleAlignment = UtilDatas.cellStandard.titleAlignment
        var currentAccessoryType = UtilDatas.cellStandard.accessory
        
        if currentTitle == UtilDatas.cellStandard.logoutTitle {
            currentTitleAlignment = .center
            currentTitleColor = .red
            currentAccessoryType = .none
            currentImageName = nil
        } else if currentImageName == UtilDatas.imageName.placeholder {
            currentTitleColor = .blue
        } else if currentImageName == UtilDatas.imageName.bayMax {
            currentSubTitle = UtilDatas.cellStandard.subTitle
            cell.cellHeight = 44.0
        }
        cell.imageName = currentImageName
        cell.setAccessoryType(currentAccessoryType)
        cell.setDefaultProperty(currentTitle, currentSubTitle, cellTitleColor: currentTitleColor, cellTextAlignment: currentTitleAlignment)
        return cell
    }
    
}


