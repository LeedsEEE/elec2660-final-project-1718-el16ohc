//
//  dataModel.m
//  dangerZone
//
//  Created by Oliver Chard [el16ohc] on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "dataModel.h"

@implementation dataModel
- (instancetype)init
{
    self = [super init];
    if (self) {
// Properties for each object.
       self.equipment = [NSMutableArray array];
        equipment *glock = [[equipment alloc] init];
        glock.name = @"Glock";
        glock.calibre = @"9mm";
        glock.ammo = @"Ball";
        glock.range = @"50m";
        UIImage *glock_pic = [UIImage imageNamed:@"glock.jpg"];
        glock.pic = glock_pic;
       self.equipment = [NSMutableArray array];
        equipment *tt33 = [[equipment alloc] init];
        tt33.name = @"TT-33 Tokarev";
        tt33.calibre = @"7.62mm";
        tt33.ammo = @"Ball";
        tt33.range = @"50m";
        UIImage *tt33_pic = [UIImage imageNamed:@"tt-33_tokarev.jpg"];
        tt33.pic = tt33_pic;
       self.equipment = [NSMutableArray array];
        equipment *ugl = [[equipment alloc] init];
        ugl.name = @"UGL";
        ugl.calibre = @"40mm";
        ugl.ammo = @"HE";
        ugl.range = @"150m";
        UIImage *ugl_pic = [UIImage imageNamed:@"ugl.jpg"];
        ugl.pic = ugl_pic;
        self.equipment = [NSMutableArray array];
        equipment *sa80_a2 = [[equipment alloc] init];
        sa80_a2.name = @"SA80 A2";
        sa80_a2.calibre = @"5.56mm";
        sa80_a2.ammo = @"Ball Tracer";
        sa80_a2.range = @"300m";
        UIImage *sa80_a2_pic = [UIImage imageNamed:@"sa80_a2.jpg"];
        sa80_a2.pic = sa80_a2_pic;
        self.equipment = [NSMutableArray array];
        equipment *akfourtyseven = [[equipment alloc] init];
        akfourtyseven.name = @"AK-47";
        akfourtyseven.calibre = @"7.62mm";
        akfourtyseven.ammo = @"Ball Tracer";
        akfourtyseven.range = @"300m";
        UIImage *akfourtyseven_pic = [UIImage imageNamed:@"ak-47.jpg"];
        akfourtyseven.pic = akfourtyseven_pic;
        self.equipment = [NSMutableArray array];
        equipment *akm = [[equipment alloc] init];
        akm.name = @"AKM";
        akm.calibre = @"7.62mm";
        akm.ammo = @"Ball Tracer";
        akm.range = @"400m";
        UIImage *akm_pic = [UIImage imageNamed:@"akm.jpg"];
        akm.pic = akm_pic;
        self.equipment = [NSMutableArray array];
        equipment *rpklmg = [[equipment alloc] init];
        rpklmg.name = @"RPK LMG";
        rpklmg.calibre = @"7.62mm";
        rpklmg.ammo = @"Ball Tracer";
        rpklmg.range = @"600m";
        UIImage *rpklmg_pic = [UIImage imageNamed:@"rpk_lmg.jpg"];
        rpklmg.pic = rpklmg_pic;
        self.equipment = [NSMutableArray array];
        equipment *rpgeighteen = [[equipment alloc] init];
        rpgeighteen.name = @"RPG-18";
        rpgeighteen.calibre = @"64mm";
        rpgeighteen.ammo = @"HEAT";
        rpgeighteen.range = @"200m";
        UIImage *rpgeighteen_pic = [UIImage imageNamed:@"rpg-18.jpg"];
        rpgeighteen.pic = rpgeighteen_pic;
        self.equipment = [NSMutableArray array];
        equipment *rpgseven = [[equipment alloc] init];
        rpgseven.name = @"RPG-7";
        rpgseven.calibre = @"40mm";
        rpgseven.ammo = @"HE";
        rpgseven.range = @"920m";
        UIImage *rpgseven_pic = [UIImage imageNamed:@"rpg-7.jpg"];
        rpgseven.pic = rpgseven_pic;
        self.equipment = [NSMutableArray array];
        equipment *rpoa = [[equipment alloc] init];
        rpoa.name = @"RPO-A";
        rpoa.calibre = @"93mm";
        rpoa.ammo = @"Thermobaric";
        rpoa.range = @"1000m";
        UIImage *rpoa_pic = [UIImage imageNamed:@"rpo-a.jpg"];
        rpoa.pic = rpoa_pic;
        self.equipment = [NSMutableArray array];
        equipment *dragunov = [[equipment alloc] init];
        dragunov.name = @"Dragunov";
        dragunov.calibre = @"7.62mm";
        dragunov.ammo = @"Ball";
        dragunov.range = @"1300m";
        UIImage *dragonov_pic = [UIImage imageNamed:@"dragunov.jpg"];
        dragunov.pic = dragonov_pic;
        self.equipment = [NSMutableArray array];
        equipment *dshkhmg = [[equipment alloc] init];
        dshkhmg.name = @"DsHK HMG";
        dshkhmg.calibre = @"12.7mm";
        dshkhmg.ammo = @"Ball Tracer";
        dshkhmg.range = @"1500m";
        UIImage *dshkhmg_pic = [UIImage imageNamed:@"dshk_hmg.jpg"];
        dshkhmg.pic = dshkhmg_pic;
// Initiating each object.
        [self.equipment addObject:glock];
        [self.equipment addObject:tt33];
        [self.equipment addObject:ugl];
        [self.equipment addObject:akfourtyseven];
        [self.equipment addObject:sa80_a2];
        [self.equipment addObject:akm];
        [self.equipment addObject:rpklmg];
        [self.equipment addObject:rpgeighteen];
        [self.equipment addObject:rpgseven];
        [self.equipment addObject:rpoa];
        [self.equipment addObject:dragunov];
        [self.equipment addObject:dshkhmg];
    }
    return self;
}
@end
