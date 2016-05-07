//
//  XMGPerson.m
//  日期处理
//
//  Created by xmg on 16/1/30.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "XMGPerson.h"

@implementation XMGPerson

/*
 重写isEqual:的原则：
 1.最好要重写- (NSUInteger)hash方法
 2.如果[a isEqual:b] == YES，那么a.hash == b.hash
 3.如果a.hash == b.hash，[a isEqual:b]不一定是YES
 
 - hash : hash作为一个编码,每个对象都有,对象之间的hash编码有可能相同
 */

- (BOOL)isEqual:(XMGPerson *)person
{
    // 内存地址相同直接返回.
    if (self == person) return YES;
    
    // 类型不匹配直接返回
    if (person.class != self.class) return NO;
//    if (![person isKindOfClass:[self class]]) return NO;
    
    return self.age == person.age && self.money == person.money; // && [self.cat isEqual:person.cat];
}

- (NSUInteger)hash
{
    return self.age + self.money; // + self.cat.hash;
}

@end
