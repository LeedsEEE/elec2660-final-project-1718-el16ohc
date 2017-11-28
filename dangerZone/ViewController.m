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
    self.map.hidden = true;
    self.mapButton.hidden = true;
    self.closeButton.hidden = true;
    self.map.delegate = self;
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    _pickerViewArray = @[@"81mm Mortar", @"105mm Ground Burst", @"105mm Air Burst", @"Pistol", @"155mm Ground Burst", @"155mm Air Burst", @"UGL", @"RPG-18", @"AK-47", @"SA80 A2", @"AKM", @"LMG", @"ASM", @"LSM", @"RPK LMG", @"L129A1", @"N-LAW", @"LSW", @"RPG-18", @"GPMG", @"RPG-7", @"RPO-A", @"L115A3", @"Dragonov", @"DsHK HMG", @"GMG"];
    
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
//    MKCircle *pistol = [MKCircle circleWithCenterCoordinate:location.coordinate radius:25];
//    [self.map addOverlay:pistol level:MKOverlayLevelAboveRoads];
//    MKCircle *sa80 = [MKCircle circleWithCenterCoordinate:location.coordinate radius:300];
//    [self.map addOverlay:sa80 level:MKOverlayLevelAboveRoads];
//    MKCircle *lmg = [MKCircle circleWithCenterCoordinate:location.coordinate radius:400];
//    [self.map addOverlay:lmg level:MKOverlayLevelAboveRoads];
//    MKCircle *lsm = [MKCircle circleWithCenterCoordinate:location.coordinate radius:500];
//    [self.map addOverlay:lsm level:MKOverlayLevelAboveRoads];
//    MKCircle *l12a1 = [MKCircle circleWithCenterCoordinate:location.coordinate radius:600];
//    [self.map addOverlay:l12a1 level:MKOverlayLevelAboveRoads];
//    MKCircle *lsw = [MKCircle circleWithCenterCoordinate:location.coordinate radius:800];
//    [self.map addOverlay:lsw level:MKOverlayLevelAboveRoads];
//    MKCircle *rpg7 = [MKCircle circleWithCenterCoordinate:location.coordinate radius:925];
//    [self.map addOverlay:rpg7 level:MKOverlayLevelAboveRoads];
//    MKCircle *l115a3 = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1000];
//    [self.map addOverlay:l115a3 level:MKOverlayLevelAboveRoads];
    self.map.hidden = false;
    self.mapButton.hidden = false;
    self.closeButton.hidden = false;
    self.pickerView.hidden = true;
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
    self.pickerView.hidden = false;
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
    circleView.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    return circleView;
}

// https://stackoverflow.com/questions/9056451/draw-a-circle-of-1000m-radius-around-users-location-in-mkmapview

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *equipmentSelected = [_pickerViewArray objectAtIndex:row];
    if ([equipmentSelected isEqualToString:@"81mm Mortar"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:40];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"105mm Ground Burst"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:40];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"105mm Air Burst"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:50];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"Pistol"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:50];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"155mm Ground Burst"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:55];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"155mm Air Burst"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:85];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"UGL"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:150];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPG-18"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:200];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"AK-47"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:300];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"SA80 A2"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:300];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"AKM"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:400];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"LMG"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:400];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"ASM"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:400];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"LSM"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:500];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPK LMG"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:600];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"L129A1"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:600];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"N-LAW"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:600];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"LSW"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:800];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPG-18"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:800];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"GPMG"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:800];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPG-7"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:125];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"RPO-A"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1000];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"L115A3"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1000];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"Dragonov"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1300];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"DsHK HMG"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1500];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
    if ([equipmentSelected isEqualToString:@"GMG"]) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        self.map.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
        MKCircle *radius = [MKCircle circleWithCenterCoordinate:location.coordinate radius:1500];
        [self.map addOverlay:radius level:MKOverlayLevelAboveRoads];
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _pickerViewArray.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pickerViewArray[row];
}

@end
