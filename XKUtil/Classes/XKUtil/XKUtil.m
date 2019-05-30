//
//  XKUtil.m
//  MBB
//
//  Created by Nicholas on 2018/12/22.
//  Copyright © 2018 Nicholas. All rights reserved.
//

#import "XKUtil.h"

@implementation XKUtil

#pragma mark 打电话
+ (void)xk_Phone:(NSString *)phoneNumber {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *phone = [NSString stringWithFormat:@"telprompt://%@",phoneNumber];
        NSURL *phoneURL = [NSURL URLWithString:phone];
        [[UIApplication sharedApplication] openURL:phoneURL];
    });
}

#pragma mark 倒计时计算时分秒
+ (void)xk_calculateTime:(NSTimeInterval)timeInterval completed:(nonnull void (^)(NSInteger, NSInteger, NSInteger))completed {
    
    if (timeInterval > 0) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
        NSDate *currentDate = [NSDate date];
        NSDateComponents *components = [calendar components:(NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond) fromDate:currentDate toDate:date options:0];
        !completed ?: completed(components.hour, components.minute, components.second);
    }
    
    
}

#pragma mark 计时器
+ (dispatch_source_t)xk_setTimerWithQueue:(dispatch_queue_t)queue seconds:(double)seconds interval:(NSTimeInterval)interval leeway:(NSTimeInterval)leeway countingHandler:(void (^ _Nullable)(CGFloat))countingHandler cancelHandler:(void (^ _Nullable)(void))cancelHandler {
    
    __block double countingSeconds = seconds;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, leeway * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (--countingSeconds > 0) {
            !countingHandler ?: countingHandler(countingSeconds);
        }
        else {
            dispatch_cancel(timer);
        }
    });
    dispatch_source_set_cancel_handler(timer, ^{
        !cancelHandler ?: cancelHandler();
    });
    dispatch_resume(timer);
    return timer;
}

@end
