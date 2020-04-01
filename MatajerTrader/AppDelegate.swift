//
//  AppDelegate.swift
//  MatajerTrader
//
//  Created by Heba lubbad on 3/25/20.
//  Copyright © 2020 Heba lubbad. All rights reserved.
//

import UIKit
import CoreData
import SVProgressHUD
import Firebase
import FirebaseMessaging


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
     var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          Thread.sleep(forTimeInterval: 5.0)
         SVProgressHUD.setDefaultMaskType(.clear)
        initAppInterface()
        FirebaseApp.configure()
              registerNotification()
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
    func registerNotification(){
         
       
         let center  = UNUserNotificationCenter.current()
         center.delegate = self
         center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
             if error == nil{
                 DispatchQueue.main.async {
                     UIApplication.shared.registerForRemoteNotifications()
                 }
             }
         }
         Messaging.messaging().delegate = self
         
     }
    
}

extension AppDelegate :MessagingDelegate ,UNUserNotificationCenterDelegate{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String)
    {
        InstanceID.instanceID().instanceID { (result, error) in
            if let error = error {
                print("Error fetching remote instance ID: \(error)")
            } else if let result = result {
                print("Remote instance ID token: \(result.token)")
            }
        }
        print("FCM Token: \(fcmToken)")
      
       
    }
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        registerNotification()
    }
    
 
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("will present user info\(notification.request.content.userInfo)")
 
        completionHandler([.alert, .badge, .sound])
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print(" did rcv user info\(response.notification.request.content.userInfo)")
        completionHandler()
    }
}

