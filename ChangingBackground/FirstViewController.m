//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
-(void)viewDidLoad
{
    self.backgroundImage = [UIImage imageNamed:@"blue.png"];
    self.view.backgroundColor = [UIColor clearColor];  //Making background transparent
}
-(void)viewDidAppear:(BOOL)animated
{
    UIImageView* oldView = (UIImageView* )[self.navigationController.view viewWithTag:1];    //Old Background
    UIImageView* newView = (UIImageView* )[self.navigationController.view viewWithTag:2];    //New Background
    newView.image = self.backgroundImage;
    [UIView animateWithDuration: 1.5 animations:^{   //Fading
        oldView.alpha = 0;
        newView.alpha = 1;
    } completion:^(BOOL finished) {
        oldView.image = newView.image;
        oldView.alpha = 3;
        newView.alpha = 0;
    }];
}
- (IBAction)goForwardButtonPressed {
    SecondViewController* viewController = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController addChildViewController:viewController];
    
    UIView * fromView = self.view;
    UIView * toView = viewController.view;
    toView.backgroundColor = [UIColor clearColor];
    fromView.backgroundColor = [UIColor clearColor];
    
    // Get the size of the view area.
    CGRect viewSize = fromView.frame;
    
    // Add the toView to the fromView
    [fromView.superview insertSubview:toView aboveSubview:fromView];
    
    // Position it off screen.
    toView.frame = CGRectMake( 320 , viewSize.origin.y, 320, viewSize.size.height);
    
    [UIView animateWithDuration:.5 animations:
     ^{
         // Animate the views on and off the screen. This will appear to slide.
         fromView.frame =CGRectMake( -320 , viewSize.origin.y, 320, viewSize.size.height);
         toView.frame =CGRectMake(0, viewSize.origin.y, 320, viewSize.size.height);
     }
                     completion:^(BOOL finished)
     {
         if (finished)
         {
             // Remove the old view from its parent.
             [viewController viewDidAppear:YES];
             viewController.vParentViewController = self;
         }
     }];
}

@end
