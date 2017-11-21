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
    self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.01, 0.01));
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:location.coordinate radius:100];
    [self.map addOverlay:circle level:MKOverlayLevelAboveRoads];
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
    circleView.strokeColor = [UIColor redColor];
    circleView.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    return circleView;
}

// https://stackoverflow.com/questions/9056451/draw-a-circle-of-1000m-radius-around-users-location-in-mkmapview

@end
