//
//  idolosSubviewBasedApplicationCell.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 13/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationCell.h"


@interface idolosSubviewBasedApplicationCell : ApplicationCell {
	
	IBOutlet UIImageView* imagemIdolo ;
	IBOutlet UILabel* apelidoIdoloLabel ;
	IBOutlet UILabel* numeroCamisaLabel ;
	IBOutlet UILabel* periodoJogadoLabel ;
	IBOutlet UIImageView* bandeiraImage ; 
	
}

@end