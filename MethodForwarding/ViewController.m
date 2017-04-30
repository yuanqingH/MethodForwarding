//
//  ViewController.m
//  MethodForwarding
//
//  Created by littlewish on 2017/4/21.
//  Copyright © 2017年 littlewish. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init:@"yuan"];
    [person eat];
    [person sleep];
    [person performSelector:@selector(developerCoding)];
    [person performSelector:@selector(developerDebug)];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
