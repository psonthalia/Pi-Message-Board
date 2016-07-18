//
//  PreviousMesssages.m
//  Pi Message Board
//
//  Created by Paran Sonthalia on 8/12/15.
//  Copyright (c) 2015 Mango Apps. All rights reserved.
//

#import "PreviousMesssages.h"
#import "AppDelegate.h"

@interface PreviousMesssages ()

@end

@implementation PreviousMesssages
@synthesize yourLabel1;
- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (int a = 0; a < appDelegate.array.count; a++) {
        [self.view addSubview:yourLabel1];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
     AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
     return [appDelegate.array count];
 }
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

     static NSString *simpleTableIdentifier = @"SimpleTableCell";
     
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
     
     if (cell == nil) {
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
     }
     
     cell.textLabel.text = [appDelegate.array objectAtIndex:indexPath.row];
     return cell;
 }
- (void)dealloc {
    [super dealloc];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
