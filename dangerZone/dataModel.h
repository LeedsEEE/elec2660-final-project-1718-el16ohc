//
//  dataModel.h
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "equipment.h"

@interface dataModel : NSObject
// Defines array for the data model.
@property (strong, nonatomic) NSMutableArray *equipment;
@end
