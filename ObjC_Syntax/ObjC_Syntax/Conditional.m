//
//  Conditional.m
//  ObjC_Syntax
//
//  Created by Royce on 10/06/2016.
//  Copyright © 2016 UPI Creations. All rights reserved.
//

#import <Foundation/Foundation.h>

void conditional() {
  NSLog(@"Conditionals");
  
  // Non-boolean as boolean expression
  if (1) {
    NSLog(@"Boolean expression can be non boolean expressions");
  }

  
  // Switch statement
  int shape = 0;
  float area;
  float length;
  switch (shape) {
   
    case 0:
      length = 3;
      area = length * length;
      NSLog(@"Square area is %f", area);
      break;
      
    case 1:{
      float base = 16;
      float height = 24;
      area = base * height;
      NSLog(@"Parallelogram area is %f", area);
      break;
      
    } default:{
      area = -999;
      NSLog(@"No Shape Specified");
      break;
    }
      
  }
  
}