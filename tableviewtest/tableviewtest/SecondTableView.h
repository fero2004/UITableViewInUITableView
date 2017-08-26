//
//  SecondTableView.h
//  tableviewtest
//
//  Created by Nelson Chau on 25/8/17.
//  Copyright © 2017年 Nelson Chau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
{
    UITableViewCell *cells[10];
    BOOL isCanScroll;
}

@end
