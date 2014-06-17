//
//  NotificationsViewController.m
//  MyFacebookFeed
//
//  Created by Om Pathipaka on 6/8/14.
//  Copyright (c) 2014 Om Pathipaka. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *notificationsScrollView;

@end

@implementation NotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.navigationItem.title = @"Notifications";
    // Do any additional setup after loading the view from its nib.
    
    //enabling scrolling
    [self.notificationsScrollView setScrollEnabled:YES];
}

    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
