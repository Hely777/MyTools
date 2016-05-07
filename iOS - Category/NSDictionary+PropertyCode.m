//
//  NSDictionary+PropertyCode.m
//  07-Runtime(字典转模型KVC实现)
//
//  Created by CM on 16/1/11.
//  Copyright © 2016年 MrCai. All rights reserved.
//

#import "NSDictionary+PropertyCode.h"

// isKindOfClass:判断下是否是当前类或者子类

@implementation NSDictionary (PropertyCode)
// 自动生成,解析字典去生成,有多少key,就有多少个属性
- (void)propertyCode
{
    NSMutableString *codes = [NSMutableString string];
    
    // 遍历字典中所有key
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        NSString *code;
        /**
         *  在这里面__NSCFBoolean是NSNunmber的子类
            如果判断NSInteger在前,当判断到[value isKindOfClass:[NSNumber class]]时,子类属于父类,导致__NSCFBoolean的答应你结果会使NSInteger类型,所以必须把__NSCFBoolean的判断放在前.
            注意 : 父类不从属于子类,子类却从属于父类. 
         *
         */
        if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            code  = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",key];
            
        } else if ([value isKindOfClass:[NSString class]]) {
            
            code  = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",key];
            
        } else if ([value isKindOfClass:[NSArray class]]) {
            
            code  = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",key];
            
        } else if ([value isKindOfClass:[NSDictionary class]]) {
            
            code  = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",key];
            
        } else if ([value isKindOfClass:[NSNumber class]]) {
            
            code  = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",key];

            
        }
        
        // 生成一行属性代码 reposts_count:@property (nonatomic, assign) NSInteger reposts_count;
        
        [codes appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",codes);

}

@end
