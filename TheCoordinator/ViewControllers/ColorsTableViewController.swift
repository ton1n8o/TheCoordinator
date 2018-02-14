//
//  ColorsTableViewController.swift
//  TheCoordinator
//
//  Created by Antonio Carlos on 2/14/18.
//  Copyright © 2018 Antonio Carlos. All rights reserved.
//

import UIKit

protocol ColorsTableViewControllerDelegate: class {
    func colorViewControllerDidTapClose(_ colorViewController: ColorsTableViewController)
    func colorViewController(_ colorViewController: ColorsTableViewController, didSelectColor color: UIColor)
}

class ColorsTableViewController: UITableViewController, StoryboardLoadable {
    
    var services: Services?
    public weak var delegate: ColorsTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 55
        
        self.title = "Select Color"
        self.navigationItem.leftBarButtonItem = self.closeBarButtonItem
    }
    
    let colors = [
        UIColor.blue
        , UIColor.red
        , UIColor.yellow
        , UIColor.purple
        , UIColor.green
        , UIColor.gray
        , UIColor.black
        , UIColor.brown
        , UIColor.darkGray
        , UIColor.cyan
        , UIColor.orange
        , UIColor.magenta
    ]
    
    lazy var closeBarButtonItem: UIBarButtonItem = {
        let closeBarButtonItem = UIBarButtonItem(
            title: "Close", style: .plain, target: self, action: #selector(self.closeButtonTapped)
        )
        return closeBarButtonItem
    }()
    
    // MARK:  Actions
    
    @objc private func closeButtonTapped(sender: UIBarButtonItem) {
        delegate?.colorViewControllerDidTapClose(self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.backgroundColor = color
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.colorViewController(self, didSelectColor: colors[indexPath.row])
    }

}
