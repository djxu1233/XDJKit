//
//  UIButton+DJOptions.m
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "UIButton+DJOptions.h"

@implementation UIButton (DJOptions)

- (void)dj_setNormalTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)dj_setHightlightedTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateHighlighted];
}

- (void)dj_setSelectedTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateSelected];
}

- (void)dj_setDiabledTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateDisabled];
}

- (void)dj_setNormalTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

- (void)dj_setHightlightedTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setTitle:title forState:UIControlStateHighlighted];
    [self setTitleColor:titleColor forState:UIControlStateHighlighted];
}

- (void)dj_setSelectedTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setTitle:title forState:UIControlStateSelected];
    [self setTitleColor:titleColor forState:UIControlStateSelected];
}

- (void)dj_setDiabledTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setTitle:title forState:UIControlStateDisabled];
    [self setTitleColor:titleColor forState:UIControlStateDisabled];
}

- (void)dj_setNormalImage:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)dj_setHightlightedImage:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}

- (void)dj_setSelectedImage:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
}

- (void)dj_setDiabledImage:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateDisabled];
}

- (void)dj_setNormalBackgroundImage:(NSString *)imageName {
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)dj_setHightedBackgroundImage:(NSString *)imageName {
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}

- (void)dj_setSelectedBackgroundImage:(NSString *)iamgeName {
    [self setBackgroundImage:[UIImage imageNamed:iamgeName] forState:UIControlStateSelected];
}

- (void)dj_setDiabledBackgroundImage:(NSString *)imageName {
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateDisabled];
}

- (void)dj_makeButtonEdgeInsetType:(DJButtonEdgeInsetType)type WithSpace:(CGFloat)space {
    switch (type) {
        case DJTitleBottonImageUpType:
        {
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
            
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0 ,-self.imageView.frame.size.width, -self.imageView.frame.size.height - space/2.0,0.0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(-self.titleLabel.intrinsicContentSize.height - space/2.0, 0.0,0.0, -self.titleLabel.intrinsicContentSize.width)];
            
        }
            break;
        case DJTitleUpImageBottonType:
        {
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0 ,-self.imageView.frame.size.width, self.imageView.frame.size.height + space/2.0,0.0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(self.titleLabel.intrinsicContentSize.height + space/2.0, 0.0,0.0, -self.titleLabel.intrinsicContentSize.width)];
            
        }
            break;
        case DJTitleLeftImageRightType:
        {
            self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0 ,-self.imageView.frame.size.width-space/2.0, 0.0,self.imageView.frame.size.width)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0.0, self.titleLabel.intrinsicContentSize.width,0.0, -self.titleLabel.intrinsicContentSize.width-space/2.0)];
        }
            break;
        case DJTitleRightImageLeftType:
        {
            self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0 ,0.0, 0.0, - space/2.0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0.0,  - space/2.0,0.0, 0.0)];
        }
            break;
        default:
            break;
    }
}

@end
