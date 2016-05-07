//
//  NSObject+Property.h
//  06-Runtime(动态添加属性)
//
//  Created by xmg on 16/1/11.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

/**
 *  动态给系统类添加属性分类
 *
 *  @param Property <#Property description#>
 *
 *  @return <#return value description#>
 */
#import <Foundation/Foundation.h>
// 分类不能生成属性
@interface NSObject (Property)

// 分类:只会生成get,set方法声明,并不会生成get,set方法实现和下划线成员属性
@property NSString *name;

@end
