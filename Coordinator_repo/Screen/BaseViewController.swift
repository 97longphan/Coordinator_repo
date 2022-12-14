//
//  BaseViewController.swift
//  Coordinator_repo
//
//  Created by phlong on 26/08/2022.
//
import UIKit
class BaseViewController: UIViewController {
    init() {
        super.init(nibName: Self.className, bundle: Bundle(for: type(of: self)))
    }
    
    @available(iOS, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(NSStringFromClass(self.classForCoder) + "." + #function)
    }
    
    deinit {
        print(NSStringFromClass(self.classForCoder) + "." + #function)
        NotificationCenter.default.removeObserver(self)
    }
    
    func bindViewModel() {}
    func setupViews() {}
    
}

public extension NSObject {
    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}

