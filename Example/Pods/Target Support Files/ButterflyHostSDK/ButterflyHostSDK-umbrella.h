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

#import "ButterflyHost.h"
#import "ButterflyHostController.h"
#import "Report.h"
#import "InputFromUser.h"
#import "ToastMessage.h"

FOUNDATION_EXPORT double ButterflyHostSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char ButterflyHostSDKVersionString[];

