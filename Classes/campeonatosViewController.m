//
//  campeonatosViewController.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 19/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "campeonatosViewController.h"
#import "tabelaJogos1.h"
#import "classificacaoViewController1.h"

@implementation campeonatosViewController


- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Campeonatos" ;
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack ;
}

-(IBAction)tabelaJogosButton1 {
	
	tabelaJogos1* myView = [[tabelaJogos1 alloc]initWithNibName:@"tabelaJogos1" bundle:nil];
	[self.navigationController pushViewController:myView animated:YES];
	[myView release];
	
}

-(IBAction)classificacaoButton1 {
	
	classificacaoViewController1* myView = [[classificacaoViewController1 alloc]initWithNibName:@"classificacaoViewController1" bundle:nil];
	[self.navigationController pushViewController:myView animated:YES];
	[myView release];
	
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
