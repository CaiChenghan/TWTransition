//
//  TWTransitionAnimator.h
//  TWTransition
//
//  Created by 蔡成汉 on 16/9/19.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,TransitionType) {
    TransitionTypeMagicMove = 1,
    TransitionTypeTwo = 2
};

@interface TWTransitionAnimator : NSObject<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic , assign) TransitionType transitionType;

/**
 to转场时间 默认0.5
 */
@property (nonatomic , assign) NSTimeInterval toDuration;

/**
 back转场时间 默认0.5
 */
@property (nonatomic , assign) NSTimeInterval backDuration;


/**
 配置to转场动画
 */
-(void)tw_setToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 配置back转场动画
 */
-(void)tw_setBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
