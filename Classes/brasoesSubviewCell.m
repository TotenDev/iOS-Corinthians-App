//
//  brasoesSubviewCell.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 17/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "brasoesSubviewCell.h"


@implementation brasoesSubviewCell

-(void)setSobreBrasao:(NSString *)newSobreBrasao
{
	[super setSobreBrasao:newSobreBrasao];
	sobreBrasaoLabel.text = newSobreBrasao ;
}

-(void)setPeriodoBrasao:(NSString *)newPeriodoBrasao
{
	[super setPeriodoBrasao:newPeriodoBrasao];
	periodoBrasaoLabel.text = newPeriodoBrasao;
}

-(void)setImageBrasao:(UIImage *)newImageBrasao
{
	[super setImageBrasao:newImageBrasao];
	imageBrasaoImage.image = newImageBrasao ;
}


- (void)dealloc {
	[periodoBrasaoLabel release];
	[sobreBrasaoLabel	release];
	[imageBrasaoImage release];
	[super dealloc];
}


@end
