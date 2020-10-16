//
//  JKLinearDownPresentAnimation.swift
//  JKPresentationController
//
//  Created by xuequan on 2020/10/14.
//

import UIKit

public class JKSlideOutToBottomDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from), let _ = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }
        
        let initialFrame = transitionContext.initialFrame(for: fromVC)
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromVC.view.frame = CGRect.init(origin: CGPoint.init(x: initialFrame.origin.x, y: UIScreen.main.bounds.size.height), size: initialFrame.size)
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}

