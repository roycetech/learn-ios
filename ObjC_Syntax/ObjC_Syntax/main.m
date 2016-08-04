//
//  main.m
//  ObjC_Syntax
//
//  Created by Royce on 28/05/2016.
//  Copyright © 2016 UPI Creations. All rights reserved.
//

//#import <Foundation/Foundation.h>
//
//int main(int argc, const char * argv[]) {
// 
//  @autoreleasepool {
//    // insert code here...
//    NSLog(@"Hello, World!");
//  }
//  
//  NSArray *numbers = [@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
//  [numbers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//    NSLog(@"Square of : %@ is %f", obj, [obj floatValue] * [obj floatValue]);
//  }];
//  
//  return 0;
//}
//

#import <Foundation/Foundation.h>


void funcArray();
void conditional();
void blocks();
void keyValueCoding();
void classes();
void bitly();



int main()
{
  NSLog(@"Hello, World! \n");
  
  // Arrays.
  funcArray();
  conditional();
  blocks();
  //  keyValueCoding();
  classes();
  bitly();

 
  return 0;
}