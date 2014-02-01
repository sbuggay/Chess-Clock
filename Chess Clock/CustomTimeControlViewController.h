//
//  CustomTimeControlViewController.h
//  Chess Clock
//
//  Created by Devan Buggay on 1/20/14.
//  Copyright (c) 2014 Devan Buggay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTimeControlViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *Minutes;
@property (weak, nonatomic) IBOutlet UITextField *Seconds;
@property (weak, nonatomic) IBOutlet UITextField *Bonus;

@end
