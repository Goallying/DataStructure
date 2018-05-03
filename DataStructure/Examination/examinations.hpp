//
//  find_num.hpp
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/28.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#ifndef examinations_hpp
#define examinations_hpp

#include <stdio.h>
#include <vector>
#include <stack>
using namespace std ;

#pragma mark --
#pragma mark -- 查找字符串
bool find_num_in_array(int target , vector< vector<int> > array);

#pragma mark --
#pragma mark -- 替换字符串
void replace_string(char * str , int length) ;

#pragma mark --
#pragma mark -- 打印链表->看单向双向链表
//void print_single_chain(void);
//void print_double_direction_chain(void);
#pragma mark --
#pragma mark -- 用两个栈实现队列
class StackSolution {
public:
    int pop();
    void push(int val) ;
    
private:
    stack<int> stack1 ;
    stack<int> stack2 ;
};
#pragma mark --
#pragma mark -- 旋转数组的最小数字
int minimum_in_rotate_array (vector< int > array);

#pragma mark --
#pragma mark -- 斐波那契数列
int fibonacci (int n) ;

#pragma mark --
#pragma mark -- 跳台阶问题 (矩阵覆盖).
int jump_steps(int n) ;

#pragma mark --
#pragma mark -- 改-跳台阶问题
int perv_jump_steps(int n) ;

#pragma mark --
#pragma mark -- 二进制中1的位数
int binary_count_1(int n);

#pragma mark --
#pragma mark -- 数值的整数次方
double power (double n , int exp);

#pragma mark --
#pragma mark -- 调整数组顺序使奇数位于偶数前面
void reorder_array(vector<int> array) ;

#pragma mark --
#pragma mark -- 链表中倒数第k个结点
//@see 单向链表实现 (node_for_reversily_index)。
#pragma mark --
#pragma mark -- 反转链表
//@see 单向链表实现 (reverse)。
#pragma mark --
#pragma mark -- 合并两个排序的链表
//@see unit-test -> test_combine_chain

#endif /* examinations_hpp */
