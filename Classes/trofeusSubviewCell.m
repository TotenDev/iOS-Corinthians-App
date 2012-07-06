//
//  trofeusSubviewCell.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 30/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "trofeusSubviewCell.h"


@implementation trofeusSubviewCell

-(void)setTituloImage:(UIImage *)newTituloImage {
	[super setTituloImage:(UIImage *)newTituloImage];
	tituloImageOut.image = newTituloImage ;
}

-(void)setNomeTitulo:(NSString *)newNomeTitulo {
	[super setNomeTitulo:(NSString *)newNomeTitulo];
	nomeTituloOut.text = newNomeTitulo ;
}

-(void)setDetalheTitulo:(NSString *)newDetalheTitulo {
	[super setDetalheTitulo:(NSString *)newDetalheTitulo];
	detalheTituloOut.text = newDetalheTitulo ;
}

- (void)dealloc {
    [super dealloc];
}


@end
