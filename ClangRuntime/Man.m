//
//  Man.m
//  ClangRuntime
//
//  Created by kong on 17/5/22.
//  Copyright © 2017年 konglee. All rights reserved.
//

#import "Man.h"
#import <objc/objc-runtime.h>
#import "Woman.h"

@interface Man()
{
    Woman *_m;
}

@end
@implementation Man


void sayCrash(id self, SEL _cmd)
{
    NSLog(@"已崩溃，崩溃方法为:%@",NSStringFromSelector(_cmd));
}

//1. 如果tellMe方法崩溃，则会首先调用此方法
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    NSLog(@"sel is %@",NSStringFromSelector(sel));
////    if (sel == @selector(tellMe))
////    {
//        class_addMethod([self class], sel, (IMP)sayCrash, "v@:");
//        return YES;
////    }
//    return [super resolveInstanceMethod:sel];
//}

// 2.
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    NSString *selName = NSStringFromSelector(aSelector);
//    if ([selName isEqualToString:@"tellMe"])
//    {
//        class_addMethod([self class], aSelector, method_getImplementation(class_getInstanceMethod([self class], @selector(instanceMethodSayCrash))), "v@:");
//        return [Man new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

- (instancetype)init
{
    if (self = [super init])
    {
        _m = [Woman new];
    }
    return self;
}

- (void)instanceMethodSayCrash
{
    NSLog(@"beng, method is %@",NSStringFromSelector(_cmd));
}


//3. 
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *sign = [super methodSignatureForSelector:aSelector];
    if (_m)
    {
        
        sign = [_m methodSignatureForSelector:aSelector];
    }
    return sign;
}


- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"SEL IS %@",NSStringFromSelector(anInvocation.selector));
    if ([_m respondsToSelector:anInvocation.selector])
    {
        [anInvocation invokeWithTarget:_m];
    }
    else
    {
        [anInvocation doesNotRecognizeSelector:anInvocation.selector];
    }
}


@end
