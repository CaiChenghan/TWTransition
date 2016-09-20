//
//  UIViewController+TWTransition.m
//  TWTransition
//
//  Created by 蔡成汉 on 16/9/19.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "UIViewController+TWTransition.h"
#import <objc/runtime.h>

static char TW_TransitionAnimator;

@implementation UIViewController (TWTransition)

-(void)setTransitionAnimator:(TWTransitionAnimator *)transitionAnimator
{
    objc_setAssociatedObject(self, &TW_TransitionAnimator, transitionAnimator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(TWTransitionAnimator *)transitionAnimator
{
    return objc_getAssociatedObject(self, &TW_TransitionAnimator);
}

@end
