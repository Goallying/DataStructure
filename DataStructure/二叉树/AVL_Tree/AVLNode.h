//
//  AVLNode.h
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/26.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVLNode : NSObject

@property (nonatomic ,strong)AVLNode * left ;
@property (nonatomic ,strong)AVLNode * right ;
@property (nonatomic ,weak)  AVLNode * root ;

@property (nonatomic ,copy)NSString * value ;
@property (nonatomic ,assign)NSInteger number ;
@end
