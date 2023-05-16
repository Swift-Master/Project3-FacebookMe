import Foundation

class Menu {
    public var menus : [[[String?]]]?
    
    init(){
        menus = [
            [["bayMax","BayMax \nView your Profile"]]
            ,[
                ["fb_friends","Friends"]
                ,["fb_events","Events"]
                ,["fb_groups","Groups"]
                ,["fb_education","CMU"]
                ,["fb_town_hall","Town Hall"]
                ,["fb_games","Instant Games"]
                ,[nil,"See More"]
            ]
            ,[
                [nil,"Add Favorites"]
            ]
            ,[
                ["fb_settings","Settings"]
                ,["fb_privacy_shortcuts","Privacy Shortcuts"]
                ,["fb_help_and_support","Help and Support"]
            ]
            ,[
                [nil,"Log Out"]
            ]
        ]
    }
}
