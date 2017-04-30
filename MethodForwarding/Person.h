//
//  Person.h
//  MethodForwarding
//
//  Created by littlewish on 2017/4/21.
//  Copyright © 2017年 littlewish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,copy) NSString *name;
- (instancetype)init:(NSString *)name;
- (void)eat;
- (void)sleep;
@end
