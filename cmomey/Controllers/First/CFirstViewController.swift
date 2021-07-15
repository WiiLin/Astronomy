//
//  CFirstViewController.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/13.
//

import UIKit

class CFirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func onClickRequest(_: Any) {
        navigationController?.pushViewController(CAstronomyListViewController(), animated: true)
    }
}
