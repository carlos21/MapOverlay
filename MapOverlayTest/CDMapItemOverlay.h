//
//  CDMapItemOverlay.h
//  MapOverlayTest
//
//  Created by NSS MAC2 on 10/18/16.
//  Copyright © 2016 Carlos Duclos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class CDMapItem;

@interface CDMapItemOverlay : NSObject <MKOverlay>

- (instancetype)initWithItem:(CDMapItem *)item;

@end
