//
//  SwipePushAnimation.h
//  Fund
//
//  Created by mango on 15/12/18.
//  Copyright © 2015年 mango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SwipePushAnimation : NSObject

+ (void)swipePushAnimationFromVC:(UIViewController *)FromVC pushToVC:(UIViewController *)ToVC WithProgress:(CGFloat)progress;

@end
