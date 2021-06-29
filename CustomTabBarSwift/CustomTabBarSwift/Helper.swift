//
//  Helper.swift
//  CustomTabBarSwift
//
//  Created by IAPPS on 22/4/21.
//

import Foundation

class Helper {
    
    static var share = Helper()
    var tabBarDelegate: TabBarDelegate?
    
}

protocol TabBarDelegate {
    func isHideTabBar(flag: Bool)
}
