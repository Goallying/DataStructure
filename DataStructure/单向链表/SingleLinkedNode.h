//
//  SingleLinkedNode.h
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/21.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleLinkedNode : NSObject

@property (nonatomic ,strong)id obj ;
@property (nonatomic ,strong ,readonly)NSString * key ;
@property (nonatomic ,strong)SingleLinkedNode * nextNode ;

- (instancetype)initWithObj:(id)obj forKey:(NSString *)key;

@end
