//
//  AppDelegate.swift
//  Flickery
//
//  Created by Sameh Mabrouk on 05/10/16.
//  Copyright © 2016 Sameh Mabrouk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let appDependencies = AppDependencies()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UISearchBar.appearance().barTintColor = UIColor.colorFromRGB(0, g: 0, b: 0)
        UISearchBar.appearance().tintColor = UIColor.red
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.colorFromRGB(0, g: 0, b: 0)
        
        appDependencies.installRootViewControllerIntoWindow(window!)
        
        return true
        
    }

}

