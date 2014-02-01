//
//  ViewController.m
//  Chess Clock
//
//  Created by Devan Buggay on 1/2/14.
//  Copyright (c) 2014 Devan Buggay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
    white = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0  alpha:1];
    black = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    unactive = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0  alpha:1];
    [self initialize];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)initialize {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults integerForKey:@"time"]) {
        NSLog(@"no time default");
        [defaults setInteger:180000 forKey:@"time"];
        [defaults synchronize];
        
    }
    if (![defaults integerForKey:@"bonus"]) {
        NSLog(@"no bonus default");
        [defaults setInteger:0 forKey:@"bonus"];
        [defaults synchronize];
    }
    NSInteger time = [defaults integerForKey:@"time"];
    bonus = [defaults integerForKey:@"bonus"];
    
    player1time = time;
    player2time = time;
    player = NO;
    ongoing = YES;
    if(player1time / 100 % 60 < 10) {
        [self.player1button setTitle:[NSString stringWithFormat:@"%ld:0%ld", player1time / 6000, player1time / 100 % 60] forState:(UIControlStateNormal)];
    }
    else {
        [self.player1button setTitle:[NSString stringWithFormat:@"%ld:%ld", player1time / 6000, player1time / 100 % 60] forState:(UIControlStateNormal)];
    }
    if(player2time / 100 % 60 < 10) {
        [self.player2button setTitle:[NSString stringWithFormat:@"%ld:0%ld", player2time / 6000, player2time / 100 % 60] forState:(UIControlStateNormal)];
    }
    else {
        [self.player2button setTitle:[NSString stringWithFormat:@"%ld:%ld", player2time / 6000, player2time / 100 % 60] forState:(UIControlStateNormal)];
    }
    [self.player1button setBackgroundColor: white];
    [self.player2button setBackgroundColor: unactive];
    self.player2button.transform = CGAffineTransformMakeRotation(M_PI);
    play = NO;
    [timer invalidate];
    timer = nil;
    [self.timertogglebutton setSelectedSegmentIndex:1];
}

- (IBAction)player1buttondown:(id)sender {
    if (play) {
        if (player == NO) {
            player = YES;
            [self.player1button setBackgroundColor: unactive];
            [self.player2button setBackgroundColor: black];
            player2time += bonus;
        }
    }
    else {
        [self timertoggle];
        play = YES;
        [self.timertogglebutton setSelectedSegmentIndex:0];
    }
    
}

- (IBAction)player2buttondown:(id)sender {
    if (player == YES) {
        player = NO;
        [self.player1button setBackgroundColor: white];
        [self.player2button setBackgroundColor: unactive];
        player1time += bonus;
    }
}

- (IBAction)timertogglebuttondown:(id)sender {
    if (self.timertogglebutton.selectedSegmentIndex == 0) {
        if (!play) {
            play = YES;
            [self timertoggle];
        }
    }
    if (self.timertogglebutton.selectedSegmentIndex == 1) {
        if (play) {
            play = NO;
            [self timertoggle];
        }
    }
}

- (IBAction)resetbuttondown:(id)sender {
    [self initialize];
}

- (void)clock:(NSTimer *)timer
{
    if (ongoing) {
        
        if(player == NO) {
            player1time--;
            if (player1time > 0) {
                [UIView setAnimationsEnabled:NO];
                if(player1time / 100 % 60 < 10)
                    [self.player1button setTitle:[NSString stringWithFormat:@"%ld:0%ld", player1time / 6000, player1time / 100 % 60] forState:(UIControlStateNormal)];
                else
                    [self.player1button setTitle:[NSString stringWithFormat:@"%ld:%ld", player1time / 6000, player1time / 100 % 60] forState:(UIControlStateNormal)];
                [UIView setAnimationsEnabled:YES];
            }
            else {
                UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Player 2 wins"
                                                                   message:@""
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
                [theAlert show];
                ongoing = NO;
            }
        }
        else {
            player2time--;
            if (player2time > 0) {
                [UIView setAnimationsEnabled:NO];
                if(player2time / 100 % 60 < 10)
                    [self.player2button setTitle:[NSString stringWithFormat:@"%ld:0%ld", player2time / 6000, player2time / 100 % 60] forState:(UIControlStateNormal)];
                else
                    [self.player2button setTitle:[NSString stringWithFormat:@"%ld:%ld", player2time / 6000, player2time / 100 % 60] forState:(UIControlStateNormal)];
                [UIView setAnimationsEnabled:YES];
            }
            else {
                UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Player 1 wins"
                                                                   message:@""
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
                [theAlert show];
                ongoing = NO;
            }
        }
    }
}

-(void) timertoggle{
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0/100.0 target:self selector:@selector(clock:) userInfo:nil repeats:YES];
    }else{
        [timer invalidate];
        timer = nil;
    }
}

@end
