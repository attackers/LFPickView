//
//  ViewController.m
//  tabletest
//
//  Created by Simon on 15/8/10.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableView.h"

#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define CELL_HEIGHT 44

@interface ViewController ()<CustomTableDelegate>{

    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomTableView *tableView = [[CustomTableView alloc]init];
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)currentIndex:(int)index{
    
    NSLog(@"当前选中：%i",index);
}
@end