//
//  legendasViewController.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 25/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "legendasViewController.h"


@implementation legendasViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Legendas" ;
	
	imageScrollView = [[UIScrollView alloc] initWithFrame:[[self view] bounds]];
//    [imageScrollView setBackgroundColor:[UIColor grayColor]];
    [imageScrollView setDelegate:self];
//    [imageScrollView setBouncesZoom:NO];
    [[self view] addSubview:imageScrollView];
		// add touch-sensitive image view to the scroll view
		
    TapDetectingImageView *imageView = [[TapDetectingImageView alloc] initWithImage:[UIImage imageNamed:@"legendas.png"]];
    [imageView setDelegate:self];
    [imageView setTag:100];
//	imageView.contentMode = UIViewContentModeScaleToFill ;
    [imageScrollView setContentSize:[imageView frame].size];
    [imageScrollView addSubview:imageView];
    [imageView release];
    
		// calculate minimum scale to perfectly fit image width, and begin at that scale
    float minimumScale = [imageScrollView frame].size.width  / [imageView frame].size.width;
    [imageScrollView setMinimumZoomScale:minimumScale];
    [imageScrollView setZoomScale:minimumScale];

}


#pragma mark UIScrollViewDelegate methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [imageScrollView viewWithTag:100];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
