



//
//  MapNode.m
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/22.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "MapNode.h"

@implementation MapNode

- (instancetype)initWithKey:(NSString *)key value:(id)value{
    if (self = [super init]) {
        _key = key ;
        _value = value ;
    }
    return self ;
}


@end
