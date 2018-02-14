//
//  RootViewCoordinator.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/13/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import Foundation
import UIKit

public protocol RootViewControllerProvider: class {
    // The coordinators 'rootViewController'. It helps to think of this as the view
    // controller that can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: UIViewController { get }
}

public typealias RootViewCoordinator = Coordinator & RootViewControllerProvider
