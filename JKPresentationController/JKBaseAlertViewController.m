//
//  JKBaseAlertViewController.m
//  JKPresentationController
//
//  Created by xuequan on 2020/9/13.
//

#import "JKBaseAlertViewController.h"
//OC使用Swift需要导入#import <xxx/xxx-Swift.h>
#import <JKPresentationController/JKPresentationController-Swift.h>

@interface JKBaseAlertViewController ()

@end

@implementation JKBaseAlertViewController

- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.view.frame = self.jk_presentedViewFrame;
}


@end
