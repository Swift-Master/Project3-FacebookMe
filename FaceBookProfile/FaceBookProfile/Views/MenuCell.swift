import UIKit
class MenuCell: UITableViewCell {
    
    // MARK: - 변수 및 상수
    static let identifier = "reused"
    var imageName : String?
    var cellHeight : Double?
    
    // MARK: - 프로필 셀 대응을 위해 style은 subtitle적용
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - deprecated예정 textlabel, image 대신 contentConfiguration으로 설정합니다.
    func setDefaultProperty(_ cellTitle : String?, _ cellSubTitle : String?, cellTitleColor : UIColor, cellTextAlignment : UIListContentConfiguration.TextProperties.TextAlignment) {
        backgroundColor = UtilDatas.cellStandard.backgroundColor
        var content = self.defaultContentConfiguration()
        content.textProperties.font = UtilDatas.font.large
        content.textProperties.color = cellTitleColor
        content.textProperties.alignment = cellTextAlignment
        content.text = cellTitle
        content.secondaryTextProperties.font = UtilDatas.font.small
        content.secondaryTextProperties.color = .gray
        content.secondaryText = cellSubTitle
        
        if let cellImageName = imageName {
            content.image = UIImage(named: cellImageName)
            // 로그아웃 셀의 경우 높이를 지정
            if let height = cellHeight {
                content.imageProperties.reservedLayoutSize.height = height
            }
        }
        self.contentConfiguration = content
    }
    
    // MARK: - 로그아웃 셀 대응 악세사리 뷰 변경
    func setAccessoryType(_ currentAccessory : UITableViewCell.AccessoryType) {
        accessoryType = currentAccessory
    }
    
}
