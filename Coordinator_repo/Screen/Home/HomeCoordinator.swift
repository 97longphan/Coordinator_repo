//
//  HomeCoordinator.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import Foundation
import UIKit
class HomeCoordinator: BaseCoordinator {
    private let router: RouterProtocol
    private let view: HomeTabbarViewController
    
    init(router: RouterProtocol, view: HomeTabbarViewController) {
        self.router = router
        self.view = view
    }
    
    override func start() {
        dump(childCoordinators)
        showHome()
    }
    
    private func showHome() {
        router.setRootModule(view)
    }
}
