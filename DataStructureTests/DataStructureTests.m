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
#pragma mark -- 快速排序
- (void)test_quick_sort{
      vector< int> array =  {6  ,1  ,2 ,7, 9 , 3 , 4 ,5,10,  8} ;
    QuickSort * sort = new QuickSort() ;
    sort->array = array ;
    sort->quick_sort(0, 9) ;
    
//    vector< int> array =  {6  ,1  ,2 ,7, 9 , 3 , 4 ,5,10,  8} ;
//    quick_sort(array);

}
#pragma mark --
#pragma mark -- 打印单双链表
#pragma mark --
#pragma mark -- 链表中倒数第k个结点
- (void)test_print_chain {
    //
    //单向链表
    SingleLinkedList * singleList = [SingleLinkedList new];
    [singleList set_obj:@"1" for_key:@"1"];
    [singleList set_obj:@"2" for_key:@"2"];
    [singleList set_obj:@"3" for_key:@"3"];
    [singleList set_obj:@"4" for_key:@"4"];
    [singleList set_obj:@"5" for_key:@"5"];
    //倒序打印
//    [singleList print_all_nodes_reversily];
    //链表中倒数第k个结点
    SingleLinkedNode * kNode = [singleList node_for_reversily_index:5];
    XCTAssertEqual([kNode.obj integerValue], 1);
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
#pragma mark -- 合并两个排序的链表
- (void)test_combine_chain {
    
    SingleLinkedList * singleList1 = [SingleLinkedList new];
    [singleList1 set_obj:@"1" for_key:@"1"];
    [singleList1 set_obj:@"2" for_key:@"2"];
    [singleList1 set_obj:@"3" for_key:@"3"];
    [singleList1 set_obj:@"4" for_key:@"4"];
    [singleList1 set_obj:@"5" for_key:@"5"];
    
    SingleLinkedList * singleList2 = [SingleLinkedList new];
    [singleList2 set_obj:@"2" for_key:@"2"];
    [singleList2 set_obj:@"4" for_key:@"4"];
    [singleList2 set_obj:@"6" for_key:@"6"];
    [singleList2 set_obj:@"7" for_key:@"7"];
    [singleList2 set_obj:@"10" for_key:@"10"];
    // 合并完：1，2，3，4，5，6，7，10.
    SingleLinkedList * list_combine = [SingleLinkedList new];
    SingleLinkedNode * f_node = singleList1.header ;
    SingleLinkedNode * s_node = singleList2.header ;
   
    while (f_node || s_node) {
        
        if (!f_node && s_node) {
            [list_combine set_obj:s_node.obj for_key:s_node.key];
            s_node = s_node.nextNode ;
        }else if (!s_node &&f_node){
            [list_combine set_obj:f_node.obj for_key:f_node.key];
            f_node = f_node.nextNode ;
        }else if (f_node.number > s_node.number) {
            [list_combine set_obj:s_node.obj for_key:s_node.key];
            s_node = s_node.nextNode ;
        }else if (f_node.number == s_node.number){
            [list_combine set_obj:f_node.obj for_key:f_node.key];
            f_node = f_node.nextNode ;
            s_node = s_node.nextNode ;
        }else{
            [list_combine set_obj:f_node.obj for_key:f_node.key];
            f_node = f_node.nextNode ;
        }
    }
    
    SingleLinkedNode * p_node = list_combine.header ;
    while (p_node) {
        NSLog(@"-- %@\n" ,p_node.obj);
        p_node = p_node.nextNode ;
    }
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
#pragma mark --
#pragma mark -- 二进制中1的位数
- (void)test_binary_1_count{
    int c = binary_count_1(-1);
    XCTAssertEqual(c, 32);
}
#pragma mark --
#pragma mark -- 数值的整数次方
- (void)test_power{
    double val = power(2, -1);
    NSLog(@"val ====== %f" ,val);
}
#pragma mark --
#pragma mark -- 调整数组顺序使奇数位于偶数前面
- (void)test_reorder{
    vector<int> array = {2,5,8,6,7,4,1,11,10};
    reorder_array(array);
}
#pragma mark --
#pragma mark -- 树的子结构
- (void)test_sub_tree{
    //no imp.
}
- (void)test_print_matric {
    //    1,  2,  3,  4
    //
    //    5,  6,  7,  8
    //
    //    9, 10, 11, 12
    //
    //    3, 14, 15, 16
    vector< vector<int> > array = {
        {1,  2,  3,  4},
        {5,  6,  7,  8},
        {9, 10, 11, 12},
        {3, 14, 15, 16}
    };
    print_matrix_clockwisily(array);
    
}
- (void)tearDown {
    [super tearDown];
}
+ (void)tearDown {
    [super tearDown];
}



@end
