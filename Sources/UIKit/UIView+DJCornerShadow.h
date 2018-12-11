//
//  UIView+DJCornerShadow.h
//  TransformDemo
//
//  Created by DJ on 2018/12/7.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DJRectShadowPath) {
    DJRectShadowPathLeft,
    DJRectShadowPathRight,
    DJRectShadowPathTop,
    DJRectShadowPathBottom,
    DJRectShadowPathNoTop,
    DJRectShadowPathAllRect
};

@interface UIView (DJCornerShadow)

/**
 继承于UIView的视图切圆角
 
 @param cornerType 圆角类型， 可看系统自带类型
 @param radius 圆角角度
 */
- (void)dj_setCornerType:(UIRectCorner)cornerType
            cornerRadius:(CGFloat)radius;


/**
 继承于UIView的视图切圆角
 
 @param cornerType 圆角类型， 可看系统自带类型
 @param resize CGSize类型剪切
 */
- (void)dj_setCornerType:(UIRectCorner)cornerType
        cornerSizeRadius:(CGSize)resize;


/**
 @warning 用于特殊需求
 继承于UIView的视图切圆角
 
 @param rect 当前控件frame
 @param cornerType 剪切类型
 @param resize size大小
 */
- (void)dj_setRoundedRect:(CGRect)rect
               CornerType:(UIRectCorner)cornerType
         cornerSizeRadius:(CGSize)resize;

/**
 * @brief 设置继承于UIView的视图切圆角+阴影
 *
 * @param radius 圆角的角度
 * @param shadowColor 阴影的颜色
 * @param shadowOffset 阴影的偏移量
 * @param shadowOpacity 阴影的透明度
 * @param shadowRadius 阴影的角度
 * @param superView 当前要设置圆角阴影的控件的父视图
 */
- (void)dj_setCornerRadius:(CGFloat)radius
               shadowColor:(UIColor *)shadowColor
              shadowOffset:(CGSize)shadowOffset
             shadowOpacity:(float)shadowOpacity
              shadowRadius:(CGFloat)shadowRadius
                 superView:(UIView *)superView;

/**
 * @brief 设置继承于UIView的视图阴影
 *
 * @param shadowColor 阴影颜色
 * @param shadowOffset 阴影的偏移量
 * @param shadowOpacity 阴影的透明度
 * @param shadowRadius 阴影的角度
 * @param shadowPathType 阴影类型
 * @param shadowPathWidth 阴影的宽度
 */
- (void)dj_setShadowPath:(UIColor *)shadowColor
            shadowOffset:(CGSize)shadowOffset
           shadowOpacity:(CGFloat)shadowOpacity
            shadowRadius:(CGFloat)shadowRadius
              shadowType:(DJRectShadowPath)shadowPathType
         shadowPathWidth:(CGFloat)shadowPathWidth;



@end
