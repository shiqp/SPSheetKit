//
//  SPSheetAnimator.swift
//  Pods-SPSheetKit_Example
//
//  Created by Qingpu Shi on 2019/7/18.
//

import UIKit

class SPSheetAnimator: NSObject {
    let duration = 0.3
    let presenting: Bool
    let presentationDirection: SPSheetPresentationDirection

    init(presenting: Bool, presentationDirection: SPSheetPresentationDirection) {
        self.presenting = presenting
        self.presentationDirection = presentationDirection
        super.init()
    }
}

extension SPSheetAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if self.presenting {
            guard let toView = transitionContext.view(forKey: .to) else {
                return
            }

            toView.transform = CGAffineTransform(translationX: 0, y: -toView.frame.height)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                toView.transform = CGAffineTransform.identity
            }) { _ in
                transitionContext.completeTransition(true)
            }
        } else {
            guard let fromView = transitionContext.view(forKey: .from) else {
                return
            }
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                fromView.transform = CGAffineTransform(translationX: 0, y: -fromView.frame.height)
            }) { _ in
                transitionContext.completeTransition(true)
            }
        }
    }
}
