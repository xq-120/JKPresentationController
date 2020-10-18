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

/** 默认NO。 */
@property (nonatomic, assign) BOOL shouldDismissOnTouchBackView;

@property (nonatomic, assign) NSInteger tag;

@property (nonatomic, readonly, strong) UIView *contentView;

/** shouldDismissOnTouchBackView为YES时，点击蒙层消失回调。 */
@property (nonatomic, copy) void (^dismissOnTouchBackViewBlk)(void);

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
