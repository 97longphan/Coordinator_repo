//
//  Presentable.swift
//  Coordinator_repo
//
//  Created by phlong on 29/08/2022.
//

import UIKit

protocol Presentable {
  func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
  
  func toPresent() -> UIViewController? {
    return self
  }
}
