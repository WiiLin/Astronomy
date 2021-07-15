//
//  CAstronomyListViewController.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/13.
//

import UIKit

class CAstronomyListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
