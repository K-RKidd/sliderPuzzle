//
//  sliderPuzzleViewController.m
//  sliderPuzzle
//
//  Created by Krystle on 4/2/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "sliderPuzzleViewController.h"


@interface sliderPuzzleViewController ()

@end

@implementation sliderPuzzleViewController
@synthesize tiles;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
 
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)slide:(id)sender {
    BOOL left = TRUE;
    BOOL right = TRUE;
    BOOL up = TRUE;
    BOOL down = TRUE;
    UIButton *pressedButton = sender;
    
    //////// stay in bounds for x
    if (pressedButton.frame.origin.x <= 38){
        left = FALSE;
    }
    else if (pressedButton.frame.origin.x  >= 194){
        right = FALSE;
    }
    //// stay in bounds for y
    if (pressedButton.frame.origin.y  == 128){
        up = FALSE;
        
    }
    else if (pressedButton.frame.origin.y  == 284){
        down = FALSE;
    }
    
    for (UIButton *b in tiles){
        ///// right
        if (pressedButton.frame.origin.x + 52 == b.frame.origin.x && pressedButton.frame.origin.y == b.frame.origin.y){
            NSLog(@ "can't move right");
            right = FALSE;
        }
        /// left
        else if (pressedButton.frame.origin.x - 52 == b.frame.origin.x && pressedButton.frame.origin.y == b.frame.origin.y){
            NSLog(@ "can't move left");
            left = FALSE;
        }
        /// down
        else if (pressedButton.frame.origin.y + 52 == b.frame.origin.y && pressedButton.frame.origin.x == b.frame.origin.x){
            NSLog(@ "can't move down");
            down = FALSE;
        }
        /// up
        else if (pressedButton.frame.origin.y - 52 == b.frame.origin.y && pressedButton.frame.origin.x == b.frame.origin.x){
            NSLog(@ "can't move up");
            up = FALSE;
        }
    }
   
    if (right){
        
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x + 52, pressedButton.frame.origin.y, 52, 52);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
       
        }
    else if (left){
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x - 52, pressedButton.frame.origin.y, 52, 52);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
        
    }
    else if (down){
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x, pressedButton.frame.origin.y + 52, 52, 52);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
        
    }

    else if (up){
        
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x, pressedButton.frame.origin.y - 52, 52, 52);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
    }
    
}

@end
