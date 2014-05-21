//
//  LoginViewController.h
//  PassCode
//
//  Created by Rajat on 5/20/14.
//  Copyright (c) 2014 Rajat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *userName;
    IBOutlet UITextField *password;
    IBOutlet UIButton *loginButton;
    
}
-(IBAction)loginButton_click:(id)sender;
@end
