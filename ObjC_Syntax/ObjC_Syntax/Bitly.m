//
//  Bitly.m
//  ObjC_Syntax
//
//  Created by Royce on 11/06/2016.
//  Copyright © 2016 UPI Creations. All rights reserved.
//

#import <Foundation/Foundation.h>

void bitly() {
  
  NSLog(@"Bitly start!");
  
  NSString *APILogin = @"roycetech";
  NSString *APIKey = @"R_efd0b955f4474cc9b8e68ed70da11b15";
  NSString *longURL = @"https://www.google.com";
  NSString *requestString = [NSString stringWithFormat:@"http://api-ssl.bitly.com/v3/shorten/version=2.0.1&longUrl=%@&login=%@&apiKey=%@&format=json", longURL,                             APILogin, APIKey];
  
  NSURL *requestURL = [NSURL URLWithString:requestString];
  NSURLSession *session = [NSURLSession sharedSession];
  
  [[session dataTaskWithURL:requestURL
          completionHandler:^(NSData *data,
                              NSURLResponse *response,
                              NSError *error) {
            
            NSError *e = nil;
            NSDictionary *bitlyJSON = [NSJSONSerialization
                                       JSONObjectWithData:data
                                       options:0
                                       error:&e];
            
            NSLog(@"JSON: %@: ", bitlyJSON);
            
            if(!error){
              NSDictionary *results = [bitlyJSON objectForKey:@"results"];
              NSDictionary *resultsForLongURL = [results objectForKey:longURL];
              NSString *shortURL = [resultsForLongURL objectForKey:@"shortUrl"];
              NSLog(@"shortURL = %@", shortURL);
            } else
              NSLog(@"There was an error parsing the JSON");
            
            
          }] resume];
  sleep(60);
  
}