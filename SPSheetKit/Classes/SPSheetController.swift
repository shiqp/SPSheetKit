//
//  SPSheetController.swift
//  SPSheetKit
//
//  Created by Qingpu Shi on 2019/7/12.
//

import UIKit

@objc public enum SPSheetPresentationDirection: Int {
    case up
    case down
}

@objc public class SPSheetController: UITableViewController {
    private var presentationOrigin: CGFloat
    private var presentationDirection: SPSheetPresentationDirection

    public var menuItems = [SPSheetMenuItem]()

    public init(presentationOrigin: CGFloat = -1, presentationDirection: SPSheetPresentationDirection) {
        self.presentationOrigin = presentationOrigin
        self.presentationDirection = presentationDirection
        super.init(nibName: nil, bundle: nil)

        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        self.tableView.register(SPSheetCell.self, forCellReuseIdentifier: SPSheetCell.identifier)
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension SPSheetController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SPSheetPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

// MARK: - Table view delegate & data source

extension SPSheetController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SPSheetCell.identifier, for: indexPath) as! SPSheetCell

        let menuItem = self.menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.title
        cell.imageView?.image = menuItem.image

        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }

    public override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
}
