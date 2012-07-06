//
//  applicationCellBrasoes.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 17/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface applicationCellBrasoes : UITableViewCell {
	
	NSString* periodoBrasao ;
	NSString* sobreBrasao ;
	UIImage* imageBrasao ;
}

@property(retain)NSString*periodoBrasao ;
@property(retain)NSString*sobreBrasao ;
@property(retain)UIImage*imageBrasao ;

@end
