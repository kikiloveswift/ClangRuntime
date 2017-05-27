//
//  ViewController.m
//  ClangRuntime
//
//  Created by kong on 17/5/15.
//  Copyright © 2017年 konglee. All rights reserved.
//

#import "ViewController.h"
#import <objc/objc-runtime.h>
#import "Man.h"
#define OBJC_OLD_DISPATCH_PROTOTYPES 1

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initPerson];
}

- (void)initPerson
{
    Man *man = [Man new];
    objc_msgSend(man, @selector(tellMe));
    
}



@end
