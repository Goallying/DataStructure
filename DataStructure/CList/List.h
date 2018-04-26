//
//  List.h
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/7.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>


typedef int * nodeValue ;
typedef struct {
    int capacity ; // 开辟空间大小
    int length ; //实际存储
    nodeValue * value ; //节点数据指针
    
}LinearList;


LinearList * listInit(int capacity) {
    
    LinearList * list = malloc(sizeof(LinearList));
    if (list) {
        list->length = 0 ;
        list->capacity = capacity ;
        list->value = malloc(capacity * sizeof(nodeValue)) ;
    }
    return list ;
}


void releaseList(LinearList * list){
    free(list->value);
    free(list);
}

void clearList(LinearList * list) {
    list->length = 0 ;
}

int length (LinearList * list){
    return list->length ;
}

nodeValue valueAtIndex (LinearList * list ,int idx) {
    return *(list->value + idx);
}
void insert (LinearList * list , int idx ,nodeValue value){
    for (int i = list->length - 1; i>=idx; i--) {
        list->value[i + 1] = list ->value[i] ;
    }
    list->value[idx] = value ;
    list->length ++ ;
}
void add(LinearList * list , nodeValue value){
    insert(list, list->length, value);
}
void setValue (LinearList * list ,int idx , nodeValue value){
    list->value[idx] = value ;
}
void removeAtIndex(LinearList * list ,int idx) {
    for (int i = idx + 1; i < list->length; i++) {
        list->value[i - 1] = list->value[i];
    }
    list->length -- ;
}

void removeObj(LinearList * list ,nodeValue value) {
    
    int c = 0 ;
    for (int i = 0; i < list->length; i++) {
        if (list->value [i] == value) {
            c ++ ;
        }else{
            
        }
    }
    list->length -= c ;
}
@interface List : NSObject

@end
