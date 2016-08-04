//
//  KeyValueCoding.m
//  ObjC_Syntax
//
//  Created by Royce on 11/06/2016.
//  Copyright © 2016 UPI Creations. All rights reserved.
//

#import <Foundation/Foundation.h>

void keyValueCoding() {
  
  
  NSObject *object = @"Hello Kansas\n";
  [object setValue:@"Value for Hello" forKey:@"Annotation"];
  
  NSLog(@"%@", [object valueForKey:@"Annotation"]);
  
}