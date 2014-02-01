//
//  SettingsListViewController.m
//  Chess Clock
//
//  Created by Devan Buggay on 1/10/14.
//  Copyright (c) 2014 Devan Buggay. All rights reserved.
//

#import "SettingsListViewController.h"

@interface SettingsListViewController ()

@end

@implementation SettingsListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setcells];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self setcells];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    switch (indexPath.row) {
            
        case 0:
            [defaults setInteger:30000 forKey:@"time"];
            [defaults setInteger:0 forKey:@"bonus"];
            break;
            
        case 1:
            [defaults setInteger:60000 forKey:@"time"];
            [defaults setInteger:0 forKey:@"bonus"];
            break;
            
        case 2:
            [defaults setInteger:90000 forKey:@"time"];
            [defaults setInteger:0 forKey:@"bonus"];
            break;
            
        case 3:
            [defaults setInteger:90000 forKey:@"time"];
            [defaults setInteger:500 forKey:@"bonus"];
            break;
            
        case 4:
            [defaults setInteger:180000 forKey:@"time"];
            [defaults setInteger:0 forKey:@"bonus"];
            break;
        
        case 5:
            [defaults setInteger:180000 forKey:@"time"];
            [defaults setInteger:500 forKey:@"bonus"];
            break;
            
            
            
    }
    [defaults synchronize];
    [self setcells];
}

- (void)setcells {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger time = [defaults integerForKey:@"time"];
    NSInteger bonus = [defaults integerForKey:@"bonus"];
    
    for (NSInteger section = 0, sectionCount = self.tableView.numberOfSections; section < sectionCount; ++section) {
        for (NSInteger row = 0, rowCount = [self.tableView numberOfRowsInSection:section] - 1; row < rowCount; ++row) {
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.accessoryView = nil;
            switch (row) {
                case 0:
                    if (time == 30000)
                        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                    break;
                
                case 1:
                    if (time == 60000)
                        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                    break;
                
                case 2:
                    if (time == 90000 && bonus == 0)
                        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                    break;
                    
                
                case 3:
                    if (time == 90000 && bonus == 500)
                        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                    break;

                case 4:
                    if (time == 180000 && bonus == 0)
                        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                    break;
                
                case 5:
                    if (time == 180000 && bonus == 500)
                        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                    break;
            }
        }
    }
}



@end
