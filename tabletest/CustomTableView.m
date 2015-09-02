//
//  CustomTableView.m
//  tabletest
//
//  Created by Simon on 15/8/18.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "CustomTableView.h"

#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define CELL_HEIGHT 44

@implementation CustomTableView

@synthesize delegate;

-(id)init{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor grayColor];
        table = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, 120)];
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = [UIColor purpleColor];
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:table];

        CALayer *probandIDView2 = [[CALayer alloc]init];
        probandIDView2.frame = CGRectMake(30, 110, SCREEN_WIDTH-60, 2);
        probandIDView2.backgroundColor = [UIColor greenColor].CGColor;
        probandIDView2.borderColor = [UIColor grayColor].CGColor;
        probandIDView2.borderWidth = .5;
        [self.layer addSublayer:probandIDView2];

        CALayer *probandIDView1 = [[CALayer alloc]init];
        probandIDView1.frame = CGRectMake(30, 155, SCREEN_WIDTH-60, 2);
        probandIDView1.backgroundColor = [UIColor greenColor].CGColor;
        probandIDView1.borderColor = [UIColor grayColor].CGColor;
        probandIDView1.borderWidth = .5;
        [self.layer addSublayer:probandIDView1];
    }
    return self;
}

    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%li",(long)indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(checkCellIndex) userInfo:nil repeats:NO];
    bol = indexPath.row>willCell?YES:NO;
    willCell = (int)indexPath.row;
    if (bol) {
        if ([delegate respondsToSelector:@selector(currentIndex:)]) {
            [delegate currentIndex:willCell - 1];
        }
    }else{
        if ([delegate respondsToSelector:@selector(currentIndex:)]) {
            [delegate currentIndex:willCell+1];
        }
    }

}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath{
    
    [timer invalidate];
}

-(void)checkCellIndex{
    
    if (bol) {
        [table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:willCell - 1 inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }else{
        [table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:willCell + 1 inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
}


@end
