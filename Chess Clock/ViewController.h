//
//  ViewController.h
//  Chess Clock
//
//  Created by Devan Buggay on 1/2/14.
//  Copyright (c) 2014 Devan Buggay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSInteger player1time;
    NSInteger player2time;
    NSInteger bonus;
    BOOL player; //false 1 true 2
    BOOL play;
    BOOL ongoing;
    NSTimer *timer;
    
    UIColor *white, *black, *unactive;

}
@property (weak, nonatomic) IBOutlet UIButton *player1button;
@property (weak, nonatomic) IBOutlet UIButton *player2button;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timertogglebutton;

- (IBAction)player1buttondown:(id)sender;
- (IBAction)player2buttondown:(id)sender;
- (IBAction)timertogglebuttondown:(id)sender;
- (IBAction)resetbuttondown:(id)sender;


- (void) clock : (NSTimer *)timer;

@end
