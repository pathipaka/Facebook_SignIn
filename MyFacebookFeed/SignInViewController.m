//
//  SignInViewController.m
//  MyFacebookFeed
//
//  Created by Om Pathipaka on 6/12/14.
//  Copyright (c) 2014 Om Pathipaka. All rights reserved.
//

#import "SignInViewController.h"
#import "FeedHomeViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"
#import "SignInViewController.h"

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UIView *signInArea;
@property (weak, nonatomic) IBOutlet UIView *signUpArea;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
//@property(nonatomic,strong)UITabBarController *tabBarController;

- (IBAction)onLogInButton:(id)sender;
- (IBAction)editingChanged;


// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (void)checkPassword;
- (void)resetLogInButton;
- (void)continueLogIn;

@end

@implementation SignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

//Hide keyboard on tapping elsewhere
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.indicatorView stopAnimating];
     self.logInButton.enabled = NO;
    NSLog(@"button disabled and activity indicator hidden");
   
}

- (IBAction)editingChanged {
    if ([self.userName.text length] != 0 && [self.passwordField.text length] != 0) {
        self.logInButton.enabled = YES;
        NSLog(@"button enabled");
    }
    else {
        self.logInButton.enabled = NO;
    }
}

- (IBAction)onLogInButton:(id)sender {
    [self.logInButton setBackgroundImage:[UIImage imageNamed:@"logging_in_button.png"]forState:UIControlStateNormal];
    [self.view endEditing:YES];
    [self.indicatorView startAnimating];
    [self performSelector:@selector(checkPassword) withObject:nil afterDelay:2];
    
    NSLog(@"log in button tapped");
}

- (void)checkPassword {
    NSLog(@"checking password");
    [self.indicatorView stopAnimating];
    if ([self.passwordField.text isEqualToString:@"password"]){
        [self continueLogIn];
    } else {
        [self resetLogInButton];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}
- (void)resetLogInButton{
    [self.logInButton setBackgroundImage:[UIImage imageNamed:@"login_button_disabled.png"]forState:UIControlStateNormal];

}
- (void)continueLogIn{
    NSLog(@"password correct");

    
    //Create UIViewControllers for different tabs  //
    FeedHomeViewController *hvc = [[FeedHomeViewController alloc] init];
    RequestsViewController *rvc = [[RequestsViewController alloc] init];
    MessagesViewController *mvc = [[MessagesViewController alloc] init];
    NotificationsViewController *notvc = [[NotificationsViewController alloc] init];
    MoreViewController *morevc = [[MoreViewController alloc] init];
    
    //Setting the navigation controller for each UIView Controller//
    UINavigationController *n_hvc = [[UINavigationController alloc] initWithRootViewController:hvc];
    UINavigationController *n_rvc = [[UINavigationController alloc] initWithRootViewController:rvc];
    UINavigationController *n_mvc = [[UINavigationController alloc] initWithRootViewController:mvc];
    UINavigationController *n_notvc = [[UINavigationController alloc] initWithRootViewController:notvc];
    UINavigationController *n_morevc = [[UINavigationController alloc] initWithRootViewController:morevc];
    
    //adding title and image to each tab and customizing appearance of the navigations bars
    n_hvc.tabBarItem.title = @"New Feed";
    n_hvc.tabBarItem.image = [UIImage imageNamed:@"feed_tab_img"];
    n_hvc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_hvc.navigationBar.tintColor = [UIColor whiteColor];
    n_hvc.navigationBar.translucent = NO;
    
    n_mvc.tabBarItem.title = @"Messages";
    n_mvc.tabBarItem.image = [UIImage imageNamed:@"messages_tab_img"];
    n_mvc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_mvc.navigationBar.tintColor = [UIColor whiteColor];
    n_mvc.navigationBar.translucent = NO;
    
    n_morevc.tabBarItem.title = @"More";
    n_morevc.tabBarItem.image = [UIImage imageNamed:@"more_tab_img"];
    n_morevc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_morevc.navigationBar.tintColor = [UIColor whiteColor];
    n_morevc.navigationBar.translucent = NO;
    
    n_rvc.tabBarItem.title = @"Requests";
    n_rvc.tabBarItem.image = [UIImage imageNamed:@"requests_tab_img"];
    n_rvc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_rvc.navigationBar.tintColor = [UIColor whiteColor];
    n_rvc.navigationBar.translucent = NO;
    
    n_notvc.tabBarItem.title = @"Notifications";
    n_notvc.tabBarItem.image = [UIImage imageNamed:@"notifications_tab_img"];
    n_notvc.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:99.0/255.0 blue:161.0/255.0 alpha:1.0];
    n_notvc.navigationBar.tintColor = [UIColor whiteColor];
    n_notvc.navigationBar.translucent = NO;
    
    
    // Create the tab bar controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[n_hvc, n_rvc, n_mvc, n_notvc, n_morevc];
    
   tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // Fade

    
    [self presentViewController:tabBarController animated:YES completion:nil];
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.signInArea.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - 400, self.signInArea.frame.size.width, self.signInArea.frame.size.height);
                         self.signUpArea.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - 40, self.signUpArea.frame.size.width, self.signUpArea.frame.size.height);
                         
                         
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.signInArea.frame = CGRectMake(0, 0, self.signInArea.frame.size.width, self.signInArea.frame.size.height);
                         self.signUpArea.frame = CGRectMake(0, 461, self.signUpArea.frame.size.width, self.signUpArea.frame.size.height);
                         
                         
                     }
                     completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
















