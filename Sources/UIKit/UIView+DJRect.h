//
//  UIView+DJRect.h
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DJRect)

@property (nonatomic, assign) CGFloat dj_x;
@property (nonatomic, assign) CGFloat dj_y;
@property (nonatomic, assign) CGFloat dj_width;
@property (nonatomic, assign) CGFloat dj_height;
@property (nonatomic, assign) CGSize  dj_size;
@property (nonatomic, assign) CGPoint dj_origin;
@property (nonatomic, assign) CGFloat dj_centerX;
@property (nonatomic, assign) CGFloat dj_centerY;
/** UIView的最大X值 */
@property (assign, nonatomic) CGFloat dj_maxX;
/** UIView的最大Y值 */
@property (assign, nonatomic) CGFloat dj_maxY;

/**
 *  9.上 < Shortcut for frame.origin.y
 */
@property (nonatomic) CGFloat dj_top;

/**
 *  10.下 < Shortcut for frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat dj_bottom;

/**
 *  11.左 < Shortcut for frame.origin.x.
 */
@property (nonatomic) CGFloat dj_left;

/**
 *  12.右 < Shortcut for frame.origin.x + frame.size.width
 */
@property (nonatomic) CGFloat dj_right;

@end

NS_ASSUME_NONNULL_END
