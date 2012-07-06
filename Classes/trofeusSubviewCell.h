//
//  trofeusSubviewCell.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 30/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "trofeusApplicationCell.h"

@interface trofeusSubviewCell : trofeusApplicationCell {
	
	IBOutlet UIImageView* tituloImageOut ;
	IBOutlet UILabel* nomeTituloOut ;
	IBOutlet UILabel* detalheTituloOut ;

}

@end
