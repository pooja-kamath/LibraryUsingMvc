//
//  SBBookDetailViewController.h
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookListViewController.h"
@protocol bookDetailDelegate
-(NSArray *)getBookDetailwithindex:(NSIndexPath *)indexpath;
-(NSIndexPath *)getIndex;
@end

@interface SBBookDetailViewController : UIViewController
@property (assign) id delegate;
@property (assign) NSArray *detail;
@property (assign) SBBookListViewController *s;
@end
