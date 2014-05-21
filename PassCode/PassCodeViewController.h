//
//  PassCodeViewController.h
//  PassCode
//
//  Created by Rajat on 5/16/14.
//  Copyright (c) 2014 Rajat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PassCodeViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *passCode0;
    IBOutlet UITextField *passCode1;
    IBOutlet UITextField *passCode2;
    IBOutlet UITextField *passCode3;
    IBOutlet UILabel *message;
       UITextField *fakeField;
}

@end
