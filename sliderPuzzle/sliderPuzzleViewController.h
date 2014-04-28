//
//  sliderPuzzleViewController.h
//  sliderPuzzle
//
//  Created by Krystle on 4/2/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sliderPuzzleViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tiles;

@property (weak, nonatomic) IBOutlet UILabel *label;


- (IBAction)slide:(id)sender;


@end
