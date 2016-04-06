//
//  SwipePopAnimation.h
//  Fund
//
//  Created by mango on 15/12/18.
//  Copyright © 2015年 mango. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SwipePopAnimation : NSObject

+ (void)swipePopAnimationFromVC:(UIViewController *)FromVC popToVC:(UIViewController *)ToVC WithProgress:(CGFloat)progress animation:(BOOL)animation;

@end
