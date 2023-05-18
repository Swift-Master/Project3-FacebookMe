
import UIKit
import SnapKit
class MenuCell: UITableViewCell {
    
    lazy var menuImage = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var menuTitle = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.accessoryType = .disclosureIndicator
        [menuImage,menuTitle].forEach({self.addSubview($0)})
        menuImage.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(10)
            make.verticalEdges.equalToSuperview()
        }
        menuTitle.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalTo(menuImage.snp.trailing).offset(10)
        }
    }
    
}
