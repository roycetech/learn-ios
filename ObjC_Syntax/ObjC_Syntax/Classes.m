//
//  Classes.m
//  ObjC_Syntax
//
//  Created by Royce on 10/06/2016.
//  Copyright © 2016 UPI Creations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Project : NSObject
  @property(strong) NSString *name;
  -(void)generateReport;
  -(void)generateReportAndAddThisString:(NSString *)string
                   andThenAddThisDate:(NSDate *)date;
@end


@interface Square : NSObject
  @property(readonly) CGFloat *length;
@end


void classes() {
  NSLog(@"Classes...\n");
  
  Car *toyota = [[Car alloc] init];
  
  [toyota setModel:@"Toyota Corolla"];
  NSLog(@"Created a %@", [toyota model]);
  
  toyota.model = @"Toyota Camry";
  NSLog(@"Changed the car to a %@", toyota.model);
  
  [toyota drive];
}


//void test() {
//  Project *project;
//  [project ];
//}
