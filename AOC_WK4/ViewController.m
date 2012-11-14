//
//  ViewController.m
//  AOC_WK4
//
//  Created by Joel Johnson on 11/11/12.
//  Copyright (c) 2012 Joel Johnson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{

    self.view.backgroundColor = [UIColor whiteColor];
//Create a UILabel near the top of your screen with the text "Username:" in it.
    UILabel *usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, 10.0f, 90.0f, 30.0f)];
    		if (usernameLabel != nil)
            {
                usernameLabel.text = @"Username:";
                
            }
    [self.view addSubview:usernameLabel];
//Create a UITextField to the right of the username label
    usernameText = [[UITextField alloc] initWithFrame:CGRectMake(110.0f, 10.0f, 200.0f, 30.0f)];
    if (usernameText != nil)
    {
        [usernameText setBorderStyle:UITextBorderStyleRoundedRect];
        [self.view addSubview:usernameText];

    }
//Create a rounded rectangle UIButton of any color under the UITextField with the text "Login" on it.
    UIButton *usernameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (usernameBtn != nil)
    {
        usernameBtn.frame = CGRectMake(10.0f, 50.0f, 300.0f, 30.0f);
        usernameBtn.tintColor = [UIColor grayColor];
        usernameBtn.tag = 0;
        [usernameBtn setTitle:@"Login" forState:UIControlStateNormal];
        [usernameBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:usernameBtn];
    }
    
//Create another UILabel beneath with the default text "Please Enter Username".
        pleaseEnterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 100.0f, 320.0f, 120.0f)];
        if(pleaseEnterLabel != nil)
        {
            pleaseEnterLabel.backgroundColor = [UIColor lightGrayColor];
            pleaseEnterLabel.text = @"Please Enter Username";
            pleaseEnterLabel.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:pleaseEnterLabel];
        }
// TODO // If the user has not entered any text into the UITextField, display in the UILabel, "Username cannot be empty". Otherwise, display "User: username has been logged in".
    
//Create a UIButton using the rounded rectangle type. Give this button any color you wish.
//Add text "Show Date"
// add action to call onClick add tag to specify button 
    UIButton *showDate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (showDate != nil)
    {
        showDate.frame = CGRectMake(10.0f, 250.0f, 300.0f, 30.0f);
        showDate.tintColor = [UIColor redColor];
        showDate.tag = 1;
        [showDate setTitle:@"Show Date" forState:UIControlStateNormal];
        [showDate addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:showDate];
        
        
    }
    
//Create a UIButton using either the light or dark info type and position it somewhere near the bottom of the screen.
//Create a UILabel beneath it that contains no initial text.
    UIButton *personInfo = [UIButton buttonWithType:UIButtonTypeInfoDark];
    if(personInfo != nil)
    {
        personInfo.frame = CGRectMake(10.0f, 300.0f, 30.0f, 30.0f);
        [personInfo addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        personInfo.tag = 2;
        [self.view addSubview:personInfo];
    }
    creatorInfo = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 340.0f, 300.0f, 80.0f)];
    if(creatorInfo != nil)
    {
        creatorInfo.numberOfLines = 2;
        [self.view addSubview:creatorInfo];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)onClick:(UIButton*)button
{

    switch (button.tag) {
        case 0:
        {
            
            NSString *username = [usernameText text];
            //This could allow for spaces. Should probably use something like trimming whitespace on either end.
            //for now this works
            if (username.length == 0)
            {
                pleaseEnterLabel.text = @"Username cannot be empty";
            }
            else
            {
                NSString *loggedIn = [NSString stringWithFormat: @"User: %@ has been logged in", username];
                pleaseEnterLabel.text = loggedIn ;
            }
        }
            break;
        case 1:
        {
            NSDateFormatter *theFormatter = [[NSDateFormatter alloc] init];
                    [theFormatter setDateFormat:@"MMMM d, YYYY hh:mm:ss aaaa zzzz"];
                    NSString *myDate = [theFormatter stringFromDate:[NSDate date]];
            
                    UIAlertView *showMessage = [[UIAlertView alloc]initWithTitle:@"Date:" message:[NSString stringWithFormat:@"%@",myDate] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    if(showMessage != nil)
                    {
                        [showMessage show];
                   }

        
        }
            break;
        case 2:
        {
         creatorInfo.text = @"This application was created by: Joel Johnson";
        
        }
            
        default:
            break;
    }

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
