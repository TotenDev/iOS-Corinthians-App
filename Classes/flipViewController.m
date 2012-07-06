//
//  flipViewController.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 19/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "flipViewController.h"
#import "aboutViewController.h"
#import "FirstViewController.h"

@implementation flipViewController

@synthesize contadorView , aboutView ; 


-(void)loadAboutViewController {
	aboutViewController * MyView = [[aboutViewController alloc]initWithNibName:@"aboutViewController" bundle:nil];
	self.aboutView = MyView ;
	self.aboutView.flipDelegate = self ; 
}

-(void)loadFirstViewController {
	FirstViewController * MyView = [[FirstViewController alloc]initWithNibName:@"firstViewController" bundle:nil];
	self.contadorView = MyView ; 
	self.contadorView.flipDelegate = self ;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack ;
	self.title = @"Home" ; 
	self.view.backgroundColor = [UIColor purpleColor];
	[self loadFirstViewController];
	[self.view addSubview:contadorView.view];
}


	// This method is called when either of the subviews send a delegate message to us.
	// It flips the displayed view from the whoever sent the message to the other.
- (void)toggleView:(id)sender {
	if (aboutView == nil) {
		[self loadAboutViewController];
	}
	
	UIView *contador = contadorView.view;
	UIView *about = aboutView.view;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1];
	[UIView setAnimationTransition:((contadorView == sender) ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft) forView:self.view cache:YES];
	
	if (contadorView == sender) {
		[aboutView viewWillAppear:YES];
		[contadorView viewWillDisappear:YES];
		[contador removeFromSuperview];
		[self.view addSubview:about];
		[contadorView viewDidDisappear:YES];
		[aboutView viewDidAppear:YES];
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDelay:0.5];
		self.title = @"About" ;
		[UIView commitAnimations];
		
	} else {
		[contadorView viewWillAppear:YES];
		[aboutView viewWillDisappear:YES];
		[about removeFromSuperview];
		[self.view addSubview:contador];
		[aboutView viewDidDisappear:YES];
		[contadorView viewDidAppear:YES];
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDelay:0.5];
		self.title = @"Home" ;
		[UIView commitAnimations];
	}
	[UIView commitAnimations];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
		// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
	
	[contadorView release];
	[aboutView release];
}


@end
