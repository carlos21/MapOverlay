//
//  CDMapItemOverlayView.m
//  MapOverlayTest
//
//  Created by NSS MAC2 on 10/18/16.
//  Copyright © 2016 Carlos Duclos. All rights reserved.
//

#import "CDMapItemOverlayView.h"

@interface CDMapItemOverlayView ()

@property (nonatomic, strong) UIImage *overlayImage;

@end

@implementation CDMapItemOverlayView

- (instancetype)initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage *)overlayImage {
    self = [super initWithOverlay:overlay];
    if (self) {
        _overlayImage = overlayImage;
    }
    return self;
}

- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context {
    CGImageRef imageReference = self.overlayImage.CGImage;
    
    MKMapRect theMapRect = self.overlay.boundingMapRect;
    CGRect theRect = [self rectForMapRect:theMapRect];
    
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0.0, -theRect.size.height);
    CGContextDrawImage(context, theRect, imageReference);
}

@end
