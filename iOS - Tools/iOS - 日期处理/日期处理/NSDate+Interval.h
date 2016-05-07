//
//  NSDate+Interval.h
//  日期处理
//
//  Created by xmg on 16/1/30.
//  Copyright © 2016年 xiaomage. All rights reserved.
//


/**
 
 日期处理分类
 
 */
#import <Foundation/Foundation.h>

typedef enum {
    /** 天 */
    XMGIntervalIndexDay = 0,
    /** 小时 */
    XMGIntervalIndexHour = 1,
    /** 分钟 */
    XMGIntervalIndexMinute = 2,
    /** 秒 */
    XMGIntervalIndexSecond = 3,
} XMGIntervalIndex;

/** 天 */
extern NSString * const XMGIntervalDayKey;
/** 小时 */
extern NSString * const XMGIntervalHourKey;
/** 分钟 */
extern NSString * const XMGIntervalMinuteKey;
/** 秒 */
extern NSString * const XMGIntervalSecondKey;

typedef struct {
    /** 天 */
    NSInteger day;
    /** 小时 */
    NSInteger hour;
    /** 分钟 */
    NSInteger minute;
    /** 秒 */
    NSInteger second;
} XMGIntervalStruct;

@interface XMGInterval : NSObject
/**
 *  - 属性名和方法名都可以使用,适用于自己封装框架; 
    - NS_AVAILABLE_IOS(6_0); 生效于iOS6
    - NS_DEPRECATED_IOS(2_0, 7_0, "Use xmg_day"); 废弃于iOS7,请使用xmg_day属性替代.
 */
@property (nonatomic, assign) NSInteger xmg_day NS_AVAILABLE_IOS(6_0);
/** 天 */
@property (nonatomic, assign) NSInteger day NS_DEPRECATED_IOS(2_0, 7_0, "Use xmg_day");
/** 小时 */
@property (nonatomic, assign) NSInteger hour;
/** 分钟 */
@property (nonatomic, assign) NSInteger minute;
/** 秒 */
@property (nonatomic, assign) NSInteger second;
@end

@interface NSDate (Interval)
/**
 *  - 设计思路 : 返回一个模型,更加面向对象,而且相比于结构体以后再做一些时间上的扩展,返回的对象可以直接调用一些方法,并且可以定义其模型属性的一些行为,也就是setter方法和getter方法.
 *
 *  @param date 传入的时间
 *
 *  @return 返回计算好间隔的时间对象
 */
- (XMGInterval *)xmg_intervalSinceDate:(NSDate *)date;


/**
 *  - 设计思路 : 由于我们返回的是时间,时间的是由基本数据类型组成,所以返回一个结构体,通过点来获得基本数据类型
    - 总结 : 通过点来直接获得基本数据类型
    - 缺点 : 返回的结构体不能调用方法,以后的扩展可能需要返回的对象调用方法
 *
 *  @param date 传入的时间
 *
 *  @return 返回计算好时间差的结构体
 */
- (XMGIntervalStruct)xmg_structForIntervalSinceDate:(NSDate *)date;


/**
 *  - 设计思路 : 接收传进来的时间,返回一个计算好时间间隔的字典
    - 总结 : 通过Key来取出对应的value
    - 缺点 : 由于是字典,所以返回的是对象,取出的value也是对象,需要外界强转成基本数据类型
 *  天 XMGIntervalDayKey
 *  小时 XMGIntervalHourKey
 *  分钟 XMGIntervalMinuteKey
 *  秒 XMGIntervalSecondKey
 */
- (NSDictionary *)xmg_dictionaryForIntervalSinceDate:(NSDate *)date;


/**
 *  
    - 设计思路 : 接收传进来的时间,返回一个计算好时间间隔的数组
    - 总结 : 返回数组可以利用数组的索引取出,数组的索引已经通过枚举封装好,见名知意
    - 缺点 : 由于是数组,所以返回的是对象,通过索引取出的值也是对象,需要外界强转成基本数据类型
 *  0 ： 天 XMGIntervalIndexDay
 *  1 ： 小时 XMGIntervalIndexHour
 *  2 ： 分钟 XMGIntervalIndexMinute
 *  3 ： 秒 XMGIntervalIndexSecond
 */
- (NSArray *)xmg_arrayForIntervalSinceDate:(NSDate *)date;


/**
 *  - 设计思路 : 由于时间需要返回四个返回值,所以普通的设计思路是不行的,这里我们使用指针,外面进行数据类型的地址传递,指针变量参数指向传进来的地址,最后给指针参数所指向的地址(存储空间)赋值,相当于将我们方法内部的值赋值给了外面的变量,这样不需要返回值也可以在计算好后给外面传进来的参数赋值
    - 总结 : 我们利用指针可以指向地址的特性,指针变量接收地址,通过指针这个中间人对外面的变量赋值.
    - 缺点 :
 *
 *  @param date    传进来的时间,用来计算与调用者之间间隔的秒数
 *  @param dayP    指针变量dayP,用来接收地址
 *  @param hourP   指针变量hourP,用来接收地址
 *  @param minuteP 指针变量minuteP,用来接收地址
 *  @param secondP 指针变量secondP,用来接收地址
 */
- (void)xmg_intervalSinceDate:(NSDate *)date day:(NSInteger *)dayP hour:(NSInteger *)hourP minute:(NSInteger *)minuteP second:(NSInteger *)secondP;

/**
 * 是否为今天
 */
- (BOOL)xmg_isInToday;

/**
 * 是否为昨天
 */
- (BOOL)xmg_isInYesterday;

/**
 * 是否为明天
 */
- (BOOL)xmg_isInTomorrow;

/**
 * 是否为今年
 */
- (BOOL)xmg_isInThisYear;
@end
