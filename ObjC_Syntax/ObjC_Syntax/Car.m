//
//  Car.m
//  ObjC_Syntax
//
//  Created by Royce on 11/06/2016.
//  Copyright © 2016 UPI Creations. All rights reserved.
//

#import <Foundation/Foundation.h>

// Car.m
#import "Car.h"

@implementation Car {
  // Private instance variables
  double _odometer;
}

@synthesize model = _model;    // Optional for Xcode 4.4+

- (void)drive {
  NSLog(@"Driving a %@. Vrooooom!", self.model);
}

@end