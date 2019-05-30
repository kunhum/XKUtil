//
//  XKUtil.h
//  MBB
//
//  Created by Nicholas on 2018/12/22.
//  Copyright © 2018 Nicholas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XKUtil : NSObject

///打电话
+ (void)xk_Phone:(NSString *)phoneNumber;

///倒计时计算时分秒
+ (void)xk_calculateTime:(NSTimeInterval)timeInterval completed:(void(^)(NSInteger hour, NSInteger minute, NSInteger second))completed;

///计时器
+ (dispatch_source_t)xk_setTimerWithQueue:(dispatch_queue_t)queue seconds:(double)seconds interval:(NSTimeInterval)interval leeway:(NSTimeInterval)leeway countingHandler:(void (^ _Nullable)(CGFloat leftSeconds))countingHandler cancelHandler:(void (^ _Nullable)(void))cancelHandler;

@end

NS_ASSUME_NONNULL_END
