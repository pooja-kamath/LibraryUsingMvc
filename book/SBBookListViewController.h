//
//  SBBookListViewController.h
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol listViewDelegate

-(NSArray *)getCellText;
-(void)didIssueAtIndex:(int)index;
-(void)didReturnAtIndex:(int)index;

@end
@interface SBBookListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property id delegate;
@property NSArray *booklist;
@property int indexValue;
-(void)issue:(UIButton*)sender;
-(void)returns:(UIButton*)sender;
@end
