//
//  XKCountingViewController.m
//  XKUtil_Example
//
//  Created by Nicholas on 2019/5/30.
//  Copyright © 2019 kunhum. All rights reserved.
//

#import "XKCountingViewController.h"
#import <XKUtil/XKUtil.h>

@interface XKCountingViewController ()

@property (nonatomic, strong) dispatch_source_t sourceT;

@end

@implementation XKCountingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.sourceT = [XKUtil xk_setTimerWithQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) seconds:10 interval:1 leeway:0 countingHandler:^(CGFloat leftSeconds) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"倒数中");
        });
        
    } cancelHandler:^{
        NSLog(@"取消了");
    }];
    
}

- (void)dealloc {
    NSLog(@"counting controller dealloc");
    if (self.sourceT) {
        dispatch_cancel(self.sourceT);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
