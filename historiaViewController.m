//
//  historiaViewController.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 09/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "historiaViewController.h"
#import "idolosViewController.h"
#import "brasoesViewController.h"
#import "TrofeusViewController.h"

@implementation historiaViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack ;
	self.title = @"Historia" ;
	
}

-(IBAction)brasoesButton {
	
//	UIImagePickerController * picker = [[UIImagePickerController alloc] init];
//	picker.delegate = self;
//	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//	[self presentModalViewController:picker animated:YES];
	
	brasoesViewController* myView =[[brasoesViewController alloc] initWithNibName:@"brasoesViewController" bundle:nil];
	[self.navigationController pushViewController:myView animated:YES];
	[myView release];

}

-(IBAction)idolosButton {
	idolosViewController* myView = [[idolosViewController alloc] initWithNibName:@"idolosViewController" bundle:nil];
	[self.navigationController pushViewController:myView animated:YES];
	[myView release];
}

-(IBAction)camisasButton {
	
}

-(IBAction)titulosButton {
	TrofeusViewController* myView = [[TrofeusViewController alloc]initWithNibName:@"TrofeusViewController" bundle:nil];
	[self.navigationController pushViewController:myView animated:YES];
	[myView release];
	
}

-(IBAction) historiaButton {
	
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
