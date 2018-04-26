
//
//  SingleLinkedNode.m
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/21.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "SingleLinkedNode.h"

@implementation SingleLinkedNode

-(instancetype)initWithObj:(id)obj forKey:(NSString *)key{
    if (self = [super init]) {
        _obj = obj ;
        _key = key ;
    }
    return self ;
}

@end
