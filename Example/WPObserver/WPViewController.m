//
//  WPViewController.m
//  WPObserver
//
//  Created by 823105162@qq.com on 02/05/2021.
//  Copyright (c) 2021 823105162@qq.com. All rights reserved.
//

#import "WPViewController.h"
#import "WPDetailViewController.h"
#import "WPButtonFactory.h"
@interface WPViewController ()

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton * countBtn = [WPButtonFactory createButton:@"跳转" frame:CGRectMake(100, 200, 100, 40)];
    [self.view addSubview:countBtn];
    [countBtn addTarget:self action:@selector(pushDetailViewController) forControlEvents:UIControlEventTouchUpInside];
}

//我就在这里做个跳转了
- (void)pushDetailViewController{
    WPDetailViewController * detail = [[WPDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
