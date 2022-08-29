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
    
    var tagType: Int {
        switch self {
        case .home:
            return 0
        case .setting:
            return 1
        }
    }
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
    
    private func getTabControllers(_ type: TabbarType) -> UINavigationController {
        var returnNavi = UINavigationController()
        switch type {
        case .home:
            let homeVC = HomeTabbarViewController()
            let homeNavi = UINavigationController(rootViewController: homeVC)
            homeVC.tabBarItem = UITabBarItem(title: "home", image: .init(systemName: "house"), tag: type.tagType)
            let homeCoordinator = HomeCoordinator(router: Router(rootController: homeNavi), view: homeVC)
            self.addDependency(homeCoordinator)
            homeCoordinator.start()
            
            returnNavi = homeNavi
        case .setting:
            let settingVC = SettingTabbarViewController()
            let settingNavi = UINavigationController(rootViewController: settingVC)
            settingVC.tabBarItem = UITabBarItem(title: "setting", image: .init(systemName: "gear"), tag: type.tagType)
            let settingCoordinator = SettingCoordinator(router: Router(rootController: settingNavi), view: settingVC)
            self.addDependency(settingCoordinator)
            settingCoordinator.start()
            
            returnNavi = settingNavi
        }
        return returnNavi
    }


}

