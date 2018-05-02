//
//  LinkedMap.h
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/22.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapNode.h"

@interface LinkedMap : NSObject

@property (nonatomic ,strong ,readonly)MapNode * header ;
@property (nonatomic ,strong ,readonly)MapNode * tail ;
@property (nonatomic ,assign ,readonly)NSInteger lenth ;

- (void)set_obj:(id)obj for_key:(NSString *)key ;

//- (void)bring_value_for_key_to_header:(NSString *)key ; 以下方法实现了该方法。
- (void)insert_obj_at_head:(id)value for_key:(NSString *)key ;

- (void)remove_obj_for_key:(NSString *)key ;
- (id)value_for_key:(NSString *)key ;

- (void)print_all_nodes_reversily;
@end
