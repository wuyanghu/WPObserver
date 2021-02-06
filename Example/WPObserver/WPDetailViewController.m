//
//  WPDetailViewController.m
//  WPObserver_Example
//
//  Created by wupeng on 2021/2/6.
//  Copyright © 2021 823105162@qq.com. All rights reserved.
//

#import "WPDetailViewController.h"
#import "WPView.h"
#import "NSObject+WPObserver.h"
#import "WPViewObserver.h"

@interface WPDetailViewController()<WPViewObserver>
@property (nonatomic,strong) WPView * customView;

@property (nonatomic,strong) WPViewObserver * observer1;
@property (nonatomic,strong) WPViewObserver * observer2;

@end

@implementation WPDetailViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _customView = [[WPView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_customView];
    
    [_customView wp_addObserver:self];
    
    _observer1 = [WPViewObserver new];
    _observer1.title = @"observer1 ";
    [_customView wp_addObserver:_observer1];
    
    _observer2 = [WPViewObserver new];
    _observer2.title = @"observer2 ";
    [_customView wp_addObserver:_observer2 delegateQueue:dispatch_queue_create("observer2", DISPATCH_QUEUE_SERIAL)];//指定队列
}

- (void)update:(NSInteger)count{
    NSLog(@"detail update %ld",count);
}

- (void)update:(NSInteger)count count2:(NSInteger)count2{
    NSLog(@"detail update %ld,%ld",count,count2);
}

- (void)dealloc{
    NSLog(@"WPDetailViewController dealloc");
}

@end
