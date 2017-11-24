//
//  ViewController.m
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 17/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.map.hidden = true;
    self.mapButton.hidden = true;
    self.closeButton.hidden = true;
    self.map.delegate = self;
    
// https://stackoverflow.com/questions/36492112/mapkit-overlay-does-not-appear
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButton:(id)sender {
    NSLog(@"Longitude - %@", self.longitudeTextField.text);
    NSLog(@"Latitude - %@", self.latitudeTextField.text);
    self.longitude = [self.longitudeTextField.text doubleValue];
    self.latitude = [self.latitudeTextField.text doubleValue];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
    self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
    MKCircle *pistol = [MKCircle circleWithCenterCoordinate:location.coordinate radius:25];
    [self.map addOverlay:pistol level:MKOverlayLevelAboveRoads];
    MKCircle *sa80 = [MKCircle circleWithCenterCoordinate:location.coordinate radius:300];
    [self.map addOverlay:sa80 level:MKOverlayLevelAboveRoads];
    MKCircle *lmg = [MKCircle circleWithCenterCoordinate:location.coordinate radius:400];
    [self.map addOverlay:lmg level:MKOverlayLevelAboveRoads];
    MKCircle *lsm = [MKCircle circleWithCenterCoordinate:location.coordinate radius:500];
    [self.map addOverlay:lsm level:MKOverlayLevelAboveRoads];
    MKCircle *l12a1 = [MKCircle circleWithCenterCoordinate:location.coordinate radius:600];
    [self.map addOverlay:l12a1 level:MKOverlayLevelAboveRoads];
    MKCircle *lsw = [MKCircle circleWithCenterCoordinate:location.coordinate radius:800];
    [self.map addOverlay:lsw level:MKOverlayLevelAboveRoads];
    MKCircle *rpg7 = [MKCircle circleWithCenterCoordinate:location.coordinate radius:925];
    [self.map addOverlay:rpg7 level:MKOverlayLevelAboveRoads];
    MKCircle *l115a3 = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1000];
    [self.map addOverlay:l115a3 level:MKOverlayLevelAboveRoads];
    self.map.hidden = false;
    self.mapButton.hidden = false;
    self.closeButton.hidden = false;
}

- (IBAction)backgroundPressed:(id)sender {
    if ([self.longitudeTextField isFirstResponder]) {
        [self.longitudeTextField resignFirstResponder];
    }
    if ([self.longitudeTextField isFirstResponder]) {
        [self.longitudeTextField resignFirstResponder];
    }
}

- (IBAction)mapButton:(id)sender {

    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            self.map.mapType = MKMapTypeStandard ;
            break;
        case 1:
            self.map.mapType = MKMapTypeSatellite ;
            break;
        case 2:
            self.map.mapType = MKMapTypeHybrid ;
            break;
            
        default:
            break;
    }
}

// https://stackoverflow.com/questions/20591345/apple-mapkit-map-style-implement-style-change-using-segmented-controller

- (IBAction)closeButton:(id)sender {
    self.map.hidden = true;
    self.mapButton.hidden = true;
    self.closeButton.hidden = true;
}

# pragma mark Text Field Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (MKOverlayRenderer *)mapView:(MKMapView *)map viewForOverlay:(id <MKOverlay>)overlay
{
    MKCircleRenderer *circleView = [[MKCircleRenderer alloc] initWithOverlay:overlay];
//    circleView.strokeColor = [UIColor redColor];
    circleView.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.1];
    return circleView;
}

// https://stackoverflow.com/questions/9056451/draw-a-circle-of-1000m-radius-around-users-location-in-mkmapview

@end
