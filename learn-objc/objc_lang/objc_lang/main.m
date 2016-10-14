//
//  main.m
//  objc_lang
//
//  Created by Royce on 14/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        // Print a string
        NSLog(@"Hello, World!");
        
        
        // Initialize a string variable
        NSString *name = @"Royce";
        
        
        // Print using a place holder
        NSLog(@"Hello %@", name);

        
        // Print using a place holder multiple times
        NSLog(@"Hello %@ %@", name, name);


        // Initialize an integer
        NSNumber *age = @10;
        
        
        // Initialize an array
        NSArray *array = @[@"One", @"Two", @"Three"];
        
        
        // Access an element of an array
        NSLog(@"First element: %@", array[0]);
        
        // Initialize a dictionary
        NSDictionary *person = @{@"First Name": @"Eric"};
        
        
        // Print an element of a dictionary
        NSLog(@"Hello %@", person[@"First Name"]);
        
        
        // Print unsigned integer
        NSString *city = @"Ice World";
        NSUInteger cityLength = [city length];
        NSLog(@"City has %lu characters", cityLength);
        
        
        // Appending Strings
        NSString *firstName = @"Hello I am Royce!";
        NSString *lastName = @"Doe";
        NSString *fullName = [firstName stringByAppendingString:lastName];
        NSLog(@"%@", fullName);
        
        
        NSString *fName = @"John";
        NSString *lName = @"Doe";
        NSString *fullName2 = [[fName stringByAppendingString:@" "] stringByAppendingString:lName];
        NSLog(@"%@", fullName2);
        
        
        // Missing if-then-else and case statements.
        
        
        // Enum definition
        typedef NS_ENUM(NSInteger, DayOfWeek) {
            DayOfWeekMonday = 1,
            DayOfWeekTuesday = 2,
            DayOfWeekWednesday = 3,
            DayOfWeekThursday = 4,
            DayOfWeekFriday = 5,
            DayOfWeekSaturday = 6,
            DayOfWeekSunday = 7
        };
        
        
        // for loop
        NSArray *newHats = @[@"Cowboy", @"Conductor", @"Baseball"];
        
        for (NSString *hat in newHats) {
            NSLog(@"Trying on new %@ hat", hat);
            if([mrHiggie tryOnHat:hat]) {
                NSLog(@"Mr. Higgie loves it");
            } else {
                NSLog(@"Mr. Higgie hates it");
            }
        }
        

        // Enumerating dictionary
        NSDictionary *funnyWords = @{
                                     @"Schadenfreude": @"pleasure derived by someone from another person's misfortune.",
                                     @"Portmanteau": @"consisting of or combining two or more separable aspects or qualities",
                                     @"Penultimate": @"second to the last"
                                     };
        for (NSString *word in funnyWords) {
            NSString *definition = funnyWords[word];
            NSLog(@"%@ is defined as %@", word, definition);
        }
        
        
        // Blocks
        void (^myFirstBlock)() = ^{
            NSLog(@"Hello");
        };
        myFirstBlock();
        
        
        // Bock with parameter
        void (^mySecondBlock)(NSString *) = ^(NSString *name){
            NSLog(@"Hello %@ from inside the block", name);
        };
        mySecondBlock(@"Hello");
        mySecondBlock(@"World");
        

        // Passing a block directly as message
        NSArray *newHats2 = @[@"Cowboy", @"Conductor", @"Baseball",
                             @"Beanie", @"Beret", @"Fez"];
        [newHats2 enumerateObjectsUsingBlock:^(NSString *hat, NSUInteger index, BOOL *stop){
            NSLog(@"Trying on hat %@", hat);
        }];
        
        
        // Defining a class interface
        @interface IphoneGramps : NSObject
        @property NSString *phoneName;
        @property NSString *modelNumber;
        @end
        

        #import "IphoneGramps.h"
        @implementation IphoneGramps
        @end
        
        
        
        
    }
    return 0;
}
