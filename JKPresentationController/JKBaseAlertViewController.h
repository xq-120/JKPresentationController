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

/** 默认YES。 */
@property (nonatomic, assign) BOOL shouldDismissOnTouchBackView;

@property (nonatomic, assign) NSInteger tag;

@property (nonatomic, readonly, strong) UIView *contentView;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
