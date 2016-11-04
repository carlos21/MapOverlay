//
//  ViewController.h
//  MapOverlayTest
//
//  Created by NSS MAC2 on 10/14/16.
//  Copyright © 2016 Carlos Duclos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

