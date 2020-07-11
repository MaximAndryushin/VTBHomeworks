//
//  AppDelegate.swift
//  HomeWork9
//
//  Created by Maxim Andryushin on 10.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

//MARK: ~RootViewControllerExtencion
extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    var rootViewController: RootViewController {
        return window!.rootViewController as! RootViewController
    }
}

