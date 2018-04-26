//
//  SingleLinkedList.h
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/21.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingleLinkedNode.h"

@interface SingleLinkedList : NSObject

@property (nonatomic ,strong , readonly)SingleLinkedNode * header ;
@property (nonatomic ,strong , readonly)SingleLinkedNode * tail ;
@property (nonatomic ,assign , readonly)NSInteger length ;

- (void)set_obj:(id)obj for_key:(NSString *)key ;
- (void)insert_obj_at_head:(id)obj for_key:(NSString *)key;
- (SingleLinkedNode *)value_for_key:(NSString *)key ;


- (void)remove_obj_for_key:(NSString *)key ;
- (void)removeAllObj ;

- (void)reverse ;


@end
