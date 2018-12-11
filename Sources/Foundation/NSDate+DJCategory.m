//
//  NSDate+DJCategory.m
//  TransformDemo
//
//  Created by DJ on 2018/12/7.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "NSDate+DJCategory.h"

@implementation NSDate (DJCategory)

static NSDateFormatter *formatter_;
static  NSCalendar *calendar_;

// 第一次使用这个类的时候调用
// 优化性能,减少频繁的创建格式化对象
+ (void)initialize
{
    formatter_ = [[NSDateFormatter alloc] init];
    calendar_ = [NSCalendar currentCalendar];
}
- (BOOL)isToday
{
    formatter_.dateFormat = @"yyyyMMdd";
    
    NSString *selfDay = [formatter_ stringFromDate:self];
    NSString *nowDay = [formatter_ stringFromDate:[NSDate date]];
    
    return [selfDay isEqualToString:nowDay];
}

- (BOOL)isYesterday
{
    formatter_.dateFormat = @"yyyyMMdd";
    
    NSString *selfDay = [formatter_ stringFromDate:self];
    NSString *nowDay = [formatter_ stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [formatter_ dateFromString:selfDay];
    NSDate *nowDate = [formatter_ dateFromString:nowDay];
    
    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmp = [calendar_ components:units fromDate:nowDate toDate:selfDate options:0];
    
    return cmp.year == 0 && cmp.month == 0 && cmp.day == 1;
}

- (BOOL)isTomorrow
{
    formatter_.dateFormat = @"yyyyMMdd";
    
    NSString *selfDay = [formatter_ stringFromDate:self];
    NSString *nowDay = [formatter_ stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [formatter_ dateFromString:selfDay];
    NSDate *nowDate = [formatter_ dateFromString:nowDay];
    
    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmp = [calendar_ components:units fromDate:nowDate toDate:selfDate options:0];
    
    return cmp.year == 0 && cmp.month == 0 && cmp.day == -1;
}

- (BOOL)isThisYear
{
    formatter_.dateFormat = @"yyyy";
    NSString *selfYear = [formatter_ stringFromDate:self];
    NSString *currentYear = [formatter_ stringFromDate:[NSDate date]];
    
    return [selfYear isEqualToString:currentYear];
}

- (BOOL)isInOneMinute
{
    formatter_.dateFormat = @"yyyyMMddHHmm";
    
    NSString *selfSecond = [formatter_ stringFromDate:self];
    NSString *nowSecond = [formatter_ stringFromDate:[NSDate date]];
    
    return [selfSecond isEqualToString:nowSecond];
}

- (BOOL)isInOneHour
{
    formatter_.dateFormat = @"yyyyMMddHH";
    
    NSString *selfHour = [formatter_ stringFromDate:self];
    NSString *nowHour = [formatter_ stringFromDate:[NSDate date]];
    
    return [selfHour isEqualToString:nowHour];
    
}

- (NSDateComponents *)deltaWithNow
{
    // 获取当前时间
    NSDate *currentDate = [NSDate date];
    // 日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 获取两个日期差值
    return  [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:self toDate:currentDate options:NSCalendarWrapComponents];
}


@end
