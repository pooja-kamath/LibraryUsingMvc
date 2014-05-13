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
-(NSArray *)getBookDetailwithindex:(int)indexpath;
@end

@interface SBBookDetailViewController : UIViewController
@property id delegate;
@property NSArray *detail;
@property SBBookListViewController *s;
@end
