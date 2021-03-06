//
//  ViewController.h
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 17/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
// Defines outlets for Labels, Buttons and MKMapView.
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mapButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
// Properties to hold logitude and latitude.
@property CLLocationDegrees longitude;
@property CLLocationDegrees latitude;
// Defines actions for Buttons and Background.
- (IBAction)goButton:(id)sender;
- (IBAction)backgroundPressed:(id)sender;
- (IBAction)mapButton:(id)sender;
- (IBAction)closeButton:(id)sender;
- (IBAction)infoButton:(id)sender;
@end
