//
//  NSString+Date.m
//  TransformDemo
//
//  Created by DJ on 2018/12/7.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "NSString+Date.h"
#import "NSDate+DJCategory.h"

@implementation NSString (Date)

+ (NSString *)dateToNsstring:(NSDate *)date{
    NSDateFormatter*df = [[NSDateFormatter alloc]init];//格式化
    [df setDateFormat:@"YYYY-MM-dd"];
    [df setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"data"]];
    return [df stringFromDate:date];
}

+ (NSString *)intervalFromLastDate:(NSString *)dateString1 toTheDate:(NSString *)dateString2
{
    
    NSArray *timeArray1=[dateString1 componentsSeparatedByString:@"."];
    dateString1=[timeArray1 objectAtIndex:0];
    
    
    NSArray *timeArray2=[dateString2 componentsSeparatedByString:@"."];
    dateString2=[timeArray2 objectAtIndex:0];
    
    NSLog(@"%@.....%@",dateString1,dateString2);
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *d1=[date dateFromString:dateString1];
    
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    NSDate *d2=[date dateFromString:dateString2];
    
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    NSTimeInterval cha=late2-late1;
    NSString *timeString=@"";
    //    NSString *house=@"";
    //    NSString *min=@"";
    //    NSString *sen=@"";
    
    //    sen = [NSString stringWithFormat:@"%d", (int)cha%60];
    //    //        min = [min substringToIndex:min.length-7];
    //    //    秒
    //    sen=[NSString stringWithFormat:@"%@", sen];
    //
    //
    //
    //    min = [NSString stringWithFormat:@"%d", (int)cha/60%60];
    //    //        min = [min substringToIndex:min.length-7];
    //    //    分
    //    min=[NSString stringWithFormat:@"%@", min];
    //
    //
    //    //    小时
    //    house = [NSString stringWithFormat:@"%d", (int)cha/3600];
    //    //        house = [house substringToIndex:house.length-7];
    //    house=[NSString stringWithFormat:@"%@", house];
    //
    //
    //    timeString=[NSString stringWithFormat:@"%@:%@:%@",house,min,sen];
    return timeString = [NSString stringWithFormat:@"%d",(int)cha];
}

//月
NSInteger dj_getMonthString(NSDate *date)
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    
    return currentMonth;
}
//日
NSInteger dj_getDayString(NSDate *date)
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    return currentDay;
}


//获取当前系统时间的时间戳
#pragma mark - 获取当前时间的 时间戳
+ (NSInteger)getNowTimestamp{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间
    
    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    
    //时间转时间戳的方法
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    
    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    
    return timeSp;
}

//将某个时间转化成 时间戳
#pragma mark - 将某个时间转化成 时间戳
+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    
    return timeSp;
}

//将某个时间戳转化成 时间
#pragma mark - 将某个时间戳转化成 时间
+ (NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSLog(@"1296035591  = %@",confromTimesp);
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];

    //NSLog(@"&&&&&&&confromTimespStr = : %@",confromTimespStr);
    
    return confromTimespStr;
}

/*根据当前日期计算星期几*/
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

+ (NSString *)comparePastDateWithDateString:(NSString *)dateString formatter:(NSString *)formatter
{
    if (formatter == nil || [formatter isEqualToString:@""])
    {
        formatter = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    // 和当前时间差距
    float different = [date timeIntervalSinceDate:[NSDate date]];
    if (different > 0)
    {
        return @"刚刚";
    }
    different = -different;
    
    // days = different / (24 * 60 * 60), take the floor value（向下取整）
    float dayDifferent = floor(different / 86400);
    int days = (int)dayDifferent;
    // 今天内
    if (days <= 0)
    {
        // 少于1分钟，显示刚刚
        if (different < 60)
        {
            return @"刚刚";
        }
        // 少于1小时，显示xx分钟前
        if (different < 60 * 60)
        {
            return [NSString stringWithFormat:@"%d分钟前", (int)floor(different / 60)];
        }
        // 少于1天，显示xx小时前
        if (different < 86400)
        {
            return [NSString stringWithFormat:@"%d小时前", (int)floor(different / 3600)];
        }
    }
    // 少于7天，显示xx天前
    if (days > 0 && days <= 1)
    {
        return @"昨天";
    } else if (days > 1 && days <= 2)
    {
        return @"前天";
    }
    NSString *dateStr = [dateString substringWithRange:NSMakeRange(5, 5)];
    return dateStr;
    
}


+ (NSString *)compareFutureDateWithDateString:(NSString *)dateString formatter:(NSString *)formatter
{
    if (formatter == nil || [formatter isEqualToString:@""])
    {
        formatter = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date = [dateFormatter dateFromString:dateString];
    // 和当前时间差距
    float different = [date timeIntervalSinceDate:[NSDate date]];
    if (different < 0)
    {
        return @"这是过去时间";
    }
    
    // days = different / (24 * 60 * 60), take the floor value（向下取整）
    float dayDifferent = floor(different / 86400);
    int days   = (int)dayDifferent;
    // 今天内
    if (days <= 0)
    {
        // 少于1小时，显示“将在xx结束”
        if (different < 60 * 60)
        {
            [dateFormatter setDateFormat:@"HH:mm"];
            return [NSString stringWithFormat:@"将在%@结束", [dateFormatter stringFromDate:date]];
        }
        // 少于1天，显示xx小时前
        if (different < 86400)
        {
            return [NSString stringWithFormat:@"还有%d小时", (int)floor(different / 3600)];
        }
    }
    
    return [NSString stringWithFormat:@"还有%d天", days];
}

+ (NSString *)reporterFollowComparePastDateWithDateString:(NSString *)dateString formatter:(NSString *)formatter
{
    if (formatter == nil || [formatter isEqualToString:@""])
    {
        formatter = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    // 和当前时间差距
    float different = [date timeIntervalSinceDate:[NSDate date]];
    if (different > 0)
    {
        return @"刚刚";
    }
    different = -different;
    
    // days = different / (24 * 60 * 60), take the floor value（向下取整）
    float dayDifferent = floor(different / 86400);
    
    int days = (int)dayDifferent;
    // 今天内
    if (days <= 0)
    {
        return @"今天";
    }
    else if (days>0 && days <= 1)
    {
        return @"昨天";
    }
    else if (days > 1 && days <= 2)
    {
        return @"前天";
    }
    
    NSString *dateStr = [dateString substringWithRange:NSMakeRange(5, 5)];
    return dateStr;
}

+ (BOOL)timeCompareIsMoreThanThreeHoursWithDateString:(NSString *)dateString formatter:(NSString *)formatter
{
    if (formatter == nil || [formatter isEqualToString:@""])
    {
        formatter = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    // 和当前时间差距
    float different = [date timeIntervalSinceDate:[NSDate date]];
    if (different > 0)
    {
        return NO;
    }
    different = -different;
    // days = different / (24 * 60 * 60), take the floor value（向下取整）
    float dayDifferent = floor(different / 86400);
    int days = (int)dayDifferent;
    // 今天内
    if (days <= 0)
    {
        if (different >= 3 * 60 * 60)
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return YES;
    }
}


@end
