//
//  DataStructureTests.m
//  DataStructureTests
//
//  Created by 朱来飞 on 2018/4/28.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LinkedMap.h"
#import "SingleLinkedList.h"
#import "ATree.h"


#import "examinations.hpp"

@interface DataStructureTests : XCTestCase

@end

@implementation DataStructureTests
+ (void)setUp {
    [super setUp];
}
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

#pragma mark --
#pragma mark -- 字符串替换
- (void)test_replace_str{
    char s[1024] = "we are happy! and you are a perv";
    replace_string(s, 13);
}
#pragma mark --
#pragma mark -- 二维数组查找
- (void)test_find_num_in_array{
    
    vector< vector<int> > array  = {{1,2,3,9,15},
        {3,4,5,17,28},
        {4,6,7,18,30},
        {19,27,33,45,56}};
    bool res = find_num_in_array(1, array);
    XCTAssertTrue(res);
}
#pragma mark --
#pragma mark -- 打印单双链表
- (void)test_print_chain {
    //
    //单向链表
    SingleLinkedList * singleList = [SingleLinkedList new];
    [singleList set_obj:@"1" for_key:@"1"];
    [singleList set_obj:@"2" for_key:@"2"];
    [singleList set_obj:@"3" for_key:@"3"];
    [singleList set_obj:@"4" for_key:@"4"];
    [singleList set_obj:@"5" for_key:@"5"];
    [singleList print_all_nodes_reversily];
    //双向链表
//    LinkedMap * map = [LinkedMap new];
//    [map set_obj:@"1" for_key:@"1"];
//    [map set_obj:@"2" for_key:@"2"];
//    [map set_obj:@"3" for_key:@"3"];
//    [map set_obj:@"4" for_key:@"4"];
//    [map set_obj:@"5" for_key:@"5"];
//    [map print_all_nodes_reversily];
}
#pragma mark --
#pragma mark -- 重建二叉树
- (void)test_rebuilding_tree{
    //先序：ABDEFGCHIJK
    //中序：DFEGBACIKJH
    NSArray * pre = @[@"A",@"B",@"D",@"E",@"F",@"G",@"C",@"H",@"I",@"J",@"K"];
    NSArray * ins = @[@"D",@"F",@"E",@"G",@"B",@"A",@"C",@"I",@"K",@"J",@"H"];
    ATree * tree = [[ATree alloc]initWith_preorders:pre inorders:ins];
    NSLog(@"building-tree === %@",tree);
}
#pragma mark --
#pragma mark -- 两个栈实现一个队列
- (void)test_stack_and_queue{
    //队列：FIFO
    //栈:FILO (first input last out put)
    StackSolution * solution = new StackSolution();
    solution->push(1);
    solution->push(2);
    solution->push(3);
    solution->push(4);
    solution->push(5);
    
    //
    NSLog(@"----%d", solution->pop());
    NSLog(@"----%d", solution->pop());
    NSLog(@"----%d", solution->pop());
    NSLog(@"----%d", solution->pop());
    NSLog(@"----%d", solution->pop());
// over pop.
//    NSLog(@"----%d", solution->pop());

}
#pragma mark --
#pragma mark -- 旋转数组的最小数字
- (void)test_minimum_in_array {
    vector<int> array = {3,4,5,1,2} ;
    int min = minimum_in_rotate_array(array);
    //min == 1.
    XCTAssertEqual(min, 1);
}
#pragma mark --
#pragma mark -- 斐波那契数列
- (void)test_fibonacci {
    int fib = fibonacci(5);
    NSLog(@"fibonacci === %d" ,fib);
}
#pragma mark --
#pragma mark -- 跳青蛙
- (void)test_jump_step{
    int kinds = jump_steps(4);
    NSLog(@"jump kinds == %d" ,kinds);
}
#pragma mark --
#pragma mark -- 改-跳台阶问题
- (void)test_perv_jump_step{
    int kinds = perv_jump_steps(4);
    NSLog(@"perv jump kinds === %d",kinds);
}
- (void)tearDown {
    [super tearDown];
}
+ (void)tearDown {
    [super tearDown];
}



@end
