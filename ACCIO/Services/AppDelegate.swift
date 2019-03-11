//
//  AppDelegate.swift
//  ACCIO
//
//  Created by Sarvad shetty on 3/10/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        UITabBar.appearance().barTintColor = UIColor.init(51, 1, 54, 1)
        UITabBar.appearance().tintColor = UIColor.init(254, 130, 80, 1)
        UITabBar.appearance().unselectedItemTintColor = UIColor.init(254, 130, 80, 1)
        
        //userdefaults part
        let userdef = UserDefaults.standard
        
        if userdef.object(forKey: KUSERID) == nil{
            DispatchQueue.main.async {
                self.goToLogin()
            }
        }else{
            DispatchQueue.main.async {
                self.goToMain()
            }
        }
        
        return true
    }
    
    func goToLogin(){
        //initialize a storyboard
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        //making root view controller
        self.window?.rootViewController = mainView
    }
    
    func goToMain(){
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tab") as! UITabBarController
        self.window?.rootViewController = mainView
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

