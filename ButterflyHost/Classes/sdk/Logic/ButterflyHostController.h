//
//  ButterflyHostController.h
//  butterfly
//
//  Created by Aviel on 11/17/20.
//  Copyright © 2020 Aviel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Report.h"
#import "InputFromUser.h"
#import <Reachability/Reachability.h>
#import "ToastMessage.h"

@interface ButterflyHostController : NSObject

-(void) grabReportInViewController:(UIViewController*) viewController andKey:(NSString*)key;


@property(nonatomic,strong) NSString* apiKey;

+(ButterflyHostController*) shared;

@end


