//
//  NSString+TimeExtension.m
//  05-QQMusic
//
//  Created by xmg on 16/1/7.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "NSString+TimeExtension.h"

@implementation NSString (TimeExtension)
/**
 *  该NSString分类接收一个NSTimeInterval类型的时间将其转换为NSString类型的 分:秒:毫秒
 *
 *  @param time NSTimeInterval类型-->描述的是这个时间的总秒数
 *
 *  @return 返回一个 分:秒:毫秒 格式的字符串
 */
+ (NSString *)stringWithTime:(NSTimeInterval)time {
    
    // 1.获取分钟
    NSInteger min = time / 60;
    
    // 2.获取秒 1.999   2.000000
    NSInteger sec = (NSInteger)round(time) % 60;
    
    // 3.拼接字符串返回
    return [NSString stringWithFormat:@"%02ld:%02ld",min,sec];
}

@end
