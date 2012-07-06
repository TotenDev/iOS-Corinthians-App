//
//  ApplicationCell.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 13/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ApplicationCell.h"


@implementation ApplicationCell

@synthesize apelidoIdoloString , numeroCamisaString , imageIdolo ,periodoJogadoString,bandeiraIdolo ;

-(void)dealloc
{
	[periodoJogadoString release];
	[apelidoIdoloString release];
	[numeroCamisaString release];
	[imageIdolo release];
	[bandeiraIdolo release];
	[super dealloc];
}

@end
