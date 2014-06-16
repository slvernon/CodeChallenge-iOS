//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

-(void)viewDidLoad
{
    self.backgroundImage = [UIImage imageNamed:@"green.png"];   //Second Image
    self.view.backgroundColor = [UIColor clearColor];          //Make the background transparent
}
-(void)viewDidAppear:(BOOL)animated
{
    UIImageView* oldView = (UIImageView* )[self.navigationController.view viewWithTag:1];    // Old Background
    UIImageView* newView = (UIImageView* )[self.navigationController.view viewWithTag:2];    // New Background
    newView.image = self.backgroundImage;
    [UIView animateWithDuration: 1.5 animations:^{    //Fading background image
        oldView.alpha = 0;
        newView.alpha = 1;
    } completion:^(BOOL finished) {
        oldView.image = newView.image;
        oldView.alpha = 3;
        newView.alpha = 0;
    }];
}
- (IBAction)goBackButtonPressed {
    UIView * fromView = self.view;
    UIView * toView = [fromView.superview.subviews objectAtIndex:[fromView.superview.subviews indexOfObject:fromView] - 1];
    
    // Get the size of the view area.
    CGRect viewSize = fromView.frame;
    
    
    // Position it off screen.
    toView.frame = CGRectMake( -320 , viewSize.origin.y, 320, viewSize.size.height);
    
    [UIView animateWithDuration:.5 animations:
     ^{
         // Animate the views on and off the screen. This will appear to slide.
         fromView.frame =CGRectMake( 320 , viewSize.origin.y, 320, viewSize.size.height);
         toView.frame =CGRectMake(0, viewSize.origin.y, 320, viewSize.size.height);
     }
                     completion:^(BOOL finished)
     {
         if (finished)
         {
             [self removeFromParentViewController];
             [self.vParentViewController viewDidAppear:YES];
         }
     }];
}
@end

