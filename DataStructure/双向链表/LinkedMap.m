





//
//  LinkedMap.m
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/22.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "LinkedMap.h"

@implementation LinkedMap

- (instancetype)init{
    if (self = [super init]) {
        _lenth = 0 ;
    }
    return self ;
}
- (void)set_obj:(id)obj for_key:(NSString *)key{
    
    if (!obj || key.length == 0 || !key) {
        return ;
    }
    MapNode * nd = [self node_for_key:key] ;
    if (nd) {
        nd.value = obj ;
        return ;
    }
    MapNode * node = [[MapNode alloc]initWithKey:key value:obj];
    node.value = obj ;
    if (_lenth == 0) {
        _header = node ;
        _tail = node ;
    }else {
        _tail.nextNode = node ;
        node.preNode = _tail ;
        _tail = node ;
    }
    _lenth ++ ;
    
}

- (void)insert_obj_at_head:(id)value for_key:(NSString *)key {
    
    if (!value || !key || key.length == 0) {
        return ;
    }
    if ([key isEqualToString:_header.key]) {
        _header.value = value ;
        return ;
    }
    MapNode * nd = [self node_for_key:key];
    if (nd) {
        MapNode * pre = nd.preNode ;
        MapNode * next = nd.nextNode ;
        
        pre.nextNode = next ;
        next.preNode = pre ;
        
        nd.preNode = nil ;
        nd.nextNode = _header ;
        nd.value = value ;
        _header = nd ;
        
    }else{
        MapNode * node = [[MapNode alloc]initWithKey:key value:value];
        node.value = value ;
        if (_lenth == 0) {
            _header = node ;
            _tail = node ;
        }else {
            node.preNode = nil ;
            node.nextNode = _header ;
            _header = node ;
        }
        _lenth ++ ;
    }
}
- (void)remove_obj_for_key:(NSString *)key {
    
    if (!key || key.length == 0) {
        return ;
    }
    //不存在
    MapNode * node = [self node_for_key:key] ;
    if (!node) {
        return ;
    }
    // 移除头部&总长度为1.
    if ([_header.key isEqualToString:key]) {
        MapNode * next = _header.nextNode ;
        next.preNode = nil ;
        _header = next ;
        if (_lenth == 1) {
            _header = nil ;
            _tail = nil ;
        }
        _lenth -- ;
        return ;
    }
    
    MapNode * pre = node.preNode ;
    MapNode * next = node.nextNode ;
    
    if (!next) {
        _tail = pre ;
        _tail.nextNode = nil ;
    }else {
        pre.nextNode = next ;
        next.preNode = pre ;
    }
    _lenth -- ;
}

- (id)value_for_key:(NSString *)key {
    MapNode * nd = [self node_for_key:key];
    return nd.value ;
}
- (MapNode *)node_for_key:(NSString *)key {
    
    if (key.length == 0 ||!key||_lenth == 0) {
        return nil ;
    }
    
    MapNode * cur = _header ;
    MapNode * result = nil ;
    BOOL finish = NO ;
    while (finish == NO) {
        
        if ([cur.key isEqualToString:key]) {
            result = cur ;
            finish = YES ;
        }else if (cur.nextNode == nil){
            result = nil ;
            finish = YES ;
        }else{
            cur = cur.nextNode ;
        }
    }
    return result ;
    
}

@end
