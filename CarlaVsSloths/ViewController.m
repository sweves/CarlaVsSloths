//
//  ViewController.m
//  CarlaVsSloths
//
//  Created by Sarah Wever on 3/6/13.
//  Copyright (c) 2013 Sarah Wever. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize fingerBegin, fingerLocation;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.multipleTouchEnabled = YES;
    
    sloth = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sloth.png"]];
    
    CGSize slothSize = [sloth.image size];
    
    [sloth setFrame:CGRectMake(100.0, 100.0, slothSize.width, slothSize.height)];
    
    [self.view addSubview:sloth];
    
}

- (void)viewDidUnload
{
    [self setFingerBegin:nil];
    [self setFingerLocation:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Loop over each touch and log
    for (UITouch* t in touches)
    {
        CGPoint touchLocation;
        
        touchLocation = [t locationInView:self.view];
        
        NSLog(@"touchedBegan at: %f, %f",touchLocation.x, touchLocation.y);
        NSString* touchMessage=[[NSString alloc] initWithFormat:@"x: %f y:%f", touchLocation.x, touchLocation.y];
        [fingerBegin setText:touchMessage];
        
        CGPoint center = sloth.center;
        center.x = touchLocation.x;
        center.y = touchLocation.y;
        sloth.center = center;
        
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Loop over each touch and log
    for (UITouch* t in touches)
    {
        CGPoint touchLocation;
        
        touchLocation = [t locationInView:self.view];
        
        NSLog(@"touchesMoved at: %f, %f",touchLocation.x, touchLocation.y);
        NSLog(@"touchedBegan at: %f, %f",touchLocation.x, touchLocation.y);
        NSString* touchMessage=[[NSString alloc] initWithFormat:@"x: %f y:%f", touchLocation.x, touchLocation.y];
        [fingerLocation setText:touchMessage];
        
        CGPoint center = sloth.center;
        center.x = touchLocation.x;
        center.y = touchLocation.y;
        sloth.center = center;
        
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Loop over each touch and log
    for (UITouch* t in touches)
    {
        CGPoint touchLocation;
        
        touchLocation = [t locationInView:self.view];
        
        NSLog(@"touchesEnded at: %f, %f",touchLocation.x, touchLocation.y);
        
    }
}

@end
