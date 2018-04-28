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

@implementation AVL_Tree {
    
    NSMutableArray * _arrayM  ;
}

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
    
        _arrayM = [sortedArray mutableCopy];
        [self building:_arrayM];
        
    }
    return self ;
}

- (void)building:(NSMutableArray *)array {
    
    _root = [self root_for_nums:array direction:NODE_DIRECTION_M];
    [self set_info];
}

- (void)set_info{
    _nodecount = _arrayM.count ;
    _left_depth = [self height_for_node:_root.left];
    _right_depth = [self height_for_node:_root.right];
    _depth = MAX(_left_depth + 1, _right_depth + 1) ;
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

- (void)insert_value:(NSString *)val {
    // 不允许重复值的出现
    if ([_arrayM containsObject:val] || val.length == 0) {
        return ;
    }
    [_arrayM addObject:val];
    AVLNode * node = [AVLNode new];
    node.value = val ;
    if (!_root) {
        _root = node ;
        _depth ++ ;
        _nodecount = 1 ;
        return ;
    }
    AVLNode * target = _root ;
    BOOL done = NO ;
    while (target && done == NO) {
        if (node.number > target.number) {
            if (!target.right) {
                target.right = node ;
                node.root = target ;
                [self l_turn:target];
                done = YES ;
            }else{
                target = target.right ;
            }
        }else{
            if (!target.left) {
                target.left = node ;
                node.root = target ;
                [self r_turn:target];
                done = YES ;
            }else{
                target = target.left ;
            }
        }
    }
    [self set_info];
    // 整棵树旋转。有可能需要。（比如不断在右边插入数据，局部平衡过后，在某一时刻必将导致整棵树的失衡）。
    if (labs(_left_depth - _right_depth) >= 2) {
        if (_right_depth > _left_depth) {
            [self tree_l_turn];
        }else{
            [self tree_r_turn];
        }
        [self set_info];
    }
   
}
- (void)remove_value:(NSString *)val {
    
    if (!val || val.length == 0 || ![_arrayM containsObject:val]) {
        return ;
    }
    AVLNode * node = [self node_for_value:val];
    AVLNode * root = node.root ;
    AVLNode * left = node.left ;
    AVLNode * right = node.right ;
    
    
    
}

- (AVLNode *)node_for_value:(NSString *)val {
    
    AVLNode * cur = _root ;
    NSInteger number = [val integerValue];
    
    while (cur && cur.number != number) {
//        NSLog(@"search---%@",cur.value);
        if (number > cur.number) {
            cur = cur.right ;
        }else{
            cur = cur.left ;
        }
    }
    return cur ;
}

//树的左旋转
- (void)tree_l_turn {
    AVLNode * cur = _root ;
    AVLNode * right = cur.right ;
    AVLNode * right_left = right.left ;
    
    _root = right ;
    _root.root = nil ;
    _root.left = cur ;
    
    cur.right = right_left ;
    right_left.root = cur ;
}
//树的右旋转
- (void)tree_r_turn {
    
    AVLNode * cur = _root ;
    AVLNode * left = cur.left ;
    AVLNode * left_right = cur.right ;
    
    _root = left ;
    _root.root = nil ;
    _root.right = cur ;
    
    cur.left = left_right ;
    left_right.root = cur ;
}
//右旋转
- (void)r_turn:(AVLNode *)cur {
    
    if (cur.right) {
        return ;
    }
    AVLNode * gradfather = cur.root.root ;
    AVLNode * father = cur.root ;
    
    gradfather.left = cur ;
    cur.root = gradfather ;
    cur.right = father ;
    
    father.root = cur ;
    father.left = nil ;
}

//左旋转
- (void)l_turn:(AVLNode *)cur {
    
    if (cur.root.left) {
        return ;
    }
    
    AVLNode * gradfather = cur.root.root ;
    AVLNode * father = cur.root ;
    
    gradfather.right = cur ;
    cur.root = gradfather ;
    cur.left = father ;
    
    father.root = cur ;
    father.right = nil ;
}

- (NSInteger)height_for_node:(AVLNode *)n {
    
    if (!n) return 0 ;
    
    NSInteger lh = [self height_for_node:n.left];
    NSInteger rh = [self height_for_node:n.right];
    
    return MAX(lh + 1, rh + 1);
    
}

@end
