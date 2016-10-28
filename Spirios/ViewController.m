//
//  ViewController.m
//  Spirios
//
//  Created by Jeremy Slater on 10/27/16.
//  Copyright © 2016 Tokio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.client = spiro_client_new("169.254.133.92");
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:nil];
        CGRect bounds = touch.window.bounds;
        float x = location.x / bounds.size.width;
        float y = location.y / bounds.size.height;
        NSLog(@"move: %f, %f", x, y);
        spiro_client_send(self.client, x, y);
    }
}

@end
