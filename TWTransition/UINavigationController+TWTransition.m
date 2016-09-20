//
//  UINavigationController+TWTransition.m
//  TWTransition
//
//  Created by 蔡成汉 on 16/9/18.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "UINavigationController+TWTransition.h"
#import "UIViewController+TWTransition.h"
#import <objc/runtime.h>

@implementation UINavigationController (TWTransition)

+(void)load
{
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(pushViewController:animated:)), class_getInstanceMethod([self class], @selector(_tw_pushViewController:animated:)));
}

/**
 自定义转场动画
 
 @param viewController 目标controller
 @param transitionType 转场类型
 @param animated       是否采用动画
 */
-(void)tw_pushViewController:(UIViewController *)viewController transitionType:(TransitionType)transitionType animated:(BOOL)animated
{
    TWTransitionAnimator *transitionAnimator = [[TWTransitionAnimator alloc]init];
    transitionAnimator.transitionType = transitionType;
    viewController.transitionAnimator = transitionAnimator;
    [self pushViewController:viewController animated:YES];
}

-(void)_tw_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController.transitionAnimator)
    {
        self.delegate = viewController.transitionAnimator;
    }
    [self _tw_pushViewController:viewController animated:animated];
}


@end
