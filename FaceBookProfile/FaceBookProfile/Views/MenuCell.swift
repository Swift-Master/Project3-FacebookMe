import UIKit
class MenuCell: UITableViewCell {
    
    static let identifier = "reused"
    var imageName : String?
    var cellHeight : Double?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            if let height = cellHeight {
                content.imageProperties.reservedLayoutSize.height = height
            }
        }
        self.contentConfiguration = content
    }
    
    func setAccessoryType(_ currentAccessory : UITableViewCell.AccessoryType) {
        accessoryType = currentAccessory
    }
    
}
