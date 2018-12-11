//
//  UIView+DJCornerShadow.m
//  TransformDemo
//
//  Created by DJ on 2018/12/7.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "UIView+DJCornerShadow.h"
#import <objc/runtime.h>


@implementation UIView (DJCornerShadow)

- (void)dj_setCornerType:(UIRectCorner)cornerType
            cornerRadius:(CGFloat)radius{
    CGSize size = CGSizeMake(radius, radius);
    [self sign_cornerType:cornerType cornerSizeRadius:size];
}

- (void)dj_setCornerType:(UIRectCorner)cornerType
        cornerSizeRadius:(CGSize)resize{
    [self sign_cornerType:cornerType cornerSizeRadius:resize];
}

- (void)dj_setRoundedRect:(CGRect)rect
               CornerType:(UIRectCorner)cornerType
         cornerSizeRadius:(CGSize)resize{
    self.dj_bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                               byRoundingCorners:cornerType
                                                     cornerRadii:CGSizeMake(resize.width, resize.height)];
    self.dj_shapeLayer = [self get_shapeLayer];
    self.dj_shapeLayer.path = self.dj_bezierPath.CGPath;
    self.layer.mask = self.dj_shapeLayer;
}

- (void)sign_cornerType:(UIRectCorner)cornerType
       cornerSizeRadius:(CGSize)size{
    NSLog(@"width :%f   height : %f",self.frame.size.width,self.frame.size.height);
    self.dj_bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
                                               byRoundingCorners:cornerType
                                                     cornerRadii:CGSizeMake(size.width, size.height)];
    self.dj_shapeLayer = [self get_shapeLayer];
    self.dj_shapeLayer.path = self.dj_bezierPath.CGPath;
    self.layer.mask = self.dj_shapeLayer;
}

- (CAShapeLayer *)get_shapeLayer{
    CAShapeLayer * layers = [CAShapeLayer layer];
    layers.frame = self.bounds;
    return layers;
}

- (void)dj_setCornerRadius:(CGFloat)radius
               shadowColor:(UIColor *)shadowColor
              shadowOffset:(CGSize)shadowOffset
             shadowOpacity:(float)shadowOpacity
              shadowRadius:(CGFloat)shadowRadius
                 superView:(UIView *)superView
{
    /** 首先设置控件的圆角*/
    [self dj_setCornerType:UIRectCornerAllCorners cornerRadius:radius];
    
    /** 然后添加阴影*/
    CALayer *subLayer = [CALayer layer];
    CGRect fixframe = self.frame;
    subLayer.frame = fixframe;
    subLayer.cornerRadius = shadowRadius;
    subLayer.backgroundColor = self.backgroundColor.CGColor;
    subLayer.masksToBounds = NO;//此处必须设置为NO，否则阴影会被切掉
    subLayer.shadowColor = shadowColor.CGColor;//shadowColor阴影颜色
    subLayer.shadowOffset = shadowOffset;//shadowOffset阴影偏移,这个跟shadowRadius配合使用
    subLayer.shadowOpacity = shadowOpacity;//阴影透明度
    subLayer.shadowRadius = shadowRadius;//阴影半径
    [superView.layer insertSublayer:subLayer below:self.layer];
}

- (void)dj_setShadowPath:(UIColor *)shadowColor
            shadowOffset:(CGSize)shadowOffset
           shadowOpacity:(CGFloat)shadowOpacity
            shadowRadius:(CGFloat)shadowRadius
              shadowType:(DJRectShadowPath)shadowPathType
         shadowPathWidth:(CGFloat)shadowPathWidth
{
    self.layer.masksToBounds = NO;
    
    self.layer.shadowColor = shadowColor.CGColor;
    
    self.layer.shadowOpacity = shadowOpacity;
    
    self.layer.shadowRadius =  shadowRadius;
    
    self.layer.shadowOffset = shadowOffset;
    
    CGRect shadowRect;
    
    CGFloat originX = 0;
    
    CGFloat originY = 0;
    
    CGFloat originW = self.bounds.size.width;
    
    CGFloat originH = self.bounds.size.height;
    
    
    switch (shadowPathType) {
        case DJRectShadowPathTop:
            shadowRect  = CGRectMake(originX, originY - shadowPathWidth/2, originW,  shadowPathWidth);
            break;
        case DJRectShadowPathBottom:
            shadowRect  = CGRectMake(originX, originH -shadowPathWidth/2, originW, shadowPathWidth);
            break;
        case DJRectShadowPathLeft:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
        case DJRectShadowPathRight:
            shadowRect  = CGRectMake(originW - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
        case DJRectShadowPathNoTop:
            shadowRect  = CGRectMake(originX -shadowPathWidth/2, originY +1, originW +shadowPathWidth,originH + shadowPathWidth/2 );
            break;
        case DJRectShadowPathAllRect:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY - shadowPathWidth/2, originW +  shadowPathWidth, originH + shadowPathWidth);
            break;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:shadowRect];
    
    self.layer.shadowPath = path.CGPath;
}

#pragma mark - Associated Object
- (void)setDj_shapeLayer:(id)object {
    objc_setAssociatedObject(self, @selector(dj_shapeLayer), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAShapeLayer *)dj_shapeLayer {
    return objc_getAssociatedObject(self, @selector(dj_shapeLayer));
}

- (void)setDj_bezierPath:(id)object{
    objc_setAssociatedObject(self, @selector(dj_bezierPath), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIBezierPath *)dj_bezierPath{
    return objc_getAssociatedObject(self, @selector(dj_bezierPath));
}


@end
