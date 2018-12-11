//
//  UIView+DJCategory.m
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "UIView+DJCategory.h"

@implementation UIView (DJCategory)

+ (CAGradientLayer *)gradientWithColors:(NSArray *)colors
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint
                                   rect:(CGRect)rect
{
    if (!colors.count || CGRectEqualToRect(rect, CGRectZero)) {
        return nil;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.frame = rect;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    NSMutableArray *mutColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors) {
        [mutColors addObject:(__bridge id)color.CGColor];
    }
    gradientLayer.colors = [NSArray arrayWithArray:mutColors];
    
    return gradientLayer;
}

- (void)addTarget:(id)target action:(SEL)action {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

/**
 获取当前视图的控制器
 
 @return 控制器
 */
- (UIViewController *)superViewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
