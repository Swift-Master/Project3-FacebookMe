//
//  Menu.swift
//
//
//  Created by 최우태 on 2023/05/09.
//

import Foundation

class Menu {
    private var menus : [[[String?]]]?
    
    init(){
        menus = [
            [["bayMax","BayMax"]]
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
