//
//  HomeTabbarViewController.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import UIKit

class HomeTabbarViewController: BaseViewController {
    var onPresent: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
    @IBAction func actionResetAuth(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isAuth")
    }
    
    @IBAction func actionPresent(_ sender: Any) {
        onPresent?()
    }
}
