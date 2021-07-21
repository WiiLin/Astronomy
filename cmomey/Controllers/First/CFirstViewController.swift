//
//  CFirstViewController.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/13.
//

import UIKit

class CFirstViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ aneimatd: Bool) {
        super.viewWillAppear(aneimatd)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - Private

private extension CFirstViewController {
    @IBAction func onClickRequest(_: Any) {
        navigationController?.pushViewController(CAstronomyListViewController(), animated: true)
    }
}
