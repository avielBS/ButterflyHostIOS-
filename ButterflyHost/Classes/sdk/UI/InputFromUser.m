//
//  InputFromUser.m
//  butterfly
//
//  Created by Aviel on 10/9/20.
//  Copyright © 2020 Aviel. All rights reserved.
//

#import "InputFromUser.h"


@implementation InputFromUser


- (void) getUserInput : (UIViewController*)viewController onDone:(void(^)(NSString* , NSString* , NSString*))completion
{

//    NSString* message = @"Feel free to send here whatever crosses your mind.The information that is sent remains secret without leaving a trail.We take serious consideration and won't take any reckless desicions.Good luck!";

    NSString* path = [[NSBundle bundleForClass:[InputFromUser class]]
                      pathForResource:@"Butterfly" ofType:@"bundle"];
    
    NSBundle* bundle = [NSBundle bundleWithPath:path];
    
    NSString* message =
    [bundle localizedStringForKey:@"butterfly_host_report_meesage" value:@"" table:nil];
    

    _alertController = [UIAlertController alertControllerWithTitle: [bundle localizedStringForKey:@"butterfly_host_contact" value:@"" table:nil]
                                                                              message: message
                                                               preferredStyle:UIAlertControllerStyleAlert
                                           ];

    [_alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder =
                [bundle localizedStringForKey:@"butterfly_host_way_to_contact" value:@"" table:nil];
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    [_alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder =
                [bundle localizedStringForKey:@"butterfly_host_fake_place" value:@"" table:nil];
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    [_alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder =
                [bundle localizedStringForKey:@"butterfly_host_comments" value:@"" table:nil];
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    //when OK buuton pressed
    
    [_alertController addAction:[UIAlertAction actionWithTitle:[bundle localizedStringForKey:@"butterfly_host_send" value:@"" table:nil] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSArray * textfields = self->_alertController.textFields;
        UITextField * wayContactField = textfields[0];
        UITextField * fakePlaceField = textfields[1];
        UITextField * commentsField = textfields[2];
        
         completion(wayContactField.text,fakePlaceField.text,commentsField.text);

    }]];
    [_alertController addAction:[UIAlertAction actionWithTitle:[bundle localizedStringForKey:@"butterfly_host_cancel" value:@"" table:nil] style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self->_alertController dismissViewControllerAnimated:true completion:nil];
    }]];
    
    
    _alertController.actions[0].enabled = false;
    
    [_alertController.textFields[0] addTarget:self
                                      action:@selector(wayToContactFieldChanged) forControlEvents:UIControlEventEditingChanged];
    
    [viewController presentViewController:_alertController animated:YES completion:^{
        self->_alertController.view.superview.userInteractionEnabled = YES;
        [self->_alertController.view.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(whenTappedOutside)]];
    }];


}

-(void) wayToContactFieldChanged
{
    if ([_alertController.textFields[0] hasText]) {
        _alertController.actions[0].enabled = YES;
    }
    else
        _alertController.actions[0].enabled = NO;

}

-(void) whenTappedOutside
{
    NSLog(@"whenTappedOutside");
    [_alertController dismissViewControllerAnimated:true completion:nil];}


@end
