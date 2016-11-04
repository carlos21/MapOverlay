//
//  PVParkOverlay.h
//  MapOverlayTest
//
//  Created by NSS MAC2 on 10/14/16.
//  Copyright © 2016 Carlos Duclos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class PVPark;

@interface PVParkOverlay : NSObject <MKOverlay>

- (instancetype)initWithPark:(PVPark *)park;

@end
