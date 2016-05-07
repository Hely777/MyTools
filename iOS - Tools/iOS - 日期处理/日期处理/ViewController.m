//
//  ViewController.m
//  日期处理
//
//  Created by xmg on 16/1/30.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

/*
 一、NSDateFormatter的作用
 1.NSString * -> NSDate *
 2.NSDate * -> NSString *
 
 二、日期格式符
 年 - year - y
 月 - month - M
 日 - day - d
 时 - hour - H（24小时制）\h（12小时制）
 分 - minute - m
 秒 - second - s
 
 三、如果NSLog只输出空字符串@""，会被忽略掉，没有任何打印信息。比如以下
 NSLog(@"%@", @"");
 NSLog(@"");
 
 NSString *string = @"";
 NSLog(@"%@", string);
 
 四. 方法有了声明，点语法才会有提示,如果没有声明点语法就不会提示

 - (NSString *)name;
 
 - (NSString *)name
 {
 return @"123";
 }

 
 */

#import "ViewController.h"
#import "NSDate+Interval.h"
#import "NSCalendar+Init.h"
#import "XMGPerson.h"

#define iOS(v) ([UIDevice currentDevice].systemVersion.doubleValue >= (v))

//@implementation NSArray
//
///**
// *  containsObject:底层实现.
// *
// *  @param anObject <#anObject description#>
// *
// *  @return <#return value description#>
// */
//- (BOOL)containsObject:(id)anObject
//{
//    for (id obj in self) {
//        if ([anObject isEqual:obj]) return YES;
//    }
//    return NO;
//}
//
///**
// *  indexOfObject底层实现
// *
// *  @param anObject <#anObject description#>
// *
// *  @return <#return value description#>
// */
//- (NSUInteger)indexOfObject:(id)anObject
//{
//    NSUInteger i = 0;
//    for (id obj in self) {
//        if ([anObject isEqual:obj]) return i;
//        i++;
//    }
//    return NSNotFound;
//}
//
//@end

@interface ViewController ()
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*
    int age = 20;
    
    int *p;
    
    p = &age;
    
    // 将100赋值给指针变量p所指向的存储空间
    // 相当于 age = 100;
    *p = 100;
     */
    
    [self equal];
}

