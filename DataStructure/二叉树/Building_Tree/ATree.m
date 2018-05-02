
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
        [self building:preorders ins:inorders];
    }
    return self ;
}
- (void)building:(NSArray *)pres ins:(NSArray *)ins{
   
    _root = [self building_preorders:pres inorders:ins];
    
}

- (ANode *)building_preorders:(NSArray *)pres inorders:(NSArray *)ins {
    
    if (!pres || pres.count == 0 ||!ins || ins.count == 0) {
        return nil;
    }
    ANode * node = [ANode new];
    node.value = pres.firstObject ;
    
    int l_len = 0 ;
    while (pres[0] != ins[l_len] && l_len < pres.count) {
        ++ l_len ;
    }
    
    NSMutableArray * l_pres = [NSMutableArray array];
    NSMutableArray * l_ins = [NSMutableArray array];
    NSMutableArray * r_pres = [NSMutableArray array];
    NSMutableArray * r_ins = [NSMutableArray array];
    for (int i = 0; i < l_len; i++) {
        [l_pres addObject:pres[i + 1]];
        [l_ins addObject:ins[i]];
    }
    for (int i = l_len + 1; i< pres.count; i++) {
        [r_pres addObject:pres[i]];
        [r_ins addObject:ins[i]];
    }
    
    node.left = [self building_preorders:l_pres inorders:l_ins];
    node.right = [self building_preorders:r_pres inorders:r_ins];
    
    return node ;
    
    
}


@end
