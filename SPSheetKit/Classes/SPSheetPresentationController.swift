//
//  SPSheetPresentationController.swift
//  SPSheetKit
//
//  Created by Qingpu Shi on 2019/7/12.
//

import UIKit

class SPSheetPresentationController: UIPresentationController {
    let dimmingView = UIView()
    let contentView = UIView()

    override var frameOfPresentedViewInContainerView: CGRect {
        let size = self.presentedViewController.preferredContentSize
        let origin = CGPoint(x: 0, y: 100)
        return CGRect(origin: origin, size: size)
    }

    override func presentationTransitionWillBegin() {
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

    func setupDimmingView() {
        guard let containerView = self.containerView else {
            return
        }

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        dimmingView.addGestureRecognizer(recognizer)
        dimmingView.frame = containerView.bounds
        dimmingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0

        containerView.insertSubview(dimmingView, at: 0)
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
