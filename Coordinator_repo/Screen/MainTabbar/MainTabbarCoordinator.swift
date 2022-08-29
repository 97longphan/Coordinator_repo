//
//  MainTabbarCoordinator.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import UIKit

enum TabbarType {
    case home
    case setting
}

class MainTabbarCoordinator: BaseCoordinator {
    private let router: RouterProtocol
    
    var tabBarController: UITabBarController
    
    init(router: RouterProtocol,
         tabBarController: UITabBarController = .init()) {
        self.router = router
        self.tabBarController = tabBarController
    }
    
    override func start() {
        showMainTabbar()
    }
    
    private func showMainTabbar() {
        let tabbarTypes: [TabbarType] = [.home, .setting]
        let viewControllers: [UIViewController] = tabbarTypes.map { getTabControllers($0)}
        prepareTabbarController(viewControllers)
    }
    
    private func prepareTabbarController(_ controllers: [UIViewController]) {
        tabBarController.setViewControllers(controllers, animated: true)
        router.setRootModule(tabBarController)
    }
    
    private func getTabControllers(_ type: TabbarType) -> UIViewController {
        switch type {
        case .home:
            let view = HomeTabbarViewController()
            let vc = HomeCoordinator(router: router, view: view)
            self.addDependency(vc)
            vc.start()
            return view
        case .setting:
            let view = HomeTabbarViewController()
            let vc = HomeCoordinator(router: router, view: view)
            self.addDependency(vc)
            vc.start()
            return view
        }
    }

}

