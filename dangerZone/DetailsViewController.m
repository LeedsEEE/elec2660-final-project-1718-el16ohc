//
//  DetailsViewController.m
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@end
@implementation DetailsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Initiating Labels and UIImage in the viewDidLoad.
    self.nameLabel.text = self.equipment.name;
    self.calibreLabel.text = self.equipment.calibre;
    self.ammoLabel.text = self.equipment.ammo;
    self.rangeLabel.text = self.equipment.range;
    self.pic.image = self.equipment.pic;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
