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
void bubble_sort(vector<int>array){
    
    if (array.empty() || array.size() == 1) {
        return ;
    }
    int c = (int)array.size() ;
    for (int i = 0; i < c - 1 ; i ++) {
        for (int j = 0; j < c - 1 - i; j ++) {
            if (array[j] > array[j + 1]) {
                int tp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = tp ;
            }
        }
    }
    
    for (int i = 0 ; i < array.size(); i ++) {
        printf("---- %d" ,array[i]);
    }
    
}
void bubble_sort_optimize1(vector<int>array)  {
    
    if (array.empty() || array.size() == 1) {
        return ;
    }
    
    int c = (int)array.size() ;
    for (int i = 0; i < c - 1 ; i ++) {
        bool k = false ;
        for (int j = 0; j < c - 1 - i; j ++) {
            if (array[j] > array[j + 1]) {
                int tp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = tp ;
                k = true ;
            }
        }
        if (k == false) {
            break ;
        }
    }
    
    for (int i = 0 ; i < array.size(); i ++) {
        printf("---- %d" ,array[i]);
    }
}
void bubble_sort_optimize2(vector<int>array) {
    if (array.empty() || array.size() == 1) {
        return ;
    }
//    https://blog.csdn.net/bitboss/article/details/51559034
    int c = (int)array.size() ;
    int n = c - 1 ;
    int last = 0 ;
    
    for (int i = 0; i < c ; i ++) {
        bool k = false ;
        for (int j = 0; j < n ; j ++) {
            if (array[j] > array[j + 1]) {
                int tp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = tp ;
                k = true ;
                last = j ;
            }
        }
        if (k == false) {
            break ;
        }
        n = last ;
    }
    
    for (int i = 0 ; i < array.size(); i ++) {
        printf("---- %d" ,array[i]);
    }
}

void QuickSort::quick_sort(int l,int r){

    if ( l >= r ){
        return;
    }
    int mid = array[l], left = l, right = r;
    while (left < right)
    {
        while (left < right && array[right] > mid)
            right--;

        array[left] = array[right];

        while (left < right && array[left] <= mid )
            left++;

        array[right] = array[left];
    }
    for (int i = 0; i < array.size(); i ++) {
        printf("-- %d \n" ,array[i]);
    }
    array[left] = mid;
    quick_sort(l, left - 1 );
    quick_sort(left + 1, r);

    for (int i = 0; i < array.size(); i ++) {
        printf("-- %d \n" ,array[i]);
    }
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
    
//    int c = 2 * fibonacci(n - 1);
//    int c0 = 1<<(--n);
    //隔板问题。n个台阶可以最多插入n-1个隔板，隔板数量 在1~n-1 个之间。 分割方法有:
    //C(n-1 ,1) n-1 个分割位，只随机插入一个隔板。
    //C(n-1 ,1) + C(n-1 ,2) + C(n-1 ,3) + C(n-1 ,4).....C(n-1 ,n-1); = 2^(n-1);
    return 1<<(--n);
}
int binary_count_1(int n){
    int c = 0 ;
//    int flag = 1 ;
//    while (flag != 0) {
//        if (n & flag) {
//            c++ ;
//        }
//        flag = flag<<1 ;
//    }
//    // -1 死循环
//    while (n) {
//        c += (n & 1);
//        n >>= 1;
//        printf("n === %d",n);
//    }
    
    // -1 的1 的个数 == 32 （ 11111111 11111111 11111111 11111111）
    //每次都少了一位 最右边的1 ，直到n=0.
    while (n)
    {
        n = n&(n - 1);
        c ++;
    }
    return c ;
}
double power (double n , int exp) {
    //0^-1 ,0^0 无意义
    if (n > -0.0000001 && n< 0.0000001 && exp <= 0) {
        throw "error occured" ;
    }
    //0的n次方
    if (n > -0.0000001 && n< 0.0000001){
        return 0.0 ;
    }
    //n的0 次方
    if (exp == 0) {
        return 1 ;
    }
    unsigned int abs_exp = exp < 0? -exp:exp ;
    double result = 1.0;
    
    while (abs_exp) {
        result *= n ;
        abs_exp -- ;
    }
    if (exp < 0) {
        return  1/result ;
    }
    return result ;
}
double power_optimize(double n ,int exp){
    //0^-1 ,0^0 无意义
    if (n > -0.0000001 && n< 0.0000001 && exp <= 0) {
        throw "error occured" ;
    }
    //0的n次方
    if (n > -0.0000001 && n< 0.0000001){
        return 0.0 ;
    }
    //n的0 次方
    if (exp == 0) {
        return 1 ;
    }
//    1<<5 ,1 向高位移动5次。 exp >>1 向低位移动
// 2分法减少乘法次数， 比power 的时间复杂度少了很多。
    double result = power_optimize(n, exp >> 1);
    result = result*result;
    if ( (exp & 0x1) == 1)
        result *= n;
    return result;
}

