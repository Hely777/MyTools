//
//  NSDate+Interval.m
//  日期处理
//
//  Created by xmg on 16/1/30.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "NSDate+Interval.h"
#import "NSCalendar+Init.h"


@implementation XMGInterval
/**
 *  模型的属性必须写出@implementation才会实现它的setter和getter方法
 */
@end

@implementation NSDate (Interval)

#pragma mark - 求时间差
- (XMGInterval *)xmg_intervalSinceDate:(NSDate *)date
{
    // 从date到self之间走过的秒数
    NSInteger interval = [self timeIntervalSinceDate:date];
    
    // 1分钟 = 60秒
    NSInteger secondsPerMinute = 60;
    
    // 1小时 = 60 * 60秒 = 3600秒
    NSInteger secondsPerHour = 60 * secondsPerMinute;
    
    // 1天 = 24 * 60  * 60秒
    NSInteger secondsPerDay = 24 * secondsPerHour;
    
    XMGInterval *intervalStruct = [[XMGInterval alloc] init];
    intervalStruct.day = interval / secondsPerDay;
    intervalStruct.hour = (interval % secondsPerDay) / secondsPerHour;
    intervalStruct.minute = ((interval % secondsPerDay) % secondsPerHour) / secondsPerMinute;
    intervalStruct.second = interval % secondsPerMinute;
    return intervalStruct;
}

- (XMGIntervalStruct)xmg_structForIntervalSinceDate:(NSDate *)date
{
    // 从date到self之间走过的秒数
    NSInteger interval = [self timeIntervalSinceDate:date];

    // 1分钟 = 60秒
    NSInteger secondsPerMinute = 60;

    // 1小时 = 60 * 60秒 = 3600秒
    NSInteger secondsPerHour = 60 * secondsPerMinute;

    // 1天 = 24 * 60  * 60秒
    NSInteger secondsPerDay = 24 * secondsPerHour;

    XMGIntervalStruct intervalStruct;
    intervalStruct.day = interval / secondsPerDay;
    intervalStruct.hour = (interval % secondsPerDay) / secondsPerHour;
    intervalStruct.minute = ((interval % secondsPerDay) % secondsPerHour) / secondsPerMinute;
    intervalStruct.second = interval % secondsPerMinute;
    return intervalStruct;
}


NSString * const XMGIntervalDayKey = @"XMGIntervalDayKey";
NSString * const XMGIntervalHourKey = @"XMGIntervalHourKey";
NSString * const XMGIntervalMinuteKey = @"XMGIntervalMinuteKey";
NSString * const XMGIntervalSecondKey = @"XMGIntervalSecondKey";

- (NSDictionary *)xmg_dictionaryForIntervalSinceDate:(NSDate *)date
{
    // 从date到self之间走过的秒数
    NSInteger interval = [self timeIntervalSinceDate:date];

    // 1分钟 = 60秒
    NSInteger secondsPerMinute = 60;

    // 1小时 = 60 * 60秒 = 3600秒
    NSInteger secondsPerHour = 60 * secondsPerMinute;

    // 1天 = 24 * 60  * 60秒
    NSInteger secondsPerDay = 24 * secondsPerHour;

    NSInteger day = interval / secondsPerDay;
    NSInteger hour = (interval % secondsPerDay) / secondsPerHour;
    NSInteger minute = ((interval % secondsPerDay) % secondsPerHour) / secondsPerMinute;
    NSInteger  second = interval % secondsPerMinute;
    return @{
             XMGIntervalDayKey : @(day),
             XMGIntervalHourKey : @(hour),
             XMGIntervalMinuteKey : @(minute),
             XMGIntervalSecondKey : @(second)
             };
}


