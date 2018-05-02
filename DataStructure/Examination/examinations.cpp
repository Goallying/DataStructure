//
//  find_num.cpp
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/28.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#include "examinations.hpp"

bool find_num_in_array(int target , vector< vector<int> > array){
    
    bool res = false ;
    if (array.empty()) {
        return res ;
    }
    int rows = (int)array.size();
    int cols = (int)array[0].size() ;
    
    //从右上角查找。
    int r = 0 ;
    int c = cols - 1 ;
    
    while (r < rows && c >= 0) {
        if (array[r][c] == target) {
            res = true ;
            break ;
        }else if (target > array[r][c]){
            r ++ ;
        }else{
            c -- ;
        }
    }
    return  res ;
    
}

void replace_string(char * str , int length){
    
    if (length == 0 || str == NULL) {
        return ;
    }
    
    int original_length = 0;
    int number_of_space = 0;
    int i = 0;
    while(str[i] != '\0')
    {
        ++ original_length;
        if(str[i] == ' ')
            ++ number_of_space;
        ++ i;
    }
    
    if (number_of_space <= 0)
        return ;
    
    
    int new_length = original_length + 2*number_of_space;
    
    int index_of_original = original_length;
    int index_of_new = new_length;
    //传入的char 不能修改。。。。
    char new_char[new_length] ;
    
    while(index_of_original>=0 && index_of_new>=index_of_original)
    {
        if(str[index_of_original] == ' ')
        {
            new_char[index_of_new--] = '0';
            new_char[index_of_new--] = '2';
            new_char[index_of_new--] = '%';
        }
        else
        {
            new_char[index_of_new--] = str[index_of_original];
        }
        -- index_of_original;
    }
    printf("%s" ,new_char);
}

int StackSolution::pop(){
    if (stack2.empty()) {
        while (!stack1.empty()) {
            int val = stack1.top() ;
            stack1.pop();
            stack2.push(val);
        }
    }
    int val = stack2.top() ;
    stack2.pop();
    return val ;
}
void StackSolution::push(int val){
    stack1.push(val);
}

int minimum_in_rotate_array (vector<int> array){
    if (array.empty()) {
        return 0 ;
    }
    for (int i = 0; i< array.size(); i++) {
        if (array[i] > array[i + 1]) {
            return array[i + 1];
        }
    }
    return array[0];
    
}
int fibonacci (int n) {
    
    if (n <= 0) {
        return 0 ;
    }
    if (n == 1 || n == 2) {
        return 1 ;
    }
    
    int i = 2 ;
    int fibn1 = 1;
    int fibn2 = 1;
    int fibn = 0 ;
    while (i < n) {
        
        fibn = fibn1 + fibn2 ;
        
        fibn1 = fibn2 ;
        fibn2 = fibn ;
        
        i++ ;
    }
    return fibn ;
}

int jump_steps(int n){
    // f(n) = f(n-1)+ (n-2);
    if (n < 0) {
        return 0 ;
    }
    if (n == 1 || n == 2) {
        return n ;
    }
    return fibonacci(n + 1);
}

int perv_jump_steps(int n)  {
    
    if (n <= 0) {
        return 0 ;
    }
    if (n == 1) {
        return 1 ;
    }
    //隔板问题。n个台阶可以最多插入n-1个隔板，隔板数量 在1~n-1 个之间。 分割方法有:
    //C(n-1 ,1) n-1 个分割位，只随机插入一个隔板。
    //C(n-1 ,1) + C(n-1 ,2) + C(n-1 ,3) + C(n-1 ,4).....C(n-1 ,n-1); = 2^(n-1);
    return 1<<(--n);
}

