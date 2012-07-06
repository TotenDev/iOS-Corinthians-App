//
//  flipViewController.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 19/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

	// This protocol is used to tell the root view to flip between views
@protocol MyFlipControllerDelegate <NSObject>

@required
-(void)toggleView:(id)sender;
@end

	//importar outros views
@class aboutViewController ;
@class FirstViewController ;


@interface flipViewController : UIViewController <MyFlipControllerDelegate> {

	aboutViewController * aboutView ; 
	FirstViewController * contadorView ;
	
	
}

@property(nonatomic,retain) aboutViewController  * aboutView ; 
@property(nonatomic,retain) FirstViewController  *	contadorView ;

@end
