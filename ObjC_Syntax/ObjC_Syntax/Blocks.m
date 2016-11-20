//
//  Blocks.m
//  ObjC_Syntax
//
//  Created by Royce on 10/06/2016.
//  Copyright © 2016 UPI Creations. All rights reserved.
//

#import <Foundation/Foundation.h>

void blocks() {
  
  // Declare an uninitialized block.
  void (^block1)(void);

    
  // Declare and initialize a block, square functionality.
  float (^block2)(float) = ^(float x) {
    return x * x;
  };
    
  
  float (^square)(float) = ^(float x) {
    return x * x;
  };


  NSLog(@"%f", block2(4));
  NSLog(@"%f", square(2));
  
}

//Simple Block declaration syntax
//returntype (^blockName)(argumentType);
//Simple block implementation
//
//returntype (^blockName)(argumentType)= ^{
//};
//Here is a simple example
//void (^simpleBlock)(void) = ^{
//  NSLog(@"This is a block");
//};
