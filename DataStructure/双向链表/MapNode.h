//
//  MapNode.h
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/22.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapNode : NSObject

@property (nonatomic ,strong)MapNode * preNode ;
@property (nonatomic ,strong)MapNode * nextNode ;
@property (nonatomic ,copy ,readonly)NSString * key ;
@property (nonatomic ,strong)id value  ;

- (instancetype)initWithKey:(NSString *)key value:(id)value ;

@end
