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

#pragma mark -- 字符串替换
- (void)test_replace_str{
    char s[1024] = "we are happy! and you are a perv";
    replace_string(s, 13);
}
#pragma mark -- 二维数组查找
- (void)test_find_num_in_array{
    
    vector< vector<int> > array  = {{1,2,3,9,15},
        {3,4,5,17,28},
        {4,6,7,18,30},
        {19,27,33,45,56}};
    bool res = find_num_in_array(1, array);
    XCTAssertTrue(res);
}
#pragma mark -- 打印单双链表
- (void)test_print_chain {
    //
    //单向链表
//    SingleLinkedList * singleList = [SingleLinkedList new];
//    [singleList set_obj:@"1" for_key:@"1"];
//    [singleList set_obj:@"2" for_key:@"2"];
//    [singleList set_obj:@"3" for_key:@"3"];
//    [singleList set_obj:@"4" for_key:@"4"];
//    [singleList set_obj:@"5" for_key:@"5"];
//    [singleList print_all_nodes];
    //双向链表
    LinkedMap * map = [LinkedMap new];
    [map set_obj:@"1" for_key:@"1"];
    [map set_obj:@"2" for_key:@"2"];
    [map set_obj:@"3" for_key:@"3"];
    [map set_obj:@"4" for_key:@"4"];
    [map set_obj:@"5" for_key:@"5"];
    [map print_all_nodes];
}

- (void)tearDown {
    [super tearDown];
}
+ (void)tearDown {
    [super tearDown];
}



@end
