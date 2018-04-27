//
//  ViewController.m
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/7.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController.h"
#import "SingleLinkedList.h"
#import "LinkedMap.h"
#import "AVL_Tree.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //数据结构含义：计算机存储和组织数据方式。
    //常见数据结构：线性表，树，图
    //逻辑上结构上划分：集合结构，线性结构 ，非线性结构（树状结构，图形结构）。
    //存储结构：顺序存储结构，链式存储结构。（索引存储结构，散列存储结构）
    
    //集合结构：NSSet NSMutableSet。
    //线性结构：NSArray NSMutableArray。队列，栈。
    //树装结构：类似OC 的继承关系，多个类可以继承同一个类，子类也可以被继承。
    //图形结构：任意两个数据节点都可以关联。
    
    
    //单向链表
//    SingleLinkedList * singleList = [SingleLinkedList new];
//    [singleList set_obj:@"1" for_key:@"1"];
//    [singleList set_obj:@"2" for_key:@"2"];
//    [singleList set_obj:@"3" for_key:@"3"];
//    [singleList set_obj:@"4" for_key:@"4"];
//    [singleList set_obj:@"5" for_key:@"5"];
//
////    [singleList set_obj:@"100" for_key:@"2"];
////    [singleList set_obj:@"6" for_key:@"6"];
////
////    [singleList remove_obj_for_key:@"1"];
////    [singleList insert_obj_at_head:@"header" for_key:@"header"];
////    [singleList removeAllObj];
//        [singleList remove_obj_for_key:@"5"];
//
//    [singleList reverse];
//
//    NSLog(@"header === %@ ,tail == %@ ,lenth ===%lu" ,singleList.header.obj,singleList.tail.obj ,singleList.length);
//    SingleLinkedNode * node = singleList.header ;
//    while (node) {
//        NSLog(@"===%@",node.obj);
//        node = node.nextNode ;
//    }

//    LinkedMap * map = [LinkedMap new];
//    [map set_obj:@"1" for_key:@"1"];
//    [map set_obj:@"2" for_key:@"2"];
//    [map set_obj:@"3" for_key:@"3"];
//    [map set_obj:@"4" for_key:@"4"];
//    [map set_obj:@"5" for_key:@"5"];
//
////    [map remove_obj_for_key:@"1"];
////    [map remove_obj_for_key:@"5"];
//    [map insert_obj_at_head:@"100" for_key:@"100"];
//
//    MapNode * node = map.header ;
//    NSLog(@"header == %@ ,tail === %@ ,length == %lu",map.header.value ,map.tail.value,map.lenth);
//    while (node) {
//        NSLog(@"vaule ==== %@" ,node.value);
//        node = node.nextNode ;
//    }


//    NSString * s = @"1";  //0x10643f0a0  0x10643f0e0  0x10643f100
//    NSLog(@"p == %p" ,s); // 0x600000250ae0 0x600000250ae8 0x600000250af0
////https://www.jianshu.com/p/325abcded1df
//    NSArray * array = @[s,@"2",@"3"];
//    NSLog(@"p == %p" ,array);
    
//    x/100xb array
//    0x600000250ad0: 0x48 0x26 0x98 0x07 0x01 0x00 0x00 0x00
//    0x600000250ad8: 0x03 0x00 0x00 0x00 0x00 0x00 0x00 0x00
//    0x600000250ae0: 0xa0 0xf0 0x43 0x06 0x01 0x00 0x00 0x00
//    0x600000250ae8: 0xe0 0xf0 0x43 0x06 0x01 0x00 0x00 0x00
//    0x600000250af0: 0x00 0xf1 0x43 0x06 0x01 0x00 0x00 0x00
//    0x600000250af8: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
//    0x600000250b00: 0xe8 0xbb 0xff 0x0b 0x01 0x00 0x00 0x00
//    0x600000250b08: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
//    0x600000250b10: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
//    0x600000250b18: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
//    0x600000250b20: 0x01 0x00 0x00 0x00 0x00 0x00 0x00 0x00
//    0x600000250b28: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
//    0x600000250b30: 0xad 0xbe 0x13 0xe5

    
    
    NSArray * array = @[@"1",@"7",@"2",@"3",@"4",@"6",@"5",@"99",@"11",@"22"];
    AVL_Tree * tree  = [[AVL_Tree alloc]initWithNums:array];
    NSLog(@"=== %@",tree);
    
    [tree insert_value:@"100"];
    [tree insert_value:@"104"];
    [tree insert_value:@"105"];
    [tree insert_value:@"106"];
    [tree insert_value:@"107"];

    NSLog(@"=== %@",tree);

    
}

@end
