#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSObject+WPObserver.h"
#import "WPObserver.h"
#import "WPObserverModel.h"
#import "WPProxy.h"

FOUNDATION_EXPORT double WPObserverVersionNumber;
FOUNDATION_EXPORT const unsigned char WPObserverVersionString[];

