//
//  DetailsViewController.h
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "equipment.h"

@interface DetailsViewController : UIViewController
// Outlets for all Labels and UIImageView.
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *calibreLabel;
@property (weak, nonatomic) IBOutlet UILabel *ammoLabel;
@property (weak, nonatomic) IBOutlet UILabel *rangeLabel;
@property (strong, nonatomic) equipment *equipment;
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@end