#pragma mark - equal
- (void)equal
{
    
    /**
     比较数组在一个数组集合中的位置,由于person类重写了系统的isEqual:方法,所以比较的使他们的内容.NSAarra是Foundation框架内的类,在该框架内的类使用isEqual:方法都是比较内容.
     
     - returns: <#return value description#>
     */
    XMGPerson *person1 = [[XMGPerson alloc] init];
    person1.age = 20;
    person1.money = 100;
    
    XMGPerson *person2 = [[XMGPerson alloc] init];
    person2.age = 20;
    person2.money = 100;
    
    NSArray *array1 = @[@"123", @"234", person1];
    NSArray *array2 = @[@"123", @"234", person2];
    NSArray *array3 = @[@"234", @"123"];
    NSArray *array4 = @[];
    NSArray *arrayAll = @[array3, array1, array2, array4];
    NSLog(@"%zd", [arrayAll indexOfObject:array2]);
    
  
    
    /**
     在person类内部重写系统的isEqual:方法,使其比较内容
     
     - returns: <#return value description#>
     */
    XMGPerson *p1 = [[XMGPerson alloc] init];
    person1.age = 20;
    person1.money = 100;
    
    XMGPerson *p2 = [[XMGPerson alloc] init];
    person2.age = 20;
    person2.money = 100;
    
    XMGPerson *p3 = [[XMGPerson alloc] init];
    p3.age = 21;
    p3.money = 120;
    
    NSArray *array = @[p3, @10, @"123", p2]; // 比较到自定义类没有的类型,那么就会崩溃,要加判断.
    
    NSLog(@"%zd", [array containsObject:p1]);
   /**
   *  - containsObject底层实现 : 遍历数组中的每一个元素,再与该方法传进来的参数进行isEqual进行比较,包含返回YES,否则返回NO,返回NO会继续对比,知道匹配YES,如果匹配到最后都是NO,那么最终结果就是NO ,isEqual默认是比较对象的内存地址,我们重写该自定义类的isEqual方法,使其比较对象属性的内容,那么该方法内部就是比较对象属性的内容是否相等了.
   
      - indexOfObject底层实现 : 同containsObject相同.
   */
    NSLog(@"%zd", [array indexOfObject:p1]);
    

    
    /**
     比较自定义类的对象
     
     - returns: <#return value description#>
     */
    XMGPerson *pA = [[XMGPerson alloc] init];
    person1.age = 20;
    person1.money = 100;
    
    XMGPerson *pB = [[XMGPerson alloc] init];
    person2.age = 20;
    person2.money = 100;
    
    NSLog(@"pA == pB -> %zd", pA == pB); // 比较内存地址
    NSLog(@"[pA isEqual:pB] -> %zd", [pA isEqual:pB]); // 默认：比较内存地址
       /*
        - isEqual继承自NSObject,默认比较内存地址,OC对象都拥有该方法.
        - 字符串isEqual为何是比较内容?  因为NSString重写了该方法使其比较内容.
        */
     
    
    
    /**
     *  数组的比较
     */
    NSArray *arrayA = @[@"123", @"234"];
    NSArray *arrayB = @[@"123", @"234"];
    NSLog(@"arrayA == arrayB -> %zd", arrayA == arrayB); // 比较内存地址
    NSLog(@"[arrayA isEqual:arrayB] -> %zd", [arrayA isEqual:arrayB]); // 比较内容,Foundation框架的类,isEqual方法都是比较内容的,自定义的类是比较内存地址,如果想让自定义的类比较内容需要重写系统的isEqual方法.
    NSLog(@"[arrayA isEqualToArray:arrayB] -> %zd", [arrayA isEqualToArray:arrayB]); // 比较内容,底层会调用字符串的isEqual方法,比较数组元素的字符串内容是否相等.
    
    
    
    
    
    /**
     *  字符串之间的比较
     */
    NSString *str3 = @"jack";
    NSString *str4 = @"jack";
    NSLog(@"%p %p", str3, str4); // str1, str3和str4的内存地址一样,存放于静态区
    
    NSString *str1 = @"jack";
    NSString *str2 = [NSString stringWithFormat:@"jack"];
    
    NSLog(@"str1 == str2 -> %zd", str1 == str2); // 比较内存地址
    NSLog(@"[str1 isEqual:str2] -> %zd", [str1 isEqual:str2]); // 比较内容
    NSLog(@"[str1 isEqualToString:str2] -> %zd", [str1 isEqualToString:str2]); // 比较内容
     
}

#pragma mark - NSCalendar
- (void)calendarUsage
{
    /**
     判断日期是否是昨天今天明天或者周五
     */
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [fmt dateFromString:@"2016-01-31 10:18:01"];
    
    NSLog(@"今天：%zd, 昨天：%zd, 明天：%zd, 今年：%zd",
          date.xmg_isInToday,
          date.xmg_isInYesterday,
          date.xmg_isInTomorrow,
          date.xmg_isInThisYear);
    
    /**
     *  iOS8生效,如果要适配iOS7使用上面自己定义的方法
     */
    NSCalendar *calendar = [NSCalendar xmg_calendar];
    NSLog(@"今天：%zd, 昨天：%zd, 明天：%zd, 周末：%zd",
          [calendar isDateInToday:date],
          [calendar isDateInYesterday:date],
          [calendar isDateInTomorrow:date],
          [calendar isDateInWeekend:date]);
}

