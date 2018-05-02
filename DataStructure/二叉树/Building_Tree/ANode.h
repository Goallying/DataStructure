//
//  ANode.h
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/29.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ANode : NSObject

@property (nonatomic ,strong)ANode * left ;
@property (nonatomic ,strong)ANode * right ;
@property (nonatomic ,weak)  ANode * root ;

@property (nonatomic ,copy)NSString * value ;
@property (nonatomic ,assign)NSInteger number ;

@end