- (NSArray *)xmg_arrayForIntervalSinceDate:(NSDate *)date
{
    // 从date到self之间走过的秒数
    NSInteger interval = [self timeIntervalSinceDate:date];
    
    // 1分钟 = 60秒
    NSInteger secondsPerMinute = 60;
    
    // 1小时 = 60 * 60秒 = 3600秒
    NSInteger secondsPerHour = 60 * secondsPerMinute;
    
    // 1天 = 24 * 60  * 60秒
    NSInteger secondsPerDay = 24 * secondsPerHour;
    
    NSInteger day = interval / secondsPerDay;
    NSInteger hour = (interval % secondsPerDay) / secondsPerHour;
    NSInteger minute = ((interval % secondsPerDay) % secondsPerHour) / secondsPerMinute;
    NSInteger  second = interval % secondsPerMinute;
    return @[@(day), @(hour), @(minute), @(second)];
}


- (void)xmg_intervalSinceDate:(NSDate *)date day:(NSInteger *)dayP hour:(NSInteger *)hourP minute:(NSInteger *)minuteP second:(NSInteger *)secondP
{
    // 从date到self之间走过的秒数
    NSInteger interval = [self timeIntervalSinceDate:date];
    
    // 1分钟 = 60秒
    NSInteger secondsPerMinute = 60;
    
    // 1小时 = 60 * 60秒 = 3600秒
    NSInteger secondsPerHour = 60 * secondsPerMinute;
    
    // 1天 = 24 * 60  * 60秒
    NSInteger secondsPerDay = 24 * secondsPerHour;
    
    *dayP = interval / secondsPerDay;
    *hourP = (interval % secondsPerDay) / secondsPerHour;
    *minuteP = ((interval % secondsPerDay) % secondsPerHour) / secondsPerMinute;
    *secondP = interval % secondsPerMinute;
}


#pragma mark - 判断是否
- (BOOL)xmg_isInToday
{
    /**
     *  NSCalendar比较是否为今天
     */
    NSCalendar *calendar = [NSCalendar xmg_calendar];
    
    // 获得年月日
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *dateCmps = [calendar components:unit fromDate:[NSDate date]];
    
    /**
     *  
     return selfCmps.year == dateCmps.year
     && selfCmps.month == dateCmps.month
     && selfCmps.day == dateCmps.day;
     - 等于下面
     */
    return [selfCmps isEqual:dateCmps];
}

- (BOOL)xmg_iisInToday
{
    /**
     字符串比较日期是否为今天
     
     */
    // 判断self是否为今天
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    // 只有年月日的字符串
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    /**
     *  
     return [selfString compare:nowString] == NSOrderedSame;
     return [selfString isEqual:nowString];
     - 等于下面
     */
    return [selfString isEqualToString:nowString];
}

- (BOOL)xmg_isInThisYear
{
    NSCalendar *calendar = [NSCalendar xmg_calendar];
    
    // 获得年月日
    NSCalendarUnit unit = NSCalendarUnitYear;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *dateCmps = [calendar components:unit fromDate:[NSDate date]];
    
    return [selfCmps isEqual:dateCmps];
}

- (BOOL)xmg_isInYesterday
{
    // 判断self是否为昨天
    // self = 2016-01-29 10:18:01 -> 2016-01-29 00:00:00
    // now  = 2016-01-30 09:18:01 -> 2016-01-30 00:00:00
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    // 获得只有年月日的字符串对象
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    // 获得只有年月日的日期对象
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    // 比较
    NSCalendar *calendar = [NSCalendar xmg_calendar];
    /**
     *  如果传入的时间不在一年,该方法会把年数转变为天数,所以只判断day就可以确定是否是昨天
     */
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
    
//    NSDateComponents *cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
//    
//    NSLog(@"%@", cmps);
//    
//    return cmps.year == 0
//    && cmps.month == 0
//    && cmps.day == 1;
}

- (BOOL)xmg_isInTomorrow
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    // 获得只有年月日的字符串对象
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    // 获得只有年月日的日期对象
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    // 比较
    NSCalendar *calendar = [NSCalendar xmg_calendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == - 1;
}

@end
