//
//  CDMapItemOverlay.m
//  MapOverlayTest
//
//  Created by NSS MAC2 on 10/18/16.
//  Copyright © 2016 Carlos Duclos. All rights reserved.
//

#import "CDMapItemOverlay.h"
#import "CDMapItem.h"

@implementation CDMapItemOverlay

@synthesize coordinate;
@synthesize boundingMapRect;

- (instancetype)initWithItem:(CDMapItem *)item {
    self = [super init];
    
    if (self) {
        boundingMapRect = item.overlayBoundingMapRect;
        coordinate = item.midCoordinate;
    }
    
    return self;
}

@end
