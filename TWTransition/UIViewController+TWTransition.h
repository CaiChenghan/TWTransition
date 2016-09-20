//
//  UIViewController+TWTransition.h
//  TWTransition
//
//  Created by 蔡成汉 on 16/9/19.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWTransitionAnimator.h"

@interface UIViewController (TWTransition)

/**
 transitionAnimator
 */
@property (nonatomic , strong) TWTransitionAnimator *transitionAnimator;

@end
