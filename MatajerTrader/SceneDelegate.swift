//
//  SceneDelegate.swift
//  MatajerTrader
//
//  Created by Heba lubbad on 3/25/20.
//  Copyright © 2020 Heba lubbad. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     initAppInterface()
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func initAppInterface()
    {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
      
        let TabBarItemAppearance =  UITabBarItemAppearance()
        TabBarItemAppearance.selected.iconColor = #colorLiteral(red: 0.2745098039, green: 0.2823529412, blue: 0.6235294118, alpha: 1)
        TabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2745098039, green: 0.2823529412, blue: 0.6235294118, alpha: 1) , NSAttributedString.Key.font: UIFont(name: "BahijTheSansArabic-Plain", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)]
        TabBarItemAppearance.normal.iconColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.262745098, alpha: 1)
        TabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.262745098, alpha: 1), NSAttributedString.Key.font:UIFont(name: "BahijTheSansArabic-Plain", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)]
        
        TabBarItemAppearance.focused.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2745098039, green: 0.2823529412, blue: 0.6235294118, alpha: 1) , NSAttributedString.Key.font: UIFont(name: "BahijTheSansArabic-Plain", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)]
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor.white
        tabBarAppearance.backgroundImage = UIImage()
        tabBarAppearance.shadowImage = UIImage()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes = [NSAttributedString.Key.font: UIFont(name: "BahijTheSansArabic-Plain", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular),
                          NSAttributedString.Key.paragraphStyle: paragraphStyle]
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = attributes
   tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = attributes
        tabBarAppearance.stackedLayoutAppearance = TabBarItemAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().shadowImage = UIImage()
        
   
        
    }
    

  


}

