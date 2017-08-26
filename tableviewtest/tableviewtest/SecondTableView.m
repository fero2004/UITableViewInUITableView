//
//  SecondTableView.m
//  tableviewtest
//
//  Created by Nelson Chau on 25/8/17.
//  Copyright © 2017年 Nelson Chau. All rights reserved.
//

#import "SecondTableView.h"

@implementation SecondTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if(self = [super initWithFrame:frame style:style])
    {
        self.dataSource = self;
        self.delegate = self;
        self.tableFooterView = [UIView new];
        isCanScroll = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(test:)
                                                     name:@"test"
                                                   object:nil];
        for(int i = 0 ; i < 10; i++)
        {
            cells[i] = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cells[i].frame = CGRectMake(0, 0, self.frame.size.width, 44.0f);
        }
        [self reloadData];
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cells[indexPath.row].frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cells[indexPath.row].textLabel.text = @"2";
    return cells[indexPath.row];
}

- (void)test:(NSNotification *)n
{
    isCanScroll = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(isCanScroll == NO)
    {
        [scrollView setContentOffset:CGPointZero animated:NO];
    }
    else
    {
        if(scrollView.contentOffset.y <= 0)
        {
            isCanScroll = NO;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"test2" object:nil];
        }
    }
}

@end
