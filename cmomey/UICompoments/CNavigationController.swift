//
//  CNavigationController.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/13.
//

import UIKit

class CNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.lightGreen!]
        navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.lightGreen!]
        navigationBar.barTintColor = .backgroundBlack
        navigationBar.tintColor = .lightGreen
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = true
    }
    
}
