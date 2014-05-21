//
//  LoginViewController.m
//  PassCode
//
//  Created by Rajat on 5/20/14.
//  Copyright (c) 2014 Rajat. All rights reserved.
//

#import "LoginViewController.h"
#import "PassCodeViewController.h"
@interface LoginViewController ()
{
    
}
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       self.title=@"Login Page";
    }
    return self;
}

- (void)viewDidLoad
{
    [self.navigationItem setHidesBackButton:YES];
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)loginButton_click:(id)sender
{
    NSLog(@"%@",password.text);
    if([userName.text isEqualToString:@""]||[password.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please Enter Username and Password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        PassCodeViewController *passCode=[[PassCodeViewController alloc]initWithNibName:@"PassCodeViewController" bundle:nil];
        [self.navigationController pushViewController:passCode animated:YES];
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
