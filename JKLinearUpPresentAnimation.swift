//
//  JKLinearUpPresentAnimation.swift
//  JKPresentationController
//
//  Created by xuequan on 2020/10/14.
//

import UIKit

public class JKLinearUpPresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? JKBaseAlertViewController else {
            return
        }
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        let contentViewFrame = toVC.contentView.frame
        toVC.contentView.frame = CGRect.init(x: contentViewFrame.origin.x, y: contentViewFrame.origin.y + contentViewFrame.size.height, width: contentViewFrame.size.width, height: contentViewFrame.size.height)
        toVC.backView.alpha = 0
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            toVC.contentView.frame = contentViewFrame
            toVC.backView.alpha = 1
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }
}


