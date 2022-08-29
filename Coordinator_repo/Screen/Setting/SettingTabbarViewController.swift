//
//  SettingTabbarViewController.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import UIKit

class SettingTabbarViewController: BaseViewController {
    var onPush: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting"
    }
    @IBAction func actionPush(_ sender: Any) {
        onPush?()
    }
}
