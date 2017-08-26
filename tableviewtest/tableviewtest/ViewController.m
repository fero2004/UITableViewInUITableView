//
//  ViewController.m
//  tableviewtest
//
//  Created by Nelson Chau on 25/8/17.
//  Copyright © 2017年 Nelson Chau. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL isCanScrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    aTableView = [[FirstTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    aTableView.delegate = self;
    aTableView.dataSource = self;
    aTableView.tableFooterView = [UIView new];
    [self.view addSubview:aTableView];
    isCanScrollView = YES;
    for(int i = 0 ; i < 10; i++)
    {
        cells[i] = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cells[i].frame = CGRectMake(0, 0, self.view.frame.size.width, 44.0f);
    }
    bTableView = [[SecondTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    cells[9].frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [cells[9] addSubview:bTableView];
    [aTableView reloadData];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(test2:)
                                                 name:@"test2"
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test2:(NSNotification *)n
{
    isCanScrollView = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(isCanScrollView)
    {
        //大于这个临界值就保持不变
        if(scrollView.contentOffset.y > 300)
        {
            [scrollView setContentOffset:CGPointMake(0, 300) animated:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:nil];
            isCanScrollView = NO;
        }
    }
    else
    {
        [scrollView setContentOffset:CGPointMake(0, 300) animated:NO];
    }
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
    cells[indexPath.row].textLabel.text = @"1";
    return cells[indexPath.row];
}

@end
