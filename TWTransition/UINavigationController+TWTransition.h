//
//  UINavigationController+TWTransition.h
//  TWTransition
//
//  Created by 蔡成汉 on 16/9/18.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWTransitionAnimator.h"

@interface UINavigationController (TWTransition)

/**
 自定义转场动画

 @param viewController 目标controller
 @param transitionType 转场类型
 @param animated       是否采用动画
 */
-(void)tw_pushViewController:(UIViewController *)viewController transitionType:(TransitionType)transitionType animated:(BOOL)animated;

@end

