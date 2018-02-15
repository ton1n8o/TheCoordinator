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
    
    // MARK: Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK:  Variables
    
    var services: Services?
    public weak var delegate: SplashViewControllerDelegate?
    
    // MARK:  Initialization
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Orders"
        self.navigationItem.leftBarButtonItem = self.addOrderBarButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    lazy var addOrderBarButtonItem: UIBarButtonItem = {
        let closeBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newOrder))
        return closeBarButtonItem
    }()
    
    // MARK:  Actions
    
    @IBAction func newOrder(_ sender: Any) {
        delegate?.splashViewDidTapNewOrder(splashViewController: self)
    }
    
}

// MARK: - Table view data source

extension SplashViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services?.dataService.orders.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let order = services?.dataService.orders[indexPath.row] else {
            fatalError("services property not initiliazed.")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
        cell.textLabel?.text = order.constumerName
        cell.detailTextLabel?.text = order.color
        return cell
    }
    
}
