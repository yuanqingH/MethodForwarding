//
//  Person.m
//  MethodForwarding
//
//  Created by littlewish on 2017/4/21.
//  Copyright © 2017年 littlewish. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import "Developer.h"

@implementation Person
- (instancetype)init:(NSString *)name{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

- (void)eat{
    NSLog(@"i love fish");
}

- (void)sleep{
    NSLog(@"good night");
}

//消息转发第一步 动态方法解析
+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    NSString *selName = NSStringFromSelector(sel);
//    if ([selName hasPrefix:@"developer"]) {
//        class_addMethod(self, sel, (IMP)shouldDoSomeThing, "v@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

//处理类方法
+ (BOOL)resolveClassMethod:(SEL)sel{
    return [super resolveClassMethod:sel];
}


//动态将实现转到这个函数
void shouldDoSomeThing(id self ,SEL _cmd){
    NSLog(@"class:%@, sel:%s",self,sel_getName(_cmd));
    NSLog(@"maybe i should do something like a developer");
}


//消息转发第二步 备选接收者
- (id)forwardingTargetForSelector:(SEL)aSelector{
//    Developer *dev = [[Developer alloc] init:@"Huang"];
//    if ([dev respondsToSelector:aSelector]) {
//        return dev;
//    }
    
    return [super forwardingTargetForSelector:aSelector];
}

//消息转发第三部 完整的消息转发
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    if ([Developer instancesRespondToSelector:anInvocation.selector]) {
        Developer *dev = [[Developer alloc] init:@"Huang"];
        [anInvocation invokeWithTarget:dev];
    }
}

//person找不到developer相关的方法，就是因为这个函数找不到方法的实现签名引发了崩溃，我们这里需要给aSelector新建方法签名 再交给Developer对象去处理
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        //不签名会崩溃
        //判断实现类的实例是否有这个方法 有则签名这个方法 保证能正确转发
        if ([Developer instancesRespondToSelector:aSelector]) {
            signature = [Developer instanceMethodSignatureForSelector:aSelector];
        }
        //直接签名
//        if ([NSStringFromSelector(aSelector) hasPrefix:@"developer"]) {
//            signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
//        }
    }
    
    return signature;
}

@end