- (void)calendar
{   
    
    [NSCalendar xmg_calendar];
    
    
    NSCalendar *calendar = nil;
    /**
     *  
     - instances : 实例对象（利用XMGPerson类创建了100个XMGPerson对象，这100个XMGPerson对象就是XMGPerson类的实例对象）
     
     - [obj respondsToSelector:@selector(run)] : 判断obj能不能调用run方法，[obj run]能否调用成功,能返回YES,否返回NO.
     - [obj instancesRespondToSelector:@selector(run)] : 判断obj类的实例对象能不能调用run方法，[[[obj alloc] init] run]能否调用成功
     - 例子 : 
     // [字符串对象 length]
     NSString *string = @"";
     [string respondsToSelector:@selector(length)];
     
     // [字符串对象 length]
     [NSString instancesRespondToSelector:@selector(length)];
     
     // [NSString length]
     [NSString respondsToSelector:@selector(length)];
     */
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) { // 类对象调用,只不过编译器不提示
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    
    
    /**
     *  获取系统版本的一些技巧
     */
    if ([@"" respondsToSelector:@selector(sizeWithAttributes:)]) { // 系统版本 >= 7.0
    
    } else {
        
    }
    
    if (NSClassFromString(@"UIAlertController")) { // 系统版本 >= 8.0
        
    } else {
    
    }
    
    // 通过对NSFoundation框架的系统版本变化来判断系统版本
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_8_0) { // 系统版本 >= 8.0
        
    } else {
        
    }
    
    if (iOS(8.0)) { // 系统版本 >= 8.0
    
    } else {
    
    }
    
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) { // 系统版本 >= 8.0
        
    } else {
        
    }
    
    NSComparisonResult result = [[UIDevice currentDevice].systemVersion compare:@"8.0"];
    if (result != NSOrderedAscending) { // 系统版本 >= 8.0
        
    } else {

    }
    /**
     *  - 列子 :
         NSCalendar *calendar = nil;
         if (iOS8) {
         calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
         } else {
         calendar = [NSCalendar currentCalendar];
     }
     */
}

- (void)delta4
{
    /**
     *  NSCalendar求时间间隔
     */
    
    // 日期格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 2个日期对象
    NSDate *date1 = [fmt dateFromString:@"2016-01-31 10:18:01"];
    NSDate *date2 = [fmt dateFromString:@"2016-02-01 11:22:45"];
    
    // 求时间间隔
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *cmps = [calendar components:unit fromDate:date1 toDate:date2 options:0];
    NSLog(@"%@", cmps);
}

- (void)getComponent
{
    /**
     *  NSCalendar获得时间中的某个元素
     */

    NSDate *date = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 返回单一元素
    NSInteger year = [calendar component:NSCalendarUnitYear fromDate:date];
    
    // 返回多个单个元素
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date];
    NSLog(@"%@", cmps);
    
    
    
    /**
     利用NSDateFormatter取出时间中的某个元素
     */
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy";
    NSString *yearStr = [fmt stringFromDate:date];
    fmt.dateFormat = @"MM";
    NSString *monthStr = [fmt stringFromDate:date];
    NSLog(@"%@ %@", yearStr, monthStr);
}

#pragma mark - 求出时间间隔
- (void)delta3
{
    // 日期格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 2个日期对象
    NSDate *date1 = [fmt dateFromString:@"2016-01-29 10:18:01"];
    NSDate *date2 = [fmt dateFromString:@"2016-02-02 11:22:45"];
    
    // 从date1到date2之间走过的秒数
    XMGInterval *interval = [date2 xmg_intervalSinceDate:date1];
    
//    XMGIntervalStruct interval = [date2 xmg_intervalSinceDate:date1];
    
//    NSDictionary *interval = [date2 xmg_intervalSinceDate:date1];
//    
//    NSInteger day = [interval[XMGIntervalDayKey] integerValue];
//    NSInteger hour = [interval[XMGIntervalHourKey] integerValue];
//    NSInteger minute = [interval[XMGIntervalMinuteKey] integerValue];
//    NSInteger second = [interval[XMGIntervalSecondKey] integerValue];
    
//    NSArray *interval = [date2 xmg_intervalSinceDate:date1];
//    
//    NSInteger day = [interval[XMGIntervalIndexDay] integerValue];
//    NSInteger hour = [interval[XMGIntervalIndexHour] integerValue];
//    NSInteger minute = [interval[XMGIntervalIndexMinute] integerValue];
//    NSInteger second = [interval[XMGIntervalIndexSecond] integerValue];
    
    NSLog(@"%zd天%zd小时%zd分%zd秒", interval.day, interval.hour, interval.minute, interval.second);
}

- (void)delta2
{
    // 日期格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 2个日期对象
    NSDate *date1 = [fmt dateFromString:@"2016-01-29 10:18:01"];
    NSDate *date2 = [fmt dateFromString:@"2016-02-02 11:22:45"];
    
    // 从date1到date2之间走过的秒数
    
    NSInteger day = 0;
    NSInteger hour = 0;
    NSInteger minute = 0;
    NSInteger second = 0;
    
    [date2 xmg_intervalSinceDate:date1 day:&day hour:&hour minute:&minute second:&second];
    
    NSLog(@"%zd天%zd小时%zd分%zd秒", day, hour, minute, second);
}

