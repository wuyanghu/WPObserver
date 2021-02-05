//
//  WPViewController.m
//  WPObserver
//
//  Created by 823105162@qq.com on 02/05/2021.
//  Copyright (c) 2021 823105162@qq.com. All rights reserved.
//

#import "WPViewController.h"
#import "NSObject+WPObserver.h"
#import "WPView.h"
#import "WPProtocol.h"
#import "WPViewObserver.h"

@interface WPViewController ()<WPViewObserver>
@property (nonatomic,strong) WPView * customView;
@property (nonatomic,strong) WPViewObserver * observer1;
@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _customView = [[WPView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_customView];
    
    _observer1 = [WPViewObserver new];
    
    [_customView wp_addObserver:_observer1];
    [_customView wp_addObserver:self];
}

- (void)update{
    NSLog(@"update");
}

- (void)update:(NSInteger)count{
    NSLog(@"update %ld",count);
}

- (void)update:(NSInteger)count count2:(NSInteger)count2{
    NSLog(@"update %ld,%ld",count,count2);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
