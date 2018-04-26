//
//  AVLNode.m
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/26.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "AVLNode.h"

@implementation AVLNode



- (NSInteger)number{
    
    if (_number == 0 ||!_number) {
        return [_value integerValue];
    }
    return _number ;
}
@end