- (void)delta
{
    // 日期格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 2个日期对象
    NSDate *date1 = [fmt dateFromString:@"2016-01-29 10:18:01"];
    NSDate *date2 = [fmt dateFromString:@"2016-02-02 11:22:45"];
    
    // 从date1到date2之间走过的秒数
    NSInteger interval = [date2 timeIntervalSinceDate:date1];
    
    // 1分钟 = 60秒
    NSInteger secondsPerMinute = 60;
    
    // 1小时 = 60 * 60秒 = 3600秒
    NSInteger secondsPerHour = 60 * secondsPerMinute;
    
    // 1天 = 24 * 60  * 60秒
    NSInteger secondsPerDay = 24 * secondsPerHour;
    
    NSInteger day = interval / secondsPerDay;
    NSInteger hour = (interval % secondsPerDay) / secondsPerHour;
    NSInteger minute = ((interval % secondsPerDay) % secondsPerHour) / secondsPerMinute;
    NSInteger second = interval % secondsPerMinute;
    
    NSLog(@"相差 %zd天%zd小时%zd分%zd秒", day, hour, minute, second);
}

#pragma mark - 比较大小
- (void)compare
{
    // 帖子的审核通过时间
    NSString *createdAtString = @"2016-01-29 10:18:01";
    // 日期格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *createdAtDate = [fmt dateFromString:createdAtString];
    
    // 当前时间(获得是零时区,需要转变成东八区)
    NSDate *nowDate = [NSDate date];
    
    NSComparisonResult result = [nowDate compare:createdAtDate];
    if (result == NSOrderedAscending) {
        NSLog(@"nowDate < createdAtDate");
    } else if (result == NSOrderedSame) {
        NSLog(@"nowDate == createdAtDate");
    } else if (result == NSOrderedDescending) {
        NSLog(@"nowDate > createdAtDate");
    }
    
    /*
     NSComparisonResult的取值
     NSOrderedAscending = -1L, 升序，左边 < 右边
     NSOrderedSame, 相同
     NSOrderedDescending，降序，左边 > 右边
     */
}

#pragma mark - NSDate * -> NSString *
- (void)date2string
{
    // 日期格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    // 设置日期格式(日期格式要跟服务返回的格式相匹配)
    fmt.dateFormat = @"yyyy/MM-dd HH-mm:ss";
    
    // NSDate * -> NSString *
    NSString *string = [fmt stringFromDate:[NSDate date]];
    
    
    NSLog(@"%@", string);
}

#pragma mark - NSString * -> NSDate *
- (void)string2date4
{
    // 时间戳(timestamp) ： 从1970-01-01 00:00:00 +0000开始走过的毫秒数
    NSString *string = @"1254345345435";
    
    // 获取时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:string.doubleValue / 1000];
    NSLog(@"%@", date);
}

- (void)string2date3
{
    // 日期格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    // 设置区域标识符
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en-US"];
    
    // 设置日期格式
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    
    /**
     *  - 服务器返回后面带有时区需要设置区域标识符
        - 中划线和下划线都可以
        - 真机调试时间需要加上区域标识符.
        fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];

     */
    // NSString * -> NSDate *
    NSDate *date = [fmt dateFromString:@"Tue May 31 17:46:55 +0800 2011"];
    
    NSLog(@"%@", date);
}

- (void)string2date2
{
    // 日期格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    // 设置日期格式(日期格式要跟服务返回的格式相匹配)
    fmt.dateFormat = @"MM/dd/yyyy HH点mm分ss秒";
    
    // NSString * -> NSDate *
    NSDate *date = [fmt dateFromString:@"01/29/2016 10点18分01秒"];
    
    NSLog(@"%@", date);
}

- (void)string2date
{
    // 日期格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    // 设置日期格式
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // NSString * -> NSDate *
    NSDate *date = [fmt dateFromString:@"2016-01-29 10:18:01"];
    
    NSLog(@"%@", date);
}
@end