void reorder_array(vector<int> array){
    
    if (array.empty() || array.size() == 1) {
        return ;
    }
    
    //常规做法。
    unsigned long len = array.size() ;
//    vector<int> evens;
//    vector<int> odds ;
//
//    for (unsigned long i = 0; i< len; i++) {
//        if (array[i] % 2 == 0) {
//            evens.push_back(array[i]);
//        }else{
//            odds.push_back(array[i]);
//        }
//    }
//    unsigned long even_len = evens.size() ;
//    unsigned long odd_len = odds.size() ;
//    unsigned long even_idx = 0 ;
//    unsigned long odd_idx = 0 ;
//
//    while (odd_idx < odd_len) {
//        array[odd_idx] = odds[odd_idx];
//        odd_idx ++ ;
//    }
//    while (even_idx < even_len) {
//        array[odd_len + even_idx] = evens[even_idx];
//        even_idx ++ ;
//    }
    
  // 改进做法 ，直接删除偶数插入到数组尾部。
    vector<int>::iterator iter = array.begin();
    unsigned long idx = 0 ;
    int c = 0 ;
    while (idx < len) {
        if (array[c] % 2 == 0) {
            int val =  array[c];
            array.erase(iter);
            array.push_back(val);

        }else{
            iter ++ ;
            c++ ;
        }
        idx ++ ;
    }
    
//    for (int i = 0; i < array.size(); i++) {
//        printf("======%d" ,array[i]);
//    }
}
void print_matrix_clockwisily(vector<vector <int> >array){
//    1,  2,  3,  4
//    5,  6,  7,  8
//    9, 10, 11, 12
//    3, 14, 15, 16
    int rows = (int)array.size();
    int cols = (int)array[0].size() ;
    
    bool reverse = false ;
    bool origin = true ;
    int  verctor_r = 0 ;
    while (verctor_r < rows) {
        
        origin = rows % 2 == 0 ;
        int col ;
        int row ;
        col = reverse?cols:0 ;
        row = reverse?rows:0 ;
        
        if (reverse == false) {
            while (col < cols) {
                unsigned long val = array[row][col];
                col ++ ;
                printf("--- %ld" ,val);
            }
            while (row < rows - 1) {
                row ++ ;
                unsigned long val = array[row][col - 1];
                printf("--- %ld" ,val);
            }
        }else{
            while (col - 1 > 0) {
                col -- ;
                unsigned long val = array[row][col];
                printf("--- %ld" ,val);
            }
            while (row > 0) {
                unsigned long val = array[row][col - 1];
                row -- ;
                printf("--- %ld" ,val);
            }
        }
       
        reverse = !reverse ;
        verctor_r ++ ;
        
        cols -- ;
        rows -- ;
    }
}

#pragma mark --
#pragma mark -- 题目
int index_of_str_start(string * str , string * substr){
}

void sort_ascend_array(int A[] ,int m ,int n){
//    int A[] = {1,3,5,7,9,2,4,6,8};
    int k = 0;
    for (int i = m; i<m+n; ++i) {
        int temp = A[i];
        for (int j = i-1; j>= k; --j) {
            if (A[j] > temp) {
                A[j+1] = A[j];
            }else{
                k = j+1 ;
                A[j+1] = temp ;
            }
        }
    }
//    for (int k = 0; k<m+n; k++) {
//        printf("---%d",A[k]);
//    }
}
