//
//  aboutViewController.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 19/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "aboutViewController.h"


@implementation aboutViewController

@synthesize flipDelegate ;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


-(IBAction)voltarButton:(id)sender {

	[self.flipDelegate toggleView:self];

}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
