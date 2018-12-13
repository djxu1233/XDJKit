//
//  UIFont+Scale.m
//  TransformDemo
//
//  Created by DJ on 2018/12/13.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "UIFont+Scale.h"
#import <objc/runtime.h>

#define DJ_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define DJFONT_SCALE(s) ((s) / 375.0 * DJ_SCREEN_WIDTH)

@implementation UIFont (Scale)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod([self class], NSSelectorFromString(@"systemFontOfSize:")), class_getInstanceMethod([self class], @selector(djSystemFont_swizzled_fontSize:)));
    method_exchangeImplementations(class_getInstanceMethod([self class], NSSelectorFromString(@"boldSystemFontOfSize:")), class_getInstanceMethod([self class], @selector(djBoldSystemFont_swizzled_fontSize:)));
}

+ (UIFont *)djSystemFont_swizzled_fontSize:(CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont djSystemFont_swizzled_fontSize:DJFONT_SCALE(fontSize)];
    return newFont;
}

+ (UIFont *)djBoldSystemFont_swizzled_fontSize:(CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont djBoldSystemFont_swizzled_fontSize:DJFONT_SCALE(fontSize)];
    return newFont;
}

@end
