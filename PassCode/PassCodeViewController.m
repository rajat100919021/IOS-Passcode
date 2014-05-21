//
//  PassCodeViewController.m
//  PassCode
//
//  Created by Rajat on 5/16/14.
//  Copyright (c) 2014 Rajat. All rights reserved.
//

#import "PassCodeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MainViewController.h"
#import "LoginViewController.h"
@interface PassCodeViewController ()
{
    NSMutableString* someString;
    NSMutableString *finalString;
    int digit3;
    NSUserDefaults *userDefaults;
    UIButton *resetButton;
}
@end

@implementation PassCodeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Passcode";
    }
    return self;
}

- (void)viewDidLoad
{
    userDefaults=[NSUserDefaults standardUserDefaults];
  
    [super viewDidLoad];
    resetButton=[[UIButton alloc]init];
    [resetButton setFrame:CGRectMake(10,230,300,25)];
    [resetButton setBackgroundColor:[UIColor colorWithRed:0/255.0 green:120/255.0 blue:135/255.0 alpha:1.0]];
    [resetButton setTintColor:[UIColor colorWithRed:255.0/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]];
    [resetButton setTitle:@"Reset passcode" forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetButton];

    fakeField = [[UITextField alloc] initWithFrame:CGRectZero];
    fakeField.delegate = self;
    fakeField.keyboardType = UIKeyboardTypeNumberPad;
    fakeField.secureTextEntry = YES;
    fakeField.text = @"";
    [fakeField becomeFirstResponder];
    [self.view addSubview:fakeField];
    passCode0.tag=1;
    passCode1.tag=2;
    passCode2.tag=3;
    passCode3.tag=4;
    [message setText:@"Please Set the PassCode"];
    NSLog(@"%@",[userDefaults objectForKey:@"DoneKey"]);
    if([[userDefaults objectForKey:@"DoneKey"]isEqualToString:@"Done"])
    {
          [self.navigationItem setHidesBackButton:NO];
             [message setText:@"Please enter the Passcode"];
        [resetButton setHidden:NO];
    }
    else
    {
          [self.navigationItem setHidesBackButton:YES];
           [resetButton setHidden:YES];
    }
    
    

    // Do any additional setup after loading the view from its nib.
}
-(void)reset
{
    userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"DoneKey"];
       [userDefaults removeObjectForKey:@"Passcode"];
    [userDefaults synchronize];
    LoginViewController *loginObj=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:loginObj animated:YES];
}


#define MAXLENGTH 1
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

   
 if(![string isEqualToString:@""])
{
    if(someString==nil)
  {
       someString = [NSMutableString stringWithString:string];
  }
    else
    {
        if([someString length]<=3)
        {
            [someString appendString:string];
}
        }
   


    switch ([someString length]) {
            
        case 0:
        {
                     passCode0.text = nil;
                    passCode1.text = nil;
                        passCode2.text = nil;
                       passCode3.text = nil;
        
                        break;
        }
                    case 1:
        {
           
                     passCode0.text = @"*";
                     passCode1.text = nil;
                    passCode2.text = nil;
                    passCode3.text = nil;
            if (textField.tag==1)
            {
                [textField resignFirstResponder];
                [passCode0 becomeFirstResponder];
            }
          
       
            return NO;
      
           
           
            break;
        }
                    case 2:
            
            [passCode1 becomeFirstResponder];

                        passCode0.text = @"*";
                       passCode1.text = @"*";
                       passCode2.text = nil;
                        passCode3.text = nil;
            if (textField.tag==2)
            {
                [textField resignFirstResponder];
                [passCode1 becomeFirstResponder];
            }
              return NO;
                         break;
                    case 3:
        {
            [passCode2 becomeFirstResponder];
                        passCode0.text = @"*";
                        passCode1.text = @"*";
                    passCode2.text = @"*";
                        passCode3.text = nil;
          if (textField.tag==3)
            {
                [textField resignFirstResponder];
                [passCode2 becomeFirstResponder];
            }
            return NO;
                                 break;
        }
            
                    case 4:
            [passCode3 becomeFirstResponder];
                       passCode0.text = @"*";
                       passCode1.text = @"*";
                        passCode2.text = @"*";
                        passCode3.text = @"*";
            [self performSelector:@selector(notifyDelegate:) withObject:someString afterDelay:0];
            
            return NO;
            
// return NO;
            break;
            
        default:
            break;
    }
}
  else
  {
      NSLog(@"%@",someString);
      someString = [NSMutableString stringWithString:someString];
      [someString deleteCharactersInRange:NSMakeRange([someString length]-1, 1)];
      if (textField.tag==2)
      {
          [passCode0 performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.0];
          //            txt2.text=@"";
      }
      else if (textField.tag==3)
      {
          
          [passCode1 performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.0];
      }
      else if (textField.tag==4)
      {
          [passCode2 performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.0];
          
      }
  }
      return YES;


}

- (void)notifyDelegate:(NSString *)passcode
{
    userDefaults=[NSUserDefaults standardUserDefaults];
    if([[userDefaults objectForKey:@"DoneKey"]isEqualToString:@"Done"])
    {
        if([[userDefaults objectForKey:@"Passcode"]isEqualToString:someString])
        {
            
        MainViewController *mainObj=[[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
        [self.navigationController pushViewController:mainObj animated:YES];
        }
        else
        {
             [message setText:@"Wrong Passcode.Please try it again"];
        }

    }
    else
    {
       
    if(![userDefaults objectForKey:@"Passcode"])
    {
        [userDefaults setObject:someString forKey:@"Passcode"];
        [message setText:@"Confirm the PassCode"];
        
    }
    else
    {
        if([[userDefaults objectForKey:@"Passcode"]isEqualToString:someString])
        {
            [userDefaults setObject:@"Done" forKey:@"DoneKey"];
            [userDefaults synchronize];
            MainViewController *mainObj=[[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
            [self.navigationController pushViewController:mainObj animated:YES];
        }
    else
    {
          [message setText:@"Wrong Passcode.Please try it again"];
        [userDefaults removeObjectForKey:@"Passcode"];
        
    }
    }
    }
   
//    PassCodeViewController *passCodeobject=[[PassCodeViewController alloc]initWithNibName:@"PassCodeViewController" bundle:nil];
  
    UIView *theParentView = [self.view superview];
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.3];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromRight];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
   // [theParentView addSubview:passCodeobject.view];
    //[passCode0 removeFromSuperview];
    //[self.view removeFromSuperview];
    
    
    [[theParentView layer] addAnimation:animation forKey:@"PassCodeViewController"];
       passCode0.text=nil;
    passCode1.text=nil;
    passCode2.text=nil;
    passCode3.text=nil;
    someString=[[NSMutableString alloc]init];
    [passCode0 becomeFirstResponder];
//    
    
   
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
