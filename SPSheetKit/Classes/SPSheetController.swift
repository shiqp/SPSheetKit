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

@objc public class SPSheetController: UIViewController {
    private struct Constants {
        static let cellHeight: CGFloat = 44
        static let preferredContentWidth: CGFloat = 300
    }

    public var menuItems = [SPSheetMenuItem]()

    private let presentationOrigin: CGFloat
    private let presentationDirection: SPSheetPresentationDirection

    private let sourceView: UIView?
    private let sourceRect: CGRect?
    private let barButtonItem: UIBarButtonItem?

    private lazy var contentView: UICollectionView = {
        let contentView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        contentView.register(SPSheetCell.self, forCellWithReuseIdentifier: SPSheetCell.identifier)
        contentView.delegate = self
        contentView.dataSource = self
        contentView.backgroundColor = .clear
        return contentView
    }()

    public init(sourceView: UIView, sourceRect: CGRect, presentationOrigin: CGFloat = -1, presentationDirection: SPSheetPresentationDirection) {
        self.presentationOrigin = presentationOrigin
        self.presentationDirection = presentationDirection
        self.sourceView = sourceView
        self.sourceRect = sourceRect
        self.barButtonItem = nil
        super.init(nibName: nil, bundle: nil)

        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }

    public init(barButtonItem: UIBarButtonItem, presentationOrigin: CGFloat = -1, presentationDirection: SPSheetPresentationDirection) {
        self.presentationOrigin = presentationOrigin
        self.presentationDirection = presentationDirection
        self.sourceView = nil
        self.sourceRect = nil
        self.barButtonItem = barButtonItem
        super.init(nibName: nil, bundle: nil)

        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView.frame = self.view.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(self.contentView)

        self.preferredContentSize = CGSize(width: Constants.preferredContentWidth,
                                           height: CGFloat(self.menuItems.count) * Constants.cellHeight)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.view.backgroundColor = SPSheetColors.background
    }

    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        if self.presentationController is SPSheetPresentationController {
            self.dismiss(animated: false)
        }
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension SPSheetController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        if source.traitCollection.horizontalSizeClass == .compact {
            return SPSheetPresentationController(presentedViewController: presented, presenting: presenting)
        }

        let popoverPresentationController = UIPopoverPresentationController(presentedViewController: presented, presenting: presenting)
        popoverPresentationController.backgroundColor = SPSheetColors.background
        popoverPresentationController.delegate = self
        popoverPresentationController.barButtonItem = self.barButtonItem
        popoverPresentationController.sourceView = self.sourceView
        if let sourceRect = self.sourceRect {
            popoverPresentationController.sourceRect = sourceRect
        }
        return popoverPresentationController
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension SPSheetController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - Collection view delegate & data source

extension SPSheetController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuItems.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SPSheetCell.identifier, for: indexPath) as! SPSheetCell
        let menuItem = self.menuItems[indexPath.row]

        cell.titleLabel.text = menuItem.title
        cell.imageView.image = menuItem.image
        cell.setupSubviews()

        if indexPath.row == self.menuItems.count - 1 {
            cell.separator.isHidden = true
        }

        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismiss(animated: true)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: Constants.cellHeight)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
