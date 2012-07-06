//
//  TrofeusViewController.h
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 30/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class trofeusApplicationCell ;

@interface TrofeusViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{

	IBOutlet UITableView* trofeusTable ;
	trofeusApplicationCell* tmpCell ;
	
}

@property(nonatomic,assign)IBOutlet trofeusApplicationCell* tmpCell ;

@end
