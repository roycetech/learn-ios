//
//  Arrays.m
//  ObjC_Syntax
//
//  Created by Royce on 10/06/2016.
//  Copyright © 2016 UPI Creations. All rights reserved.
//

#import <Foundation/Foundation.h>


void funcArray() {

  NSLog(@"Hello array");

  // 1. Array enumeration.
  NSArray *array = @[@1, @2, @3];
  [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    NSLog(@"Square of %@ is %d", obj, [obj intValue] * [obj intValue]);
  }];
  
  
  // 2. For each loop
  NSArray *numbers = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
  for (NSNumber *num in numbers) {
    NSLog(@"%@", num);
  }
  
}