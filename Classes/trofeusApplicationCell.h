//
//  trofeusApplicationCell.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 30/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface trofeusApplicationCell : UITableViewCell {

	
	NSString* detalheTitulo ;
	NSString* nomeTitulo ;
	UIImage  * tituloImage ;
}
@property(retain)NSString* detalheTitulo ;
@property(retain)NSString* nomeTitulo ;
@property(retain)UIImage* tituloImage ;

@end
