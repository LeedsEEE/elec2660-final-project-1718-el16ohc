//
//  equipment.h
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface equipment : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *calibre;
@property (nonatomic, strong) NSString *ammo;
@property (nonatomic, strong) NSString *range;
@property (nonatomic, strong) UIImage *pic;

@end
