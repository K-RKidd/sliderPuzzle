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

- (IBAction)shuffleTiles:(id)sender {
    //setup so when pushed the tiles move to new positions
}

- (IBAction)slide:(id)sender {
    BOOL left = TRUE;
    BOOL right = TRUE;
    BOOL up = TRUE;
    BOOL down = TRUE;
    UIButton *pressedButton = sender;
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
        /// up
        else if (pressedButton.frame.origin.y + 52 == b.frame.origin.y && pressedButton.frame.origin.x == b.frame.origin.x){
            NSLog(@ "can't move down");
            up = FALSE;
        }
        /// down
        else if (pressedButton.frame.origin.y - 52 == b.frame.origin.y && pressedButton.frame.origin.x == b.frame.origin.x){
            NSLog(@ "can't move up");
            down = FALSE;
        }
        //////// stay in bounds
        else if (pressedButton.frame.origin.x  <= 90){
            left = FALSE;
        }
        else if (pressedButton.frame.origin.x  >= 241){
            right = FALSE;
        }
        else if (pressedButton.frame.origin.y  <= 180){
            up = FALSE;
            
        }
        else if (pressedButton.frame.origin.y   >= 330){
            down = FALSE;
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
    else if (up){
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x, pressedButton.frame.origin.y + 52, 52, 52);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
        
    }

    else if (down){
        
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x, pressedButton.frame.origin.y - 52, 52, 52);
        [UIView animateWithDuration:1.0 animations:^{ pressedButton.frame = newFrame;}];
    }
    
}

@end
