//
//  ViewController.h
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 17/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
- (IBAction)goButton:(id)sender;

@end

