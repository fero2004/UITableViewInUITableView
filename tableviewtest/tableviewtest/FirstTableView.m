//
//  FirstTableView.m
//  tableviewtest
//
//  Created by Nelson Chau on 25/8/17.
//  Copyright © 2017年 Nelson Chau. All rights reserved.
//

#import "FirstTableView.h"

@implementation FirstTableView

/// 是否支持多手势触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
