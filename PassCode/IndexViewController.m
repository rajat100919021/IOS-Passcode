//
//  IndexViewController.m
//  PassCode
//
//  Created by Rajat on 5/20/14.
//  Copyright (c) 2014 Rajat. All rights reserved.
//

#import "IndexViewController.h"
#import "LoginViewController.h"
#import "PassCodeViewController.h"
@interface IndexViewController ()
{
    NSUserDefaults *userDefaults;
}
@end

@implementation IndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   self.title=@"Index";
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
-(IBAction)loginPage:(id)sender
{
    userDefaults=[NSUserDefaults standardUserDefaults];
    if([[userDefaults objectForKey:@"DoneKey"]isEqualToString:@"Done"])
    {
        PassCodeViewController *passcodeObj=[[PassCodeViewController alloc]initWithNibName:@"PassCodeViewController" bundle:nil];
            [self.navigationController pushViewController:passcodeObj animated:YES];
    }
    else
    {
        
   
    LoginViewController *loginObj=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:loginObj animated:YES];
    }
}
@end
