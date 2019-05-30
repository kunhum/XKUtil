//
//  XKViewController.m
//  XKUtil
//
//  Created by kunhum on 05/30/2019.
//  Copyright (c) 2019 kunhum. All rights reserved.
//

#import "XKViewController.h"
#import "XKCountingViewController.h"

@interface XKViewController ()

@end

@implementation XKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[XKCountingViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
