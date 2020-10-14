//
//  JKLinearDownPresentAnimation.swift
//  JKPresentationController
//
//  Created by xuequan on 2020/10/14.
//

import UIKit

public class JKLinearDownDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? JKBaseAlertViewController, let _ = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }
        
        let initialFrame = transitionContext.initialFrame(for: fromVC)
        
        let contentViewFrame = fromVC.contentView.frame
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromVC.contentView.frame = CGRect.init(x: contentViewFrame.origin.x, y: contentViewFrame.origin.y + contentViewFrame.size.height, width: contentViewFrame.size.width, height: contentViewFrame.size.height)
            fromVC.backView.alpha = 0
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}

