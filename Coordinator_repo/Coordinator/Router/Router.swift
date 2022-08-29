//
//  Router.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//

import UIKit

final class Router: NSObject, RouterProtocol {
    private weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func setRootModule(_ vc: UIViewController) {
        rootController?.setViewControllers([vc], animated: false)
    }
    
    func push(_ vc: UIViewController) {
        rootController?.pushViewController(vc, animated: true)
    }
    
}
