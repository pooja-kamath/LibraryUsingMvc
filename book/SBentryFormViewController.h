//
//  SBentryFormViewController.h
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol entryFormDelegate
-(void)addBookwithTitle:(NSString *)title withId:(NSString*)bid withAuthor:(NSString*)author andIssued:(NSString *)issued;
@end
@interface SBentryFormViewController : UIViewController
@property id delegate;
@end
