//
//  AVL_Tree.h
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/26.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVLNode.h"
@interface AVL_Tree : NSObject

- (instancetype)initWithNums:(NSArray *)array ;

@property (nonatomic ,assign ,readonly)NSInteger depth ;
@property (nonatomic ,assign ,readonly)NSInteger left_depth ;
@property (nonatomic ,assign ,readonly)NSInteger right_depth ;
@property (nonatomic ,assign ,readonly)NSInteger nodecount ;

@property (nonatomic ,strong ,readonly)AVLNode * root ;


- (void)insert_value:(NSString *)val ;
- (AVLNode *)node_for_value:(NSString *)val ;


@end
