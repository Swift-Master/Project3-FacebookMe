import UIKit

public struct UtilDatas {
    
    // MARK: - 테이블 셀 기초 구성요소들
    public struct CellStandard {
        public let backgroundColor : UIColor = .white
        public let titleColor : UIColor = .black
        public let titleAlignment : UIListContentConfiguration.TextProperties.TextAlignment = .natural
        public let logoutTitle = "Log Out"
        public let subTitle = "View your profile"
        public let sectionTitle = "FAVORITES"
        public let accessory : UITableViewCell.AccessoryType = .disclosureIndicator
        public let titleHeight : Double = 66.0
    }
    
    // MARK: - 공통 속성들
    public struct FontSize {
        public let tiny: CGFloat = 10
        public let small: CGFloat = 12
        public let regular: CGFloat = 14
        public let large: CGFloat = 16
    }
    
    public struct Font {
        public let tiny = UIFont.systemFont(ofSize: UtilDatas.fontSize.tiny)
        public let small = UIFont.systemFont(ofSize: UtilDatas.fontSize.small)
        public let regular = UIFont.systemFont(ofSize: UtilDatas.fontSize.regular)
        public let large = UIFont.systemFont(ofSize: UtilDatas.fontSize.large)
        public let smallBold = UIFont.boldSystemFont(ofSize: UtilDatas.fontSize.small)
        public let regularBold = UIFont.boldSystemFont(ofSize: UtilDatas.fontSize.regular)
        public let largeBold = UIFont.boldSystemFont(ofSize: UtilDatas.fontSize.large)
    }
    
    public struct ImageName {
        public let bayMax = "bayMax"
        public let friends = "fb_friends"
        public let events = "fb_events"
        public let groups = "fb_groups"
        public let education = "fb_education"
        public let townHall = "fb_town_hall"
        public let instantGames = "fb_games"
        public let settings = "fb_settings"
        public let privacyShortcuts = "fb_privacy_shortcuts"
        public let helpSupport = "fb_help_and_support"
        public let placeholder = "fb_placeholder"
    }
    
    
    // MARK: - 구조체의 getter역할을 하는 계산속성들
    public static var fontSize: FontSize {
        return FontSize()
    }
    
    public static var font: Font {
        return Font()
    }
    
    public static var imageName: ImageName {
        return ImageName()
    }
    
    public static var cellStandard : CellStandard {
        return CellStandard()
    }
}
