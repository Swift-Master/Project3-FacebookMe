import UIKit

extension ViewController : UITableViewDataSource {
    
    // MARK: - 헤더뷰의 이름 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // add Favorites 섹션만 제목을 추가
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
        
        // 테이블셀 기초 데이터로 초기화 및 현재 row 이미지, 타이틀 할당
        let currentRow = Row(at: indexPath)
        var currentImageName : String? = currentRow[0]
        let currentTitle = currentRow[1]
        var currentSubTitle : String?
        var currentTitleColor = UtilDatas.cellStandard.titleColor
        var currentTitleAlignment = UtilDatas.cellStandard.titleAlignment
        var currentAccessoryType = UtilDatas.cellStandard.accessory
        
        // logout 섹션이면 이미지, 악세서리 제거 및 타이틀 속성 변환
        if currentTitle == UtilDatas.cellStandard.logoutTitle {
            currentTitleAlignment = .center
            currentTitleColor = .red
            currentAccessoryType = .none
            currentImageName = nil
        // 빈 이미지가 있는 row는 글자색을 파란색으로 변경
        } else if currentImageName == UtilDatas.imageName.placeholder {
            currentTitleColor = .blue
        // 프로필 row는 subTitle 지정 및 cell 높이 재지정
        } else if currentImageName == UtilDatas.imageName.bayMax {
            currentSubTitle = UtilDatas.cellStandard.subTitle
            cell.cellHeight = UtilDatas.cellStandard.titleHeight
        }
        
        // MARK: - 커스텀 테이블 셀 프로퍼티 및 메서드로 셀 구성
        cell.imageName = currentImageName
        cell.setAccessoryType(currentAccessoryType)
        cell.setDefaultProperty(currentTitle, currentSubTitle, cellTitleColor: currentTitleColor, cellTextAlignment: currentTitleAlignment)
        return cell
    }
    
}
