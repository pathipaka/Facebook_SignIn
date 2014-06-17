//
//  FeedHomeViewController.m
//  MyFacebookFeed
//
//  Created by Om Pathipaka on 6/6/14.
//  Copyright (c) 2014 Om Pathipaka. All rights reserved.
//

#import "FeedHomeViewController.h"
#import "FeedViewController.h"

@interface FeedHomeViewController ()
//@property (weak, nonatomic) IBOutlet UIButton *storyButton;

@end

@implementation FeedHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)onTap:(id)sender {
  //  FeedViewController *fvc = [[FeedViewController alloc] init];
    //[self.navigationController pushViewController:fvc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.navigationItem.title = @"News Feed";
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    //setting a right navbar icon
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"manburger_NavbarIcon"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;

    //setting a left navbar icon
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_NavbarIcon"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
