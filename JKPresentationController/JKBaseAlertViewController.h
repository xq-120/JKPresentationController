//
//  JKBaseAlertViewController.h
//  JKPresentationController
//
//  Created by xuequan on 2020/9/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKBaseAlertViewController : UIViewController

@property (nonatomic, strong) UIColor *backViewBgColor;

@property (nonatomic, assign) BOOL shouldDismissOnTouchBackView;

@property (nonatomic, readonly, strong) UIView *contentView;

- (instancetype)init;

- (CGRect)finalFrameForContentView;

@end

NS_ASSUME_NONNULL_END
