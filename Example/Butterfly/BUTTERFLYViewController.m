//
//  BUTTERFLYViewController.m
//  Butterfly
//
//  Created by avielBS on 12/29/2020.
//  Copyright (c) 2020 avielBS. All rights reserved.
//

#import "BUTTERFLYViewController.h"
#import <Butterfly/ButterflyHostController.h>

@interface BUTTERFLYViewController ()

@end

@implementation BUTTERFLYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Button:(id)sender {
    ButterflyHostController* butterflyHostContoller = [ButterflyHostController getInstance];
    
    [butterflyHostContoller OnGrabReportRequeste:self andKey:@"key2"];
}
@end
