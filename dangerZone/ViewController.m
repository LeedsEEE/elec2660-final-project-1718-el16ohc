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
    CLLocationCoordinate2D locationCoords = location.coordinate;
    self.map.region = MKCoordinateRegionMake(locationCoords, MKCoordinateSpanMake(0.01, 0.01));
//    MKCircle *circle = [MKCircle circleWithCenterCoordinate:locationCoords radius:100];
//    [self.map addOverlay:circle];
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
}

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

//- (MKOverlayRenderer *)mapView:(MKMapView *)map viewForOverlay:(id <MKOverlay>)overlay
//{
//    MKCircleRenderer *circleView = [[MKCircleRenderer alloc] initWithOverlay:overlay];
//    circleView.strokeColor = [UIColor redColor];
//    circleView.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.4];
//    return circleView;
//}

@end
