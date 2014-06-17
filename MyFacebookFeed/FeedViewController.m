//
//  FeedViewController.m
//  MyFacebookFeed
//
//  Created by Om Pathipaka on 6/6/14.
//  Copyright (c) 2014 Om Pathipaka. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIView *storyCard;
@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;
@property (weak, nonatomic) IBOutlet UIView *commentImageView;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;


@end

@implementation FeedViewController

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
- (IBAction)onTap:(id)sender {
     [self.view endEditing:YES];
}


- (IBAction)onLike:(id)sender {
    self.likeButton.selected = YES;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
      self.navigationItem.title = @"Post";
    //self.navigationItem.titleTextAttributes
    
    //setting a right navbar icon
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share_btn"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    //styling the elements
    self.storyCard.layer.cornerRadius = 2;
    self.storyCard.layer.shadowColor = [UIColor grayColor].CGColor;
    self.storyCard.layer.shadowOffset = CGSizeMake(1,1);
    self.storyCard.layer.shadowOpacity = 0.5;
    
    self.imageContainer.layer.shadowColor = [UIColor grayColor].CGColor;
    self.imageContainer.layer.shadowOffset = CGSizeMake(1,1);
    self.imageContainer.layer.shadowOpacity = 0.8;
    

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
                         self.commentImageView.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.commentImageView.frame.size.height, self.commentImageView.frame.size.width, self.commentImageView.frame.size.height);
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
                         self.commentImageView.frame = CGRectMake(0, self.view.frame.size.height - self.commentImageView.frame.size.height*2, self.commentImageView.frame.size.width, self.commentImageView.frame.size.height);
                         
                     }
                     completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
