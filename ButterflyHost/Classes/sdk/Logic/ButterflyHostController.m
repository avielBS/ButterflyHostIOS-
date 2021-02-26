//
//  ButterflyHostController.m
//  butterfly
//
//  Created by Aviel on 11/17/20.
//  Copyright © 2020 Aviel. All rights reserved.
//

#import "ButterflyHostController.h"
#import "Report.h"
#import "InputFromUser.h"
#import <Reachability/Reachability.h>
#import "ToastMessage.h"

@implementation ButterflyHostController

__strong static ButterflyHostController* _shared;
+(ButterflyHostController*) shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shared = [[ButterflyHostController alloc] initWithCoder:nil];
    });

    return _shared;
}

-(instancetype) init {
    return [ButterflyHostController shared];
}

-(instancetype) initWithCoder:(NSCoder*) coder {
   if(self = [super init]) { }
    
    return self;
}

-(void) grabReportInViewController:(UIViewController*) viewController usingKey:(NSString*) key {
    InputFromUser *getUserInfo = [[InputFromUser alloc] init];

    [getUserInfo getUserInput: viewController onDone:^(NSString * contactInformation, NSString* fakePlace, NSString* comments) {
        
        Report *report = [[Report alloc ] init];
        report.contactInformation = contactInformation;
        report.fakePlace = fakePlace;
        report.comments = comments;
        
        BOOL isInternetConnectionAvailable =[self isNetwokAvailable];
        
        if(isInternetConnectionAvailable) {
            [self post:@"https://us-central1-butterfly-host.cloudfunctions.net/sendReport" relevantReport: report usingKey: key];
        } else {
            NSString* bundlePath = [[NSBundle bundleForClass:[InputFromUser class]]
                              pathForResource:@"Butterfly" ofType:@"bundle"];
            NSBundle* bundle = [NSBundle bundleWithPath: bundlePath];
            NSString* msg = [bundle localizedStringForKey:@"butterfly_no_internet" value:@"" table:nil];
            
            [ToastMessage show: msg delayInSeconds:3 onDone:nil];
        }
        
    }];
}

-(BOOL) isNetwokAvailable {
    Reachability *_reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus remoteHostStatus = [_reachability currentReachabilityStatus];
    if (remoteHostStatus == NotReachable) {
        return NO;
    } else {
        return YES;
    }
}

-(void)post:(NSString*) url relevantReport:(Report*) report usingKey:(NSString *) key {
    NSDictionary *jsonBodyDict = @{@"fakePlace":report.fakePlace,@"wayContact": report.contactInformation, @"comments": report.comments};
    NSData *jsonBodyData = [NSJSONSerialization dataWithJSONObject:jsonBodyDict options:kNilOptions error:nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    request.HTTPMethod = @"POST";
    
    [request setURL:[NSURL URLWithString:url]];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:jsonBodyData];
    //adding the api key to header
    [request addValue: key forHTTPHeaderField:@"BUTTERFLY_HOST_API_KEY"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                          delegate:nil
                                                     delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data,
                                                                NSURLResponse * _Nullable response,
                                                                NSError * _Nullable error) {
        NSInteger statusCode = 500;
        if ([response isKindOfClass: [NSHTTPURLResponse class]]) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
            statusCode = httpResponse.statusCode;
        }

//        if (data) {
//            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData: data
//                                                                          options: kNilOptions
//                                                                            error:nil];
//            NSLog(@"One of these might exist - object: %@ \n", jsonDictionary);
//        }
        
        
        NSString* bundlePath = [[NSBundle bundleForClass:[InputFromUser class]] pathForResource:@"Butterfly" ofType:@"bundle"];
        NSBundle* bundle = [NSBundle bundleWithPath: bundlePath];
        
        [bundle localizedStringForKey:@"butterfly_no_internet" value:@"" table:nil];

        switch (statusCode) {
            case 200:
                [ToastMessage show:[bundle localizedStringForKey:@"butterfly_success" value:@"" table:nil] delayInSeconds:3 onDone:nil];
                break;
            case 403:
                [ToastMessage show:[bundle localizedStringForKey:@"butterfly_host_API_KEY_not_valid" value:@"" table:nil] delayInSeconds:3 onDone:nil];
                break;
            default:
                [ToastMessage show:
                 [bundle localizedStringForKey:@"butterfly_failed" value:@"" table:nil]
                    delayInSeconds:3 onDone:nil];
                break;
        }
    }];
    
    [task resume];
}

@end
