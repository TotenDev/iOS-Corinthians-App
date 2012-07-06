//
//  idolosSubviewBasedApplicationCell.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 13/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "idolosSubviewBasedApplicationCell.h"


@implementation idolosSubviewBasedApplicationCell

//- (void)setBackgroundColor:(UIColor *)backgroundColor
//{
//    [super setBackgroundColor:backgroundColor];
//	apelidoIdoloLabel.backgroundColor = backgroundColor ;
//	numeroCamisaLabel.backgroundColor = backgroundColor ;
//	backgroundColor = [UIColor whiteColor];
//}

-(void)setApelidoIdoloString:(NSString *)newApelidoIdoloString 
{
	[super setApelidoIdoloString:newApelidoIdoloString];
	apelidoIdoloLabel.text = newApelidoIdoloString ;
}

-(void)setPeriodoJogadoString:(NSString *)newPeriodoJogadoString
{
	[super setPeriodoJogadoString:(NSString *)newPeriodoJogadoString];
	periodoJogadoLabel.text = newPeriodoJogadoString ;
}

-(void)setNumeroCamisaString:(NSString *)newNumeroCamisaString
{
	[super setNumeroCamisaString:(NSString *)newNumeroCamisaString];
	numeroCamisaLabel.text = newNumeroCamisaString ; 
}

-(void)setImageIdolo:(UIImage *)newImageIdolo
{
	[super setImageIdolo:(UIImage *)newImageIdolo];
	imagemIdolo.image = newImageIdolo ;
}

-(void)setBandeiraIdolo:(UIImage *)newBandeiraIdolo 
{
	[super setBandeiraIdolo:(UIImage *)newBandeiraIdolo];
	bandeiraImage.image = newBandeiraIdolo ;
}

- (void)dealloc {
	[apelidoIdoloLabel release];
	[numeroCamisaLabel release];
	[periodoJogadoLabel release];
	[imagemIdolo release];
	[bandeiraImage release];
	[super dealloc];

}


@end
