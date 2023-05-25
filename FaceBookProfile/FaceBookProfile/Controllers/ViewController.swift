import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - 테이블뷰, 테이블 데이터
     var tabledProfile = UITableView(frame: .zero, style: .grouped)
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
    
    // MARK: - 테이블 데이터 기반으로 현재 row 정보를 가져옵니다.
     func Row(at indexPath : IndexPath) -> [String] {
        return dataModel[indexPath.section][indexPath.row]
    }
    
    // MARK: - UINavigationBar 관련 설정
    func setNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = #colorLiteral(red: 0.1678575873, green: 0.4667304158, blue: 0.7120113969, alpha: 1)
        // 스크롤이 네비게이션 바 도달 시 적용
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        //일반 상태에 적용
        navigationItem.standardAppearance = navigationBarAppearance
        //소형 아이폰 네비게이션 바에 적용
        navigationItem.compactAppearance = navigationBarAppearance
        navigationController?.setNeedsStatusBarAppearanceUpdate()
        title = "Facebook"
    }
    
    // MARK: - 테이블 뷰 셀 등록, 대리자 설정
    func setTableView() {
        tabledProfile.dataSource = self
        tabledProfile.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
    }
    
    // MARK: - 레이아웃 설정
    func setUI() {
        self.view.addSubview(tabledProfile)
        tabledProfile.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }
}




