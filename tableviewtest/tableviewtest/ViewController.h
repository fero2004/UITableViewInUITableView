//
//  ViewController.h
//  tableviewtest
//
//  Created by Nelson Chau on 25/8/17.
//  Copyright © 2017年 Nelson Chau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstTableView.h"
#import "SecondTableView.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    FirstTableView *aTableView;
    SecondTableView *bTableView;
    UITableViewCell *cells[10];
}

@end

