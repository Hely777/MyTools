//
//  NSDictionary+PropertyCode.h
//  07-Runtime(字典转模型KVC实现)
//
//  Created by CM on 16/1/11.
//  Copyright © 2016年 MrCai. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  生成字典转模型属性的分类
 */
@interface NSDictionary (PropertyCode)
// 设计方法:不要给我闭门造车
- (void)propertyCode;

@end
