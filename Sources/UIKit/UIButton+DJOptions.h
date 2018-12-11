//
//  UIButton+DJOptions.h
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DJButtonEdgeInsetType) {
    DJTitleBottonImageUpType = 0,//图上字下
    DJTitleUpImageBottonType,//图下字上
    DJTitleLeftImageRightType,//图右字左
    DJTitleRightImageLeftType,//图左字右
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (DJOptions)

- (void)dj_setNormalTitle:(NSString *)title;

- (void)dj_setHightlightedTitle:(NSString *)title;

- (void)dj_setSelectedTitle:(NSString *)title;

- (void)dj_setDiabledTitle:(NSString *)title;

- (void)dj_setNormalTitle:(NSString *)title titleColor:(UIColor *)titleColor;

- (void)dj_setHightlightedTitle:(NSString *)title titleColor:(UIColor *)titleColor;

- (void)dj_setSelectedTitle:(NSString *)title titleColor:(UIColor *)titleColor;

- (void)dj_setDiabledTitle:(NSString *)title titleColor:(UIColor *)titleColor;

- (void)dj_setNormalImage:(NSString *)imageName;

- (void)dj_setHightlightedImage:(NSString *)imageName;

- (void)dj_setSelectedImage:(NSString *)imageName;

- (void)dj_setDiabledImage:(NSString *)imageName;

- (void)dj_setNormalBackgroundImage:(NSString *)imageName;

- (void)dj_setHightedBackgroundImage:(NSString *)imageName;

- (void)dj_setSelectedBackgroundImage:(NSString *)iamgeName;

- (void)dj_setDiabledBackgroundImage:(NSString *)imageName;

-(void)dj_makeButtonEdgeInsetType:(DJButtonEdgeInsetType)type WithSpace:(CGFloat)space;


@end

NS_ASSUME_NONNULL_END
