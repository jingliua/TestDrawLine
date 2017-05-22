//
//  ViewController.m
//  TestDrawLine
//
//  Created by liujing on 17/5/22.
//  Copyright © 2017年 jean. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    CustomView *cv = [[CustomView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50)];
    cv.backgroundColor = [UIColor blueColor];
    [self.view addSubview:cv];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
