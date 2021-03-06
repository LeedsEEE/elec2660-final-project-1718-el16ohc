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
NSArray *_pickerViewArray;
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
// Initial hidden state for Labels and Buttons.
    self.map.hidden = true;
    self.mapButton.hidden = true;
    self.closeButton.hidden = true;
    self.map.delegate = self;
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    _pickerViewArray = @[@"Select Below", @"81mm Mortar", @"105mm Ground Burst", @"105mm Air Burst", @"Pistol", @"155mm Ground Burst", @"155mm Air Burst", @"UGL", @"RPG-18", @"AK-47", @"SA80 A2", @"AKM", @"LMG", @"ASM", @"LSM", @"RPK LMG", @"L129A1", @"N-LAW", @"LSW", @"RPG-18", @"GPMG", @"RPG-7", @"RPO-A", @"L115A3", @"Dragunov", @"DsHK HMG", @"GMG", @"Tsar Bomba"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)goButton:(id)sender {
// Holds text fields values for longitude and latitude.
    self.longitude = [self.longitudeTextField.text doubleValue];
    self.latitude = [self.latitudeTextField.text doubleValue];
    self.map.hidden = false;
    self.mapButton.hidden = false;
    self.closeButton.hidden = false;
    self.pickerView.hidden = true;
    self.infoButton.hidden = true;
}
- (IBAction)backgroundPressed:(id)sender {
// Hides keyboard for background press.
    if ([self.longitudeTextField isFirstResponder]) {
        [self.longitudeTextField resignFirstResponder];
    }
    if ([self.longitudeTextField isFirstResponder]) {
        [self.longitudeTextField resignFirstResponder];
    }
}
- (IBAction)mapButton:(id)sender {
// Action for each segment of segmented control.
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
// Changes hidden state on button press.
    self.map.hidden = true;
    self.mapButton.hidden = true;
    self.closeButton.hidden = true;
    self.pickerView.hidden = false;
    self.infoButton.hidden = false;
}
- (IBAction)infoButton:(id)sender {
}
# pragma mark Text Field Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (MKOverlayRenderer *)mapView:(MKMapView *)map viewForOverlay:(id <MKOverlay>)overlay
// Renders overlay for radius.
{
    MKCircleRenderer *circleView = [[MKCircleRenderer alloc] initWithOverlay:overlay];
    circleView.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    return circleView;
}
// https://stackoverflow.com/questions/9056451/draw-a-circle-of-1000m-radius-around-users-location-in-mkmapview
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *equipmentSelected = [_pickerViewArray objectAtIndex:row];
// Properties in picker view.
    if ([equipmentSelected isEqualToString:@"Select Below"]) {
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
// https://stackoverflow.com/questions/8000373/remove-mkmapview-overlay-on-button-push
    }
    if ([equipmentSelected isEqualToString:@"81mm Mortar"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.002, 0.002));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:40];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"105mm Ground Burst"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.002, 0.002));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:40];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"105mm Air Burst"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.0025, 0.0025));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:50];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"Pistol"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.0025, 0.0025));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:50];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"155mm Ground Burst"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.0028, 0.0028));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:55];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"155mm Air Burst"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.0043, 0.0043));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:85];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"UGL"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.0075, 0.0075));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:150];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPG-18"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.01, 0.01));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:200];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"AK-47"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.015, 0.015));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:300];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"SA80 A2"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.015, 0.015));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:300];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"AKM"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.02, 0.02));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:400];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"LMG"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.02, 0.02));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:400];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"ASM"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.02, 0.02));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:400];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"LSM"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.025, 0.025));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:500];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPK LMG"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.03, 0.03));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:600];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"L129A1"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.03, 0.03));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:600];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"N-LAW"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.03, 0.03));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:600];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"LSW"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.04, 0.04));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:800];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPG-18"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.04, 0.04));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:800];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"GPMG"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.04, 0.04));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:800];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPG-7"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.046, 0.046));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:925];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPO-A"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1000];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"L115A3"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1000];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"Dragunov"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.065, 0.065));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1300];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"DsHK HMG"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.075, 0.075));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1500];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"GMG"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.075, 0.075));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1500];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"Tsar Bomba"]) {
        self.longitude = [self.longitudeTextField.text doubleValue];
        self.latitude = [self.latitudeTextField.text doubleValue];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.175, 0.175));
        NSArray *erase = [self.map overlays];
        [self.map removeOverlays:erase];
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:3500];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
// Cells for amount of array.
    return _pickerViewArray.count;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pickerViewArray[row];
}
// https://www.youtube.com/watch?v=sofEcrhE5AM
@end
