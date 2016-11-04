//
//  ViewController.m
//  MapOverlayTest
//
//  Created by NSS MAC2 on 10/14/16.
//  Copyright © 2016 Carlos Duclos. All rights reserved.
//

#import "ViewController.h"
#import "PVPark.h"
#import "PVParkOverlay.h"
#import "PVParkOverlayView.h"

#import "CDMapItem.h"
#import "CDMapItemOverlay.h"
#import "CDMapItemOverlayView.h"

@interface ViewController ()
    @property (nonatomic, strong) PVPark *park;
    @property (nonatomic, strong) CDMapItem *item;
    @property (nonatomic, strong) CDMapItem *itemHands;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.park = [[PVPark alloc] initWithFilename:@"MagicMountain"];
    self.item = [[CDMapItem alloc] initWithFilename:@"Mario"];
    self.itemHands = [[CDMapItem alloc] initWithFilename:@"Hands"];
    
    CLLocationDegrees latDelta = self.itemHands.overlayTopLeftCoordinate.latitude - self.itemHands.overlayBottomRightCoordinate.latitude;
    MKCoordinateSpan span = MKCoordinateSpanMake(fabs(latDelta), 0.0);
    MKCoordinateRegion region = MKCoordinateRegionMake(self.itemHands.midCoordinate, span);
    self.mapView.region = region;
    
    [self addOverlay];
    
    CDMapItemOverlay *overlay = [[CDMapItemOverlay alloc] initWithItem:self.itemHands];
    [self.mapView addOverlay:overlay];
    
    
    
    NSArray *arrayPoints = @[@"{34.4248,-118.5971}", @"{34.4311,-118.6012}", @"{34.4311,-118.5912}", @"{34.4194,-118.6012}", @"{34.4313,-118.59890}", @"{34.4274,-118.60246}", @"{34.4268,-118.60181}", @"{34.4202,-118.6004}"];
    
    for (NSString *str in arrayPoints) {
        CGPoint p = CGPointFromString(str);
        
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = CLLocationCoordinate2DMake(p.x, p.y);
        point.title = @"mid";
        [self.mapView addAnnotation:point];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)mapTypeChanged:(id)sender {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        
        case 1:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        
        case 2:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        
        default:
            break;
    }
}

- (void)addOverlay {
    PVParkOverlay *overlay = [[PVParkOverlay alloc] initWithPark:self.park];
    [self.mapView addOverlay:overlay];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:PVParkOverlay.class]) {
        UIImage *magicMountainImage = [UIImage imageNamed:@"overlay_park"];
        PVParkOverlayView *overlayView = [[PVParkOverlayView alloc] initWithOverlay:overlay overlayImage:magicMountainImage];
        return overlayView;
    } else if ([overlay isKindOfClass:CDMapItemOverlay.class]) {
        UIImage *marioImage = [UIImage imageNamed:@"manos"];
        CDMapItemOverlayView *overlayView = [[CDMapItemOverlayView alloc] initWithOverlay:overlay overlayImage:marioImage];
        return overlayView;
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"regionDidChangeAnimated");
    NSLog(@"latitude: %f", mapView.centerCoordinate.latitude);
    NSLog(@"longitude: %f", mapView.centerCoordinate.longitude);
}

@end
