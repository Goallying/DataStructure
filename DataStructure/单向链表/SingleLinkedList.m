//
//  SingleLinkedList.m
//  DataStructure
//
//  Created by 朱来飞 on 2018/4/21.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "SingleLinkedList.h"

@implementation SingleLinkedList{
    CFMutableDictionaryRef  _dic ;
    
}

- (instancetype)init{
    if (self = [super init]) {
        
        _length = 0 ;
        _dic = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks) ;

    }
    return self ;
}

- (void)set_obj:(id)obj for_key:(NSString *)key {
    
    if (obj == nil || key.length == 0 || !key) {
        return ;
    }
    SingleLinkedNode * node = CFDictionaryGetValue(_dic,  (__bridge const void *)key) ;
    if (node) {
        node.obj = obj;
    }else{
        SingleLinkedNode * nd = [[SingleLinkedNode alloc]initWithObj:obj forKey:key];
        if (_length == 0) {
            _header = nd ;
            _tail = nd ;
        }else {
            _tail.nextNode = nd ;
            _tail = nd ;
        }
        CFDictionarySetValue(_dic,  (__bridge const void *)key, (__bridge const void *)nd) ;
        _length ++ ;
    }

}

-(void)insert_obj_at_head:(id)obj for_key:(NSString *)key{
    
    if (_length == 0) {
        [self set_obj:obj for_key:key];
        return ;
    }
    SingleLinkedNode * node = CFDictionaryGetValue(_dic,  (__bridge const void *)key) ;
    if (node) {
        NSLog(@"obj already exist");
        return ;
    }
    
    SingleLinkedNode * nd = [[SingleLinkedNode alloc]initWithObj:obj forKey:key];
    nd.nextNode = _header ;
    _header = nd ;
    _length ++ ;
    CFDictionarySetValue(_dic,  (__bridge const void *)key, (__bridge const void *)nd) ;
}

- (void)remove_obj_for_key:(NSString *)key{
    
    if (_length == 0 || key.length == 0) {
        return ;
    }
    if ([_header.key isEqualToString:key]) {
        SingleLinkedNode * newHeader = _header.nextNode ;
        _header = newHeader ;
        _length -- ;
        return ;
    }
    if (_header.nextNode == nil) {
        return ;
    }
    
    SingleLinkedNode * pre = _header ;
    BOOL finish = NO ;
    while (finish == NO) {
        
        if ([pre.nextNode.key isEqualToString:key]) {
            
            SingleLinkedNode * target = pre.nextNode ;
            if (target.nextNode == nil) {
                _tail = pre ;
                _tail.nextNode = nil ;
            }else{
                pre.nextNode = target.nextNode ;
            }
            _length -- ;
            finish = YES ;
            
        }else if (pre.nextNode == nil){
            finish = YES ;
        }else{
            pre = pre.nextNode ;
        }
        
    }
    
}

- (void)removeAllObj{
    _length = 0 ;
    _header = nil ;
    _tail = nil ;
}
- (SingleLinkedNode *)value_for_key:(NSString *)key{
    
    if (_length == 0 || key.length == 0) {
        return nil ;
    }
    BOOL finish = NO ;
    SingleLinkedNode * result = nil ;
    SingleLinkedNode * node = _header ;
    
    while (finish == NO) {
        
        if ([node.key isEqualToString:key]) {
            result  = node ;
            finish = YES ;
        }else if (node.nextNode == nil){
            result  = nil ;
            finish = YES ;
        }else{
            node = node.nextNode ;
        }
    }
    return result ;
}

- (void)reverse{
    
    if (_length <= 1) {
        return ;
    }
    
    SingleLinkedNode * pre = nil ;
    SingleLinkedNode * cur = _header ;
    SingleLinkedNode * next = nil ;
    
    SingleLinkedNode * header = _header ;
    
    while (cur) {
        
        next = cur.nextNode ;
        cur.nextNode = pre ;
        pre = cur ;
        cur = next ;
        
        if (!cur) {
            _header = pre ;
            _tail = header ;
            _tail.nextNode = nil;
        }
    }
}
- (void)print_all_nodes_reversily {
    
    if (!_header) {
        return ;
    }
    [self reverse];
    SingleLinkedNode * cur = _header ;
    while (cur) {
        NSLog(@"cur === %@" ,cur.obj);
        cur = cur.nextNode ;
    }
}

- (void)dealloc{
    CFRelease(_dic);
}
@end
