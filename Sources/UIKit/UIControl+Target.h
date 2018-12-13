//
//  UIControl+Target.h
//  TransformDemo
//
//  Created by DJ on 2018/12/13.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Target)

- (void)addTargetForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

@end
