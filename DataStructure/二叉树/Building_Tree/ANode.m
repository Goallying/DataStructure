

//
//  ANode.m
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/29.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ANode.h"

@implementation ANode

- (NSInteger)number{
    
    if (_number == 0 ||!_number) {
        return [_value integerValue];
    }
    return _number ;
}

@end
