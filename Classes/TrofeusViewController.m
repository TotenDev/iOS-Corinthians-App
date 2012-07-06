//
//  TrofeusViewController.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 30/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TrofeusViewController.h"
#import "trofeusApplicationCell.h"

@implementation TrofeusViewController

@synthesize tmpCell ;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 20 ;
}

	// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath :(NSIndexPath *)indexPath 
{	
	static NSString *CellIdentifier = @"trofeusApplicationCell";
    
    trofeusApplicationCell *cell = (trofeusApplicationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle]loadNibNamed:@"trofeusSubviewCell" owner:self options:nil];
		cell = tmpCell ; 
		self.tmpCell = nil ;
		
	}
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
