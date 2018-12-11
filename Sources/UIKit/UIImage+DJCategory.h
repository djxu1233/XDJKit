//
//  UIImage+DJCategory.h
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DJCategory)

/**
 *  @brief 根据颜色生成纯色图片
 *  @param color 颜色
 *  @return 纯色图片
 */
+ (UIImage *)dj_imageWithColor:(UIColor *)color;

/**
 * @brief 修改图片的尺寸
 * @param size 修改后的尺寸
 */
- (UIImage *)dj_scaleToSize:(CGSize)size;

/**
 @brief 生成一张渐变色的图片
 @param colors 颜色数组（UIColor类型）
 @param startPoint 开始点
 @param endPoint   结束点
 @param rect   图片大小
 @return 返回渐变图片
 */
+ (UIImage *)dj_gradientImageWithColors:(NSArray *)colors
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint
                                   rect:(CGRect)rect;

/**
 * @brief On-screen-renderring绘制UIImage矩形圆角
 * @param radius 圆角的大小
 * @param size   图片的大小
 * @return 返回带圆角的图片
 */
- (UIImage *)dj_imageWithCornerRadius:(CGFloat)radius ofSize:(CGSize)size;

/**
 @brief 画一个倒三角
 @param size 三角形的大小
 @param tintColor 三角形的颜色
 @return 返回三角形图片
 */
+ (UIImage *)dj_triangleImageWithSize:(CGSize)size tintColor:(UIColor *)tintColor;


/**
 * @brief 按给定的方向旋转图片
 * @param orient 旋转的方向
 */
- (UIImage*)dj_rotate:(UIImageOrientation)orient;

/**
 * @brief 图片的压缩处理,先进行图片的缩小处理,然后再进行压处理
 * @param sourceImage 原图片
 * @return 返回NSData
 */
+ (NSData *)dj_zipDataWithImage:(UIImage *)sourceImage;

/**
 * @brief 屏幕截图
 * @param view 截图的view
 */
+ (UIImage *)dj_captureScreen:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
