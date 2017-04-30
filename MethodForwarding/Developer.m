//
//  Developer.m
//  MethodForwarding
//
//  Created by littlewish on 2017/4/21.
//  Copyright © 2017年 littlewish. All rights reserved.
//

#import "Developer.h"

@implementation Developer
- (instancetype)init:(NSString *)name{
    self =  [super init:name];
    if (self) {
        
    }
    
    return self;
}

- (void)developerCoding{
    NSLog(@"class:%@, sel:%s",self,sel_getName(_cmd));
    NSLog(@"i hate pm");
}

- (void)developerDebug{
    NSLog(@"class:%@, sel:%s",self,sel_getName(_cmd));
    NSLog(@"i hate bug");
}
@end
