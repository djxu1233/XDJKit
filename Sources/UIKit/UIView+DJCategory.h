//
//  UIView+DJCategory.h
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIView (DJCategory)

/**
 添加渐变颜色
 @param colors 颜色数组colors:@[UIColor]
 @param startPoint 坐标的起点
 @param endPoint 坐标的结点
 @param rect 视图的大小frame
 @return 返回渐变颜色的layer
 */
+ (CAGradientLayer *)gradientWithColors:(NSArray *)colors
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint
                                   rect:(CGRect)rect;

/** 添加事件*/
- (void)addTarget:(id)target action:(SEL)action;


/**
 获取当前视图的控制器
 
 @return 控制器
 */
- (UIViewController*)superViewController;

@end

NS_ASSUME_NONNULL_END
