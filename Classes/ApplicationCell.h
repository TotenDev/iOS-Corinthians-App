//
//  ApplicationCell.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 13/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ApplicationCell : UITableViewCell {
	NSString * apelidoIdoloString ;
	NSString * numeroCamisaString ;
	NSString* periodoJogadoString ;
	UIImage	* imageIdolo ;
	UIImage * bandeiraIdolo ;

}

@property(retain)NSString* apelidoIdoloString ;
@property(retain)NSString* periodoJogadoString ;
@property(retain)NSString* numeroCamisaString ;
@property(retain)UIImage* imageIdolo ;
@property(retain)UIImage* bandeiraIdolo ;

@end
