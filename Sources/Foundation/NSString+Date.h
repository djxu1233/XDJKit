//
//  NSString+Date.h
//  TransformDemo
//
//  Created by DJ on 2018/12/7.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

//日期转换成String
+ (NSString *)dateToNsstring:(NSDate *)date;
//时间差
+ (NSString *)intervalFromLastDate:(NSString *)dateString1 toTheDate:(NSString *)dateString2;

//月
NSInteger dj_getMonthString(NSDate *date);
//日
NSInteger dj_getDayString(NSDate *date);

//获取当前系统时间的时间戳
#pragma mark - 获取当前时间的 时间戳
+ (NSInteger)getNowTimestamp;

//将某个时间转化成 时间戳
#pragma mark - 将某个时间转化成 时间戳
+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;

//将某个时间戳转化成 时间
#pragma mark - 将某个时间戳转化成 时间
+ (NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;

/** 根据当前日期计算星期几*/
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;

/**
 * @brief 过去时间与当前时间对比
 *
 * @param dateString 时间字符串
 * @param formatter 时间的格式
 *
 * @return 返回时间以 “/天 /时 /分” 为单位
 */
+ (NSString *)comparePastDateWithDateString:(NSString *)dateString
                                  formatter:(NSString *)formatter;

/**
 * @brief 未来时间与当前时间对比
 *
 * @param dateString 时间字符串
 * @param formatter 时间的格式
 *
 * @return 返回时间以 “/天 /时 /分” 为单位
 */
+ (NSString *)compareFutureDateWithDateString:(NSString *)dateString
                                    formatter:(NSString *)formatter;


/**
 * @brief 过去时间与当前时间对比
 *
 * @param dateString 时间字符串
 * @param formatter 时间的格式
 *
 * @return 返回时间以 “/天” 为单位
 */
+ (NSString *)reporterFollowComparePastDateWithDateString:(NSString *)dateString
                                                formatter:(NSString *)formatter;

/**
 *  过去的时间和现在比是否大于三个小时
 */
+ (BOOL)timeCompareIsMoreThanThreeHoursWithDateString:(NSString *)dateString
                                            formatter:(NSString *)formatter;

@end
