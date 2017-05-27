//
//  Woman.m
//  ClangRuntime
//
//  Created by kong on 17/5/24.
//  Copyright © 2017年 konglee. All rights reserved.
//

#import "Woman.h"

@implementation Woman

- (void)fowardMessage
{
    NSLog(@"已转发，未崩溃");
}
- (void)tellMe
{
    [self fowardMessage];
}


@end
