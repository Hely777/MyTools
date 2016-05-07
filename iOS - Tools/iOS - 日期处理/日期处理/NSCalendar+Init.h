//
//  NSCalendar+Init.h
//  日期处理
//
//  Created by xmg on 16/1/30.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  判断NSCalendar方法的方法调用,在不同系统版本中使用不同的方法.
 */
@interface NSCalendar (Init)
+ (instancetype)xmg_calendar;
@end
