//
//  TWTransitionAnimator+MagicMove.m
//  TWTransition
//
//  Created by 蔡成汉 on 16/9/19.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "TWTransitionAnimator+MagicMove.h"
#import "ViewController.h"
#import "TestViewController.h"

@implementation TWTransitionAnimator (MagicMove)

/**
 setMagicMoveToAnimation
 */
-(void)tw_setMagicMoveToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //fromViewController
    ViewController *fromViewController = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //toViewController
    TestViewController *toViewController = (TestViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //containerView
    UIView *containerView = [transitionContext containerView];
    
    //获取fromViewController的imageView
    UIView *tpView = [fromViewController.firstView snapshotViewAfterScreenUpdates:NO];
    tpView.frame = [fromViewController.firstView convertRect:fromViewController.firstView.bounds toView:containerView];
    
    //containerView 添加子视图
    [containerView addSubview:tpView];
    [containerView insertSubview:toViewController.view belowSubview:tpView];
    
    fromViewController.firstView.hidden = YES;
    toViewController.view.alpha = 0;
    toViewController.secondView.hidden = YES;
    
    //执行动画 -- 将fromViewController的imageView放大到toViewController的imageView上
    [toViewController.view setNeedsLayout];
    [toViewController.view layoutIfNeeded];
    [UIView animateWithDuration:self.toDuration animations:^{
        tpView.frame = [toViewController.secondView convertRect:toViewController.secondView.bounds toView:containerView];
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        tpView.hidden = YES;
        [tpView removeFromSuperview];
        toViewController.secondView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
}

/**
 setMagicMoveBackAnimation
 */
-(void)tw_setMagicMoveBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //fromViewController
    TestViewController *fromViewController = (TestViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //toViewController
    ViewController *toViewController = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //containerView
    UIView *containerView = [transitionContext containerView];
    
    //获取toViewController的imageView
    UIView *tpView = [fromViewController.secondView snapshotViewAfterScreenUpdates:NO];
    tpView.frame = [fromViewController.secondView convertRect:fromViewController.secondView.bounds toView:containerView];
    
    //containerView 添加子视图
    [containerView addSubview:tpView];
    [containerView insertSubview:toViewController.view belowSubview:tpView];
    
    fromViewController.secondView.hidden = YES;
    toViewController.view.alpha = 0;
    toViewController.firstView.hidden = YES;
    
    //执行动画 -- 将fromViewController的imageView放大到toViewController的imageView上
    [toViewController.view setNeedsLayout];
    [toViewController.view layoutIfNeeded];
    [UIView animateWithDuration:self.toDuration animations:^{
        tpView.frame = [toViewController.firstView convertRect:toViewController.firstView.bounds toView:containerView];
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        tpView.hidden = YES;
        [tpView removeFromSuperview];
        toViewController.firstView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
}

@end
