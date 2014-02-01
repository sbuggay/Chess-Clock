//
//  CustomTimeControlViewController.m
//  Chess Clock
//
//  Created by Devan Buggay on 1/20/14.
//  Copyright (c) 2014 Devan Buggay. All rights reserved.
//

#import "CustomTimeControlViewController.h"

@interface CustomTimeControlViewController ()

@end

@implementation CustomTimeControlViewController

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

    
    
    UIBarButtonItem *donebutton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    self.navigationController.topViewController.navigationItem.rightBarButtonItem = donebutton;
    donebutton.enabled=TRUE;
    donebutton.style=UIBarButtonSystemItemDone;
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger tempTime = [defaults integerForKey:@"time"];
    NSInteger tempBonus = [defaults integerForKey:@"bonus"];
    
    _Seconds.text = [NSString stringWithFormat:@"%ld",tempTime % 6000 / 100];
    _Minutes.text = [NSString stringWithFormat:@"%ld",tempTime / 6000];
    _Bonus.text = [NSString stringWithFormat:@"%ld", tempBonus / 100];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)done {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSInteger tempTime = 0;
    NSInteger tempBonus = 0;
    
    tempTime = [_Seconds.text integerValue] * 100;
    tempTime += [_Minutes.text integerValue] * 6000;
    tempBonus = [_Bonus.text integerValue] * 100;
    
    [defaults setInteger:tempTime forKey:@"time"];
    [defaults setInteger:tempBonus forKey:@"bonus"];
    
    
    
    [self.navigationController popViewControllerAnimated: YES];
}


#pragma mark - Table view data source


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
