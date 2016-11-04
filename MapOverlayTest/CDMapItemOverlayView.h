//
//  CDMapItemOverlayView.h
//  MapOverlayTest
//
//  Created by NSS MAC2 on 10/18/16.
//  Copyright © 2016 Carlos Duclos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CDMapItemOverlayView : MKOverlayRenderer

- (instancetype) initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage *)overlayImage;

@end
