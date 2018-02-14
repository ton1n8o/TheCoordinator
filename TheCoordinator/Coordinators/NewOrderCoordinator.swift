//
//  NewOrderCoordinator.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/14/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import UIKit

protocol NewOrderCoordinatorDelegate: class {
    func newOrderCoordinatorDidRequestCancel(newOrderCoordinator: NewOrderCoordinator)
    func newOrderCoordinator(newOrderCoordinator: NewOrderCoordinator, didAddOrder: NewOrderCoordinatorPayload)
}

class NewOrderCoordinatorPayload {
    var colorSelected: UIColor?
    var nameSelected: String?
}

class NewOrderCoordinator: RootViewCoordinator {
    
    let services: Services
    var childCoordinators: [Coordinator] = []
    var orderPayload: NewOrderCoordinatorPayload?
    weak var delegate: NewOrderCoordinatorDelegate?
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    init(_ services: Services) {
        self.services = services
    }
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    // MARK:  Functions
    
    func start() {
        let vcColors = ColorsTableViewController.instantiate(fromStoryboardNamed: "Main")
        vcColors.services = services
        vcColors.delegate = self
        navigationController.pushViewController(vcColors, animated: true)
    }
    
}

extension NewOrderCoordinator: ColorsTableViewControllerDelegate {
    
    func colorViewControllerDidTapClose(_ colorViewController: ColorsTableViewController) {
        delegate?.newOrderCoordinatorDidRequestCancel(newOrderCoordinator: self)
    }
    
    func colorViewController(_ colorViewController: ColorsTableViewController, didSelectColor color: UIColor) {
        orderPayload = NewOrderCoordinatorPayload()
        orderPayload?.colorSelected = color
        
        // collecting the name
        let vcName = NameViewController.instantiate(fromStoryboardNamed: "Main")
        vcName.delegate = self
        navigationController.pushViewController(vcName, animated: true)
    }
}

extension NewOrderCoordinator: NameViewControllerDelegate {
    
    func colorViewController(_ nameViewController: NameViewController, didSet name: String) {
        orderPayload?.nameSelected = name
        
        guard let order = orderPayload else {
            return
        }
        
        delegate?.newOrderCoordinator(newOrderCoordinator: self, didAddOrder: order)
    }
    
}
