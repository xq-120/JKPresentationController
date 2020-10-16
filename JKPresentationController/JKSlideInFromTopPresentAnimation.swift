//
//  JKLinearUpPresentAnimation.swift
//  JKPresentationController
//
//  Created by xuequan on 2020/10/14.
//

import UIKit

public class JKSlideInFromTopPresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }
        let finalFrame = transitionContext.finalFrame(for: toVC)
        toVC.view.frame = CGRect.init(origin: CGPoint.init(x: finalFrame.origin.x, y: -UIScreen.main.bounds.size.height), size: finalFrame.size)
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: []) {
            toVC.view.frame = finalFrame
        } completion: { (finished) in
            transitionContext.completeTransition(true)
        }

    }
}


