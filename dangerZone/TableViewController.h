//
//  TableViewController.h
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataModel.h"
#import "DetailsViewController.h"
@interface TableViewController : UITableViewController
@property (strong, nonatomic) dataModel *data;
@end
