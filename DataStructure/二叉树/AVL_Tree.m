//
//  AVL_Tree.m
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/26.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "AVL_Tree.h"

typedef NS_ENUM(NSInteger , NODE_DIRECTION){
    
    NODE_DIRECTION_M , // for root
    NODE_DIRECTION_L ,
    NODE_DIRECTION_R
} ;

@implementation AVL_Tree

- (instancetype)initWithNums:(NSArray *)array {
    if (self = [super init]) {
        
        NSArray * sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return NSOrderedAscending ;
            }
            return NSOrderedDescending ;
            
        }];
        
        _left_depth = 0 ;
        _right_depth = 0 ;
        _depth = 0 ;
        
        [self building:sortedArray];
        
    }
    return self ;
}

- (void)building:(NSArray *)array {
    
    _root = [self root_for_nums:array direction:NODE_DIRECTION_M];
    _depth = MAX(_left_depth + 1, _right_depth + 1);
}

- (AVLNode *)root_for_nums:(NSArray *)array direction:(NODE_DIRECTION)direction{
    
    if (!array ||array.count == 0) {
        return nil ;
    }
    NSInteger mid_idx = array.count /2 ;
    NSString *mid_str = array[mid_idx];
    
    AVLNode * node = [AVLNode new];
    node.value = mid_str ;
    
    NSArray * lefts = [array subarrayWithRange:NSMakeRange(0, mid_idx)];
    NSArray * rights = [array subarrayWithRange:NSMakeRange(mid_idx + 1, array.count - mid_idx - 1)] ;
    
    AVLNode * right = [self root_for_nums:rights direction:NODE_DIRECTION_R];
    right.root = node ; // weak refrence
    
    AVLNode * left = [self root_for_nums:lefts direction:NODE_DIRECTION_L];
    left.root = node ; // weak refrence
    
    node.left = left ;
    node.right = right ;
    
    return node ;
    
}

@end
