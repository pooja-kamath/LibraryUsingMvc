//
//  SBBookListViewController.h
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol listViewDelegate

//delegate method to get the array of book names
-(NSArray *)getCellText;

//delegate method to issue a book
-(void)didIssueAtIndex:(NSIndexPath *)index;

//delegate method to return a book
-(void)didReturnAtIndex:(NSIndexPath *)index;

//delegate method to display a selected row information
-(void)didSelectRow:(NSIndexPath *)indxpath;

@end

@interface SBBookListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (assign) id delegate;
//temporary array to store the values passed from getcelltext method
@property (assign) NSArray *booklist;

//button to issue a book

-(void)issue:(UIButton*)sender;

//button to return a book
-(void)returns:(UIButton*)sender;

//method called when uibutton is pressed
-(void)add;

@end
