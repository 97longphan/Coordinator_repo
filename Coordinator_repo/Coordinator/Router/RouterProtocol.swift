//
//  RouterProtocol.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//
import UIKit

protocol RouterProtocol {
    func setRootModule(_ presentable: Presentable)
    func push(_ presentable: Presentable)
    func present(_ presentable: Presentable)
    func toRoot()
}
