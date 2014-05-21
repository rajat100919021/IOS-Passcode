//
//  MainViewController.m
//  PassCode
//
//  Created by Rajat on 5/20/14.
//  Copyright (c) 2014 Rajat. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "IndexViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)logout:(id)sender
{
    IndexViewController *loginObj=[[IndexViewController alloc]initWithNibName:@"IndexViewController" bundle:nil];
    [self.navigationController pushViewController:loginObj animated:YES];
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

@end
