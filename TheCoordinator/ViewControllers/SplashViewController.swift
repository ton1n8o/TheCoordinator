//
//  SplashViewController.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/13/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import UIKit

protocol SplashViewControllerDelegate: class {
    func splashViewDidTapNewOrder(splashViewController: SplashViewController)
}

class SplashViewController: UIViewController, StoryboardLoadable {
    
    // MARK:  Variables
    
    var services: Services?
    public weak var delegate: SplashViewControllerDelegate?

    // MARK:  Initialization
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:  Actions
    
    @IBAction func newOrder(_ sender: Any) {
        delegate?.splashViewDidTapNewOrder(splashViewController: self)
    }
    
}
