//
//  aboutViewController.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 19/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "flipViewController.h"


@interface aboutViewController : UIViewController {

	id flipDelegate ;
	
}

@property (nonatomic,assign) id <MyFlipControllerDelegate> flipDelegate;
-(IBAction)voltarButton:(id)sender ;

@end
