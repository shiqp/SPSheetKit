//
//  SPSheetPresentationController.swift
//  SPSheetKit
//
//  Created by Qingpu Shi on 2019/7/12.
//

import UIKit

class SPSheetPresentationController: UIPresentationController {
    private let backgroundView = UIView()
    private let dimmingView = UIView()
    private let contentView = UIView()
    private let presentationOrigin: CGFloat
    private let presentationDirection: SPSheetPresentationDirection

    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, presentationOrigin: CGFloat, presentationDirection: SPSheetPresentationDirection) {
        self.presentationOrigin = presentationOrigin
        self.presentationDirection = presentationDirection
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        let size = self.presentedViewController.preferredContentSize
        let originY = self.presentationDirection == .down ? self.presentationOrigin : self.presentationOrigin - size.height
        let origin = CGPoint(x: 0, y: originY)
        return CGRect(origin: origin, size: size)
    }

    override func presentationTransitionWillBegin() {
        self.setupBackgroundView()
        self.setupDimmingView()
        self.setupContentView()
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1.0
            return
        }

        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        })
    }

    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.0
            return
        }

        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
    }

    func setupBackgroundView() {
        guard let containerView = self.containerView else {
            return
        }

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        backgroundView.addGestureRecognizer(recognizer)
        backgroundView.frame = containerView.bounds
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.backgroundColor = .clear

        containerView.addSubview(backgroundView)
    }

    func setupDimmingView() {
        guard let containerView = self.containerView else {
            return
        }

        dimmingView.isUserInteractionEnabled = false
        dimmingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0

        var margin = UIEdgeInsets.zero
        switch self.presentationDirection {
        case .down:
            margin.top = self.presentationOrigin
        default:
            margin.bottom = containerView.bounds.height - self.presentationOrigin
        }
        dimmingView.frame = UIEdgeInsetsInsetRect(containerView.bounds, margin)
        containerView.addSubview(dimmingView)
    }

    func setupContentView() {
        guard let containerView = self.containerView else {
            return
        }

        contentView.frame = self.frameOfPresentedViewInContainerView
        contentView.clipsToBounds = true
        containerView.addSubview(contentView)

        presentedViewController.view.frame = CGRect(origin: .zero, size: self.presentedViewController.preferredContentSize)
        contentView.addSubview(presentedViewController.view)
    }

    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true)
    }
}
