//
//  FirstViewController.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 09/11/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "flipViewController.h"

@interface FirstViewController : UIViewController {
	
	IBOutlet UIImageView* centenaDia ;
	IBOutlet UIImageView* dezenaDia ;
	IBOutlet UIImageView* unidadeDia ;
	IBOutlet UIImageView* dezenaHora ;
	IBOutlet UIImageView* unidadeHora ;
	IBOutlet UIImageView* dezenaMin ;
	IBOutlet UIImageView* unidadeMin ;
	IBOutlet UIImageView* dezenaSeg ;
	IBOutlet UIImageView* unidadeSeg ;
	NSTimer* timerFake ;
	NSMutableArray* diaArray ;
	id flipDelegate ;
	NSNumber* myFireBoolean ;
	
}
-(void)calculoDosDias ;
- (IBAction)infoButtonPressed:(id)sender;
@property(nonatomic,retain) NSTimer*timerFake ;
//@property(nonatomic,retain)BOOL* 	myFireBoolean ;
@property (nonatomic,assign) id <MyFlipControllerDelegate> flipDelegate;


@end
