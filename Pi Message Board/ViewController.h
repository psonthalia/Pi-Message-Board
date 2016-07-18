//
//  ViewController.h
//  Pi Message Board
//
//  Created by Paran Sonthalia on 8/4/15.
//  Copyright (c) 2015 Mango Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSArray *pickerData;
    NSString *color;
}
- (IBAction)upload:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *message;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)previous:(id)sender;

@end

