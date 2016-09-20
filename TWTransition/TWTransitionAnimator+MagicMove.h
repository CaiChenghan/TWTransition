//
//  TWTransitionAnimator+MagicMove.h
//  TWTransition
//
//  Created by 蔡成汉 on 16/9/19.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "TWTransitionAnimator.h"

@interface TWTransitionAnimator (MagicMove)

/**
 setMagicMoveToAnimation
 */
-(void)tw_setMagicMoveToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 setMagicMoveBackAnimation
 */
-(void)tw_setMagicMoveBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
