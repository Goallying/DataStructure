
//
//  ATree.m
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/29.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ATree.h"

@implementation ATree

//先序：ABDEFGCHIJK
//中序：D FEG B A  CIKJH
//根据先序第一个访问第一个为A，可知A为根节点，根据中序的结果可以划分出DFEGB为左子树中的节点集合，CIKJH为右子树中的节点集合，先序遍历第二个访问的便是左子树的根节点B，根据中序遍历可知DFEG为B左子树节点集合，B无右节点，先序遍历第三个节点是D，根据上一步划分结果可知D无左子树，右子树节点集合为FEG，剩下的依次类推
-(instancetype)initWith_preorders:(NSArray *)preorders inorders:(NSArray *)inorders{
    
    if (self = [super init]) {
        [self building_preorders:preorders inorders:inorders];
    }
    return self ;
}

- (ANode *)

- (void)building_preorders:(NSArray *)pres inorders:(NSArray *)inorders{
    
    if (!pres || pres.count == 0 ||!inorders ||inorders.count == 0 || pres.count != inorders.count) {
        return ;
    }
    _root = [ANode new];
    _root.value = pres.firstObject ;
    
    NSInteger idx_root = [inorders indexOfObject:pres.firstObject];
    NSArray * lefts = [inorders subarrayWithRange:NSMakeRange(0, idx_root)];
    NSArray * rights = [inorders subarrayWithRange:NSMakeRange(idx_root + 1, inorders.count - 1 - idx_root)] ;
    
    
    
}
@end
