//
//  SBBookManagerViewController.h
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBentryFormViewController.h"
#import "SBBookListViewController.h"
#import "SBBookDetailViewController.h"
@interface SBBookManagerViewController : UIViewController <entryFormDelegate,listViewDelegate,bookDetailDelegate>
+ (id)sharedManager;
@property (assign)int count;
@property (retain) NSIndexPath *index1;
@end
