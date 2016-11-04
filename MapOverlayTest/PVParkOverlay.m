//
//  PVParkOverlay.m
//  MapOverlayTest
//
//  Created by NSS MAC2 on 10/14/16.
//  Copyright © 2016 Carlos Duclos. All rights reserved.
//

#import "PVParkOverlay.h"
#import "PVPark.h"

@implementation PVParkOverlay

@synthesize coordinate;
@synthesize boundingMapRect;

- (instancetype)initWithPark:(PVPark *)park {
    self = [super init];
    
    if (self) {
        boundingMapRect = park.overlayBoundingMapRect;
        coordinate = park.midCoordinate;
    }
    
    return self;
}

@end
