//
//  applicationCellBrasoes.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 17/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "applicationCellBrasoes.h"


@implementation applicationCellBrasoes

@synthesize periodoBrasao ,sobreBrasao,imageBrasao ;

-(void)dealloc
{
	[periodoBrasao release];
	[sobreBrasao release];
	[imageBrasao release];
	[super dealloc];
}

@end
