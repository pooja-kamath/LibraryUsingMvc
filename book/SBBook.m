//
//  SBBook.m
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBBook.h"

@implementation SBBook

@synthesize title;
@synthesize bookId;
@synthesize author;
@synthesize issued;
- (void)dealloc
{
   [ title release];
    [ bookId release];
    [ author release];
   [ issued release];
    [super dealloc];
}
@end
