//
//  UIView+DJRect.m
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "UIView+DJRect.h"

@implementation UIView (DJRect)

- (void)setDj_x:(CGFloat)dj_x {
    CGRect frame = self.frame;
    frame.origin.x = dj_x;
    self.frame = frame;
}

- (CGFloat)dj_x {
    return self.frame.origin.x;
}

- (void)setDj_y:(CGFloat)dj_y {
    CGRect frame = self.frame;
    frame.origin.y = dj_y;
    self.frame = frame;
}

- (CGFloat)dj_y {
    return self.frame.origin.y;
}

- (void)setDj_width:(CGFloat)dj_width {
    CGRect frame = self.frame;
    frame.size.width = dj_width;
    self.frame = frame;
}

- (CGFloat)dj_width {
    return self.frame.size.width;
}

- (void)setDj_height:(CGFloat)dj_height {
    CGRect frame = self.frame;
    frame.size.height = dj_height;
    self.frame = frame;
}

- (CGFloat)dj_height {
    return self.frame.size.height;
}

- (void)setDj_size:(CGSize)dj_size {
    CGRect frame = self.frame;
    frame.size = dj_size;
    self.frame = frame;
}

- (CGSize)dj_size {
    return self.frame.size;
}

- (void)setDj_origin:(CGPoint)dj_origin {
    CGRect frame = self.frame;
    frame.origin = dj_origin;
    self.frame = frame;
}

- (CGPoint)dj_origin {
    return self.frame.origin;
}

- (void)setDj_centerX:(CGFloat)dj_centerX {
    CGPoint center = self.center;
    center.x = dj_centerX;
    self.center = center;
}

- (CGFloat)dj_centerX {
    return self.center.x;
}

- (void)setDj_centerY:(CGFloat)dj_centerY {
    CGPoint center = self.center;
    center.y = dj_centerY;
    self.center = center;
}

- (CGFloat)dj_centerY {
    return self.center.y;
}

- (void)setDj_maxX:(CGFloat)dj_maxX {
    CGRect frame = self.frame;
    frame.origin.x = dj_maxX - frame.size.width;
    self.frame = frame;
}

- (CGFloat)dj_maxX {
    return CGRectGetMaxX(self.frame);
}

- (void)setDj_maxY:(CGFloat)dj_maxY {
    CGRect frame = self.frame;
    frame.origin.y = dj_maxY - frame.size.height;
    self.frame = frame;
}

- (CGFloat)dj_maxY {
    return CGRectGetMaxY(self.frame);
}

- (void)setDj_top:(CGFloat)dj_top {
    CGRect frame = self.frame;
    frame.origin.y = dj_top;
    self.frame = frame;
}

- (CGFloat)dj_top {
    return self.frame.origin.y;
}

- (void)setDj_bottom:(CGFloat)dj_bottom {
    CGRect frame = self.frame;
    frame.origin.y = dj_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)dj_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setDj_left:(CGFloat)dj_left {
    CGRect frame = self.frame;
    frame.origin.x = dj_left;
    self.frame = frame;
}

- (CGFloat)dj_left {
    return self.frame.origin.x;
}

- (void)setDj_right:(CGFloat)dj_right {
    CGRect frame = self.frame;
    frame.origin.x = dj_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)dj_right {
    return self.frame.origin.x + self.frame.size.width;
}


@end
