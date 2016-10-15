//
//  ViewController.m
//  TryIOS
//
//  Created by Royce on 14/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Button Tapped!");
    self.view.alpha = ((double)arc4random() /  0x100000000);
    [sender removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];

}


@end
