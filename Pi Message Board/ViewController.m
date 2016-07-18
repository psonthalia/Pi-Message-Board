//
//  ViewController.m
//  Pi Message Board
//
//  Created by Paran Sonthalia on 8/4/15.
//  Copyright (c) 2015 Mango Apps. All rights reserved.
//

#import "ViewController.h"
#import <Firebase/Firebase.h>
#import "AppDelegate.h"
#import "PreviousMesssages.h"

@interface ViewController () {
    
}

@end

@implementation ViewController

@synthesize message, picker;

- (void)viewDidLoad {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSUserDefaults *score = [NSUserDefaults standardUserDefaults];
    [score setObject:appDelegate.array forKey:@"array"];
    [score synchronize];
    appDelegate.array = [score valueForKey:@"array"];
    [super viewDidLoad];
    self.message.delegate = self;
    pickerData = [[NSArray alloc] initWithObjects:@"black", @"blue", @"gold", @"orange", @"pink", @"purple", @"red", @"gray", @"green", @"white", @"yellow", nil];
    Firebase *myRootRef = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message"];
    appDelegate.array = [[NSMutableArray alloc] init];
    
    [myRootRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        [appDelegate.array insertObject:snapshot.value atIndex:0];
        NSLog(@"%@ -> %@", snapshot.key, snapshot.value);
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}
- (IBAction)upload:(id)sender {
    Firebase *myRootRef = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message"];
    Firebase *message1 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message1"];
    Firebase *message2 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message2"];
    Firebase *message3 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message3"];
    Firebase *message4 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message4"];
    Firebase *message5 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message5"];
    Firebase *message6 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message6"];
    Firebase *message7 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message7"];
    Firebase *message8 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message8"];
    Firebase *message9 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/message9"];
    //[message9 setValue:]
    [myRootRef setValue: message.text];
    
    NSInteger row;
    
    
    row = [picker selectedRowInComponent:0];
    color = [pickerData objectAtIndex:row];
    
    Firebase *myRootRef2 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/color2"];
    [myRootRef2 setValue: color];
    
    Firebase *myRootRef3 = [[Firebase alloc] initWithUrl:@"https://pimessageboard.firebaseio.com/refresh"];
    [myRootRef3 setValue: @"1"];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [message resignFirstResponder];
    return YES;
}
- (IBAction)previous:(id)sender {
    PreviousMesssages *viewController = [[PreviousMesssages alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}
@end
