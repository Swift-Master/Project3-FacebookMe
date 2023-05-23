import UIKit
class MenuCell: UITableViewCell {
    
    static let identifier = "reused"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setDefaultProperty()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDefaultProperty() {
        backgroundColor = .white
        
        var content = self.defaultContentConfiguration()
        content.textProperties.font = UtilDatas.font.large
        content.textProperties.color = .black
        
        content.secondaryTextProperties.font = UtilDatas.font.small
        content.secondaryTextProperties.color = .gray
        
        self.contentConfiguration = content
    }
    
}
