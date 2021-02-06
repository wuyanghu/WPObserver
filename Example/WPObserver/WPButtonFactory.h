//
//  WPButtonFactory.h
//  WPObserver_Example
//
//  Created by wupeng on 2021/2/6.
//  Copyright © 2021 823105162@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WPButtonFactory : NSObject
+ (UIButton *)createButton:(NSString *)title frame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
