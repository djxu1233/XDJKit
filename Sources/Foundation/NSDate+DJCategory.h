//
//  NSDate+DJCategory.h
//  TransformDemo
//
//  Created by DJ on 2018/12/7.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DJCategory)

/** 判断是否是这一年*/
- (BOOL)isThisYear;
/** 判断是否是今天*/
- (BOOL)isToday;
/** 判断是否是昨天*/
- (BOOL)isYesterday;
/** 判断是否在1分钟内*/
- (BOOL)isInOneMinute;
/** 判断是否在一小时内*/
- (BOOL)isInOneHour;
/** 判断是否是明天*/
- (BOOL)isTomorrow;
/** 获取一个日期与当前日期 小时,分钟差值*/
- (NSDateComponents *)deltaWithNow;

@end
