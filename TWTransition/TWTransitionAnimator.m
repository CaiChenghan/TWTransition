//
//  TWTransitionAnimator.m
//  TWTransition
//
//  Created by 蔡成汉 on 16/9/19.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "TWTransitionAnimator.h"
#import "UIViewController+TWTransition.h"
#import "TWTransitionAnimator+MagicMove.h"

/**
 私有转场动画类
 */
@interface _TWTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

/**
 duration
 */
@property (nonatomic , assign) NSTimeInterval duration;

/**
 animatorConfig
 */
@property (nonatomic , copy) void(^config)(id<UIViewControllerContextTransitioning>transitionContext);


/**
 重写init方法

 @param duration duration
 @param config   config

 @return _TWTransitionAnimator
 */
-(instancetype)_initObjectWithDuration:(NSTimeInterval)duration animationBlock:(void(^)(id<UIViewControllerContextTransitioning>transitionContext))config;

@end

@implementation _TWTransitionAnimator

#pragma mark - UIViewControllerAnimatedTransitioning

/**
 重写init方法
 
 @param duration duration
 @param config   config
 
 @return _TWTransitionAnimator
 */
-(instancetype)_initObjectWithDuration:(NSTimeInterval)duration animationBlock:(void(^)(id<UIViewControllerContextTransitioning>transitionContext))config
{
    self = [super init];
    if (self)
    {
        _duration = duration;
        _config = config;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return _duration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (_config)
    {
        _config(transitionContext);
    }
}

@end



@interface TWTransitionAnimator ()

/**
 toTransition
 */
@property (nonatomic , strong) _TWTransitionAnimator *toTransition;

/**
 backTranstion
 */
@property (nonatomic , strong) _TWTransitionAnimator *backTranstion;

@end

@implementation TWTransitionAnimator

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _toDuration = _backDuration = 0.5;
    }
    return self;
}

-(_TWTransitionAnimator *)toTransition
{
    if (_toTransition == nil)
    {
        __weak typeof(self)weakSelf = self;
        _toTransition = [[_TWTransitionAnimator alloc]_initObjectWithDuration:_toDuration animationBlock:^(id<UIViewControllerContextTransitioning> transitionContext) {
            [weakSelf tw_setToAnimation:transitionContext];
        }];
    }
    return _toTransition;
}

-(_TWTransitionAnimator *)backTranstion
{
    if (_backTranstion == nil)
    {
        __weak typeof(self)weakSelf = self;
        _backTranstion = [[_TWTransitionAnimator alloc]_initObjectWithDuration:_backDuration animationBlock:^(id<UIViewControllerContextTransitioning> transitionContext) {
            [weakSelf tw_setBackAnimation:transitionContext];
        }];
    }
    return _backTranstion;
}

/**
 配置to转场动画
 */
-(void)tw_setToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (_transitionType == TransitionTypeMagicMove)
    {
        [self tw_setMagicMoveToAnimation:transitionContext];
    }
}

/**
 配置back转场动画
 */
-(void)tw_setBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (_transitionType == TransitionTypeMagicMove)
    {
        [self tw_setMagicMoveBackAnimation:transitionContext];
    }
}

-(void)setTransitionType:(TransitionType)transitionType
{
    _transitionType = transitionType;
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush)
    {
        if (toVC.transitionAnimator)
        {
            return toVC.transitionAnimator.toTransition;
        }
        else
        {
            return nil;
        }
    }
    else
    {
        if (fromVC.transitionAnimator)
        {
            return fromVC.transitionAnimator.backTranstion;
        }
        else
        {
            return nil;
        }
    }
}

-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return nil;
}


-(void)dealloc
{
    NSLog(@"跳转销毁");
}


@end
