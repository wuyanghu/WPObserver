//
//  WPProtocol.h
//  WPObserver
//
//  Created by wupeng on 2021/2/5.
//  Copyright © 2021 823105162@qq.com. All rights reserved.
//

#ifndef WPProtocol_h
#define WPProtocol_h

@protocol WPViewObserver <NSObject>
- (void)update;
- (void)update:(NSInteger)count;
- (void)update:(NSInteger)count count2:(NSInteger)count;
@end

#endif /* WPProtocol_h */
