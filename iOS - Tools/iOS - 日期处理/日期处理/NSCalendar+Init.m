//
//  NSCalendar+Init.m
//  日期处理
//
//  Created by xmg on 16/1/30.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "NSCalendar+Init.h"

@implementation NSCalendar (Init)
+ (instancetype)xmg_calendar
{
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }
    return [NSCalendar currentCalendar];
}
@end
