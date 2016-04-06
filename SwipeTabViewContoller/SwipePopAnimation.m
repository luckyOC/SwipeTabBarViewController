//
//  SwipePopAnimation.m
//  Fund
//
//  Created by mango on 15/12/18.
//  Copyright © 2015年 mango. All rights reserved.
//

#import "SwipePopAnimation.h"
#import <POP/POP.h>

@implementation SwipePopAnimation

CGFloat const popSwipeOffset = 100.f;
CGFloat const popAnimationTime = 0.6f;

+ (void)swipePopAnimationFromVC:(UIViewController *)FromVC popToVC:(UIViewController *)ToVC WithProgress:(CGFloat)progress animation:(BOOL)animation {
    if (animation) {
        CGFloat allProgress = 1 - popSwipeOffset / SWidth();
        NSTimeInterval duration = popAnimationTime * (progress > 0.1?allProgress-progress:progress);
        if (progress > 0.1 && progress <=1) {
            [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                ToVC.view.transform = CGAffineTransformIdentity;
                FromVC.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
            } completion:^(BOOL finished) {
                [FromVC.view removeFromSuperview];
            }];
        }else if (progress <= 0.1) {
            [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                ToVC.view.transform = CGAffineTransformMakeTranslation(SWidth() - popSwipeOffset, 0);
                FromVC.view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                
            }];
        }else if (progress == 2) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                ToVC.view.layer.transform = CATransform3DMakeTranslation(SWidth() - popSwipeOffset + 20, 0, 0);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    ToVC.view.transform = CGAffineTransformIdentity;
                    FromVC.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
                } completion:^(BOOL finished) {
                    [FromVC.view removeFromSuperview];
                }];
            }];
        }
    }else {
        ToVC.view.transform = CGAffineTransformIdentity;
        FromVC.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
        [FromVC.view removeFromSuperview];
    }
    
}

@end
