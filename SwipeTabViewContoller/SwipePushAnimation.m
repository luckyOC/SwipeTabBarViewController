//
//  SwipePushAnimation.m
//  Fund
//
//  Created by mango on 15/12/18.
//  Copyright © 2015年 mango. All rights reserved.
//

#import "SwipePushAnimation.h"
#import <POP/POP.h>

CGFloat const swipeOffset = 100.f;

CGFloat const animationTime = 0.6f;

@implementation SwipePushAnimation

+ (void)swipePushAnimationFromVC:(UIViewController *)FromVC pushToVC:(UIViewController *)ToVC WithProgress:(CGFloat)progress
{
    CGFloat allProgress = 1 - swipeOffset / SWidth();
    NSTimeInterval duration = animationTime * (progress > 0.1?allProgress-progress:progress);
    
    if (progress > 0.1 && progress <= 1) {
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            //FromVC.view.transform = CGAffineTransformMakeTranslation(SWidth - swipeOffset, 0);
            FromVC.view.layer.transform = CATransform3DMakeTranslation(SWidth() - swipeOffset, 0, 0);
            ToVC.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }else if (progress <= 0.1) {
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            FromVC.view.transform = CGAffineTransformMakeTranslation(0, 0);
            ToVC.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
        } completion:^(BOOL finished) {
            [ToVC.view removeFromSuperview];
        }];
    }else if (progress == 2) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            FromVC.view.layer.transform = CATransform3DMakeTranslation(SWidth() - swipeOffset + 20, 0, 0);
            ToVC.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                FromVC.view.layer.transform = CATransform3DMakeTranslation(SWidth() - swipeOffset, 0, 0);
            } completion:^(BOOL finished) {
                
            }];
        }];
    }
}

@end
