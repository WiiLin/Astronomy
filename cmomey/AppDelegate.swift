//
//  AppDelegate.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    public static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CNavigationController(rootViewController: CFirstViewController())
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_: UIApplication) {}

    func applicationDidEnterBackground(_: UIApplication) {}

    func applicationWillEnterForeground(_: UIApplication) {}

    func applicationDidBecomeActive(_: UIApplication) {}

    func applicationWillTerminate(_: UIApplication) {}
}
