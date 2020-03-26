//
//  AppDelegate.swift
//  MatajerTrader
//
//  Created by Heba lubbad on 3/25/20.
//  Copyright © 2020 Heba lubbad. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initAppInterface()
        return true
    }
    
    
    func initAppInterface()
    {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2745098039, green: 0.2823529412, blue: 0.6235294118, alpha: 1)], for: .selected)
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.262745098, alpha: 1)
        UITabBar.appearance().shadowImage = UIImage()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "BahijTheSansArabic-Plain", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font:UIFont(name: "BahijTheSansArabic-Plain", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)], for: .selected)
        
        
        
    }
    
}
