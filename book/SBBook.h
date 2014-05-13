//
//  SBBook.h
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBBook : NSObject

//title of book
@property (retain) NSString *title;

//id of the book
@property (retain) NSString *bookId;
//author of the book
@property (retain) NSString *author;
//set to Yes if the book is issued or else set to No
@property(retain) NSString *issued;

@end
