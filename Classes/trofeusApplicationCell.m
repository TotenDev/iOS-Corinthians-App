//
//  trofeusApplicationCell.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 30/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "trofeusApplicationCell.h"


@implementation trofeusApplicationCell

@synthesize tituloImage , nomeTitulo ,detalheTitulo ;


- (void)dealloc {
	[tituloImage release];
	[nomeTitulo release];
	[detalheTitulo release];
    [super dealloc];
}


@end
