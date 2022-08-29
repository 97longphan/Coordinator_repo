//
//  SettingCoordinator.swift
//  Coordinator_repo
//
//  Created by phlong on 29/08/2022.
//

import Foundation
class SettingCoordinator: BaseCoordinator {
    private let router: RouterProtocol
    private let view: SettingTabbarViewController
    
    init(router: RouterProtocol, view: SettingTabbarViewController) {
        self.router = router
        self.view = view
    }
    
    override func start() {
        view.onPush = { [weak self] in
            self?.pushToDetail1()
        }
        showSettingTabbar()
    }
    
    private func showSettingTabbar() {
        router.setRootModule(view)
    }
    
    private func pushToDetail1() {
        let detailVC = FirstDetailViewController()
        router.push(detailVC)
    }
}
