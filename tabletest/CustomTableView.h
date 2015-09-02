//
//  CustomTableView.h
//  ;
//
//  Created by Simon on 15/8/18.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTableDelegate <NSObject>

-(void)currentIndex:(int)index;

@end

@interface CustomTableView : UIView<UITableViewDataSource,UITableViewDelegate>{

    UITableView *table;
    int willCell;
    int disPlayCell;
    NSTimer *timer ;
    NSIndexPath *index;
    bool bol;
}

@property (nonatomic,assign) id<CustomTableDelegate> delegate;

@end
