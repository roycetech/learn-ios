//
//  Car.h
//  ObjC_Syntax
//
//  Created by Royce on 11/06/2016.
//  Copyright © 2016 UPI Creations. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject {
  // Protected instance variables (not recommended)
}

@property (copy) NSString *model;

- (void)drive;

@end