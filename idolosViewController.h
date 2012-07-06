//
//  idolosViewController.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 13/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationCell.h"

@class ApplicationCell ;

@interface idolosViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>{

	IBOutlet UITableView*			idolosTableView ;
	IBOutlet UILabel*				nomePlayer ; 
	IBOutlet UILabel*				alturaPlayer ;
	IBOutlet UILabel*				bornPlayer ;
	IBOutlet UILabel*				jogosPlayer ;
	IBOutlet UILabel*				golsPlayer ; 
	IBOutlet UIImageView*			pePlayer ;
	IBOutlet UIImageView*			glPOS ;
	IBOutlet UIImageView*			zgPOS ;
	IBOutlet UIImageView*			ldPOS ;
	IBOutlet UIImageView*			lePOS ;
	IBOutlet UIImageView*			atPOS ;
	IBOutlet UIImageView*			vlPOS ;
	IBOutlet UIImageView*			mcPOS ;
	IBOutlet UIImageView*			mePOS ;
	IBOutlet UIImageView*			mdPOS ;
	IBOutlet UIImageView*			plPOS ;
	IBOutlet UIImageView*			fieldImage ;
	IBOutlet UIImageView*			imagePlayer ;
	IBOutlet UISegmentedControl*	tipoIdoloSegment ;
	IBOutlet UIImageView*			mundialTrofeuImage ;
	IBOutlet UIImageView*			brasileiroTrofeuImage ;
	IBOutlet UIImageView*			copaBrasilTrofeuImage ;
	IBOutlet UIImageView*			paulistaTrofeuImage ;
	IBOutlet UILabel*				mundialLabel ;
	IBOutlet UILabel*				brasileiroLabel ;
	IBOutlet UILabel*				copaBrasilLabel ;
	IBOutlet UILabel*				paulistaLabel ;
	ApplicationCell*				tmpCell ;
	NSArray*						megaArray ;
	NSArray*						superArray ;
	NSMutableArray*					goleirosArray ;
	NSMutableArray*					defesaArray ;
	NSMutableArray*					meioArray ;
	NSMutableArray*					ataqueArray ;
	NSMutableArray*					backUpArray ;
	}

@property(nonatomic,assign)IBOutlet ApplicationCell* tmpCell ;
//@property(nonatomic,retain)NSArray* megaArray ;
-(IBAction) segmentoAction:(id)sender ;
-(void)reloadTela ;
-(IBAction)legendaButton ;
@end
