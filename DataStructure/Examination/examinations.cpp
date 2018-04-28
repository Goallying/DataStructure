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
