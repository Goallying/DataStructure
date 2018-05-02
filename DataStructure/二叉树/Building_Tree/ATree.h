//
//  ATree.h
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/29.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANode.h"

@interface ATree : NSObject

// 根据前序遍历结果和后续遍历结构构建树
- (instancetype)initWith_preorders:(NSArray *)preorders inorders:(NSArray *)inorders ;
@property (nonatomic ,strong ,readonly)ANode * root ;

@end
