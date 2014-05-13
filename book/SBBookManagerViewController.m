//
//  SBBookManagerViewController.m
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBBookManagerViewController.h"
#import "SBBook.h"
@interface SBBookManagerViewController ()

@end
NSMutableArray *bookArray;
@implementation SBBookManagerViewController
@synthesize count;

+ (id)sharedManager {
    static SBBookManagerViewController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
       bookArray=[[NSMutableArray alloc]init];
        
    });
    return sharedMyManager;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        count=0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addBookwithTitle:(NSString *)title withId:(NSString*)bid withAuthor:(NSString*)author andIssued:(NSString*)issued
{
    count++;
    NSLog(@"delegate is called");
    SBBook * book =[[SBBook alloc]init];
    book.title=title;
    book.bookId=bid;
    book.author=author;
    book.issued=issued;
    
    [bookArray addObject:book];
    NSLog(@"%@",title);
}
-(NSArray *)getCellText
{
    NSMutableArray  *bookList=[[NSMutableArray alloc]init];
    for(int i=0;i<count;i++)
    {
        NSString *bookNames=@"";
        SBBook *book1=[bookArray objectAtIndex:i];
        bookNames=book1.title;
       [bookList insertObject:bookNames atIndex:i];
        
    }
    return bookList;

    
}
-(NSArray *)getBookDetailwithindex:(int)indexpath
{
    NSLog(@"indx= %d",indexpath);
    SBBook *book=[bookArray objectAtIndex:indexpath];
    NSMutableArray *returnArray=[[NSMutableArray alloc]init];
   
    [returnArray insertObject:book.title atIndex:0];
    [returnArray insertObject:book.bookId atIndex:1];
    [returnArray insertObject:book.author atIndex:2];
    [returnArray insertObject:book.issued atIndex:3];
    return returnArray;
    
    
}
-(void)didIssueAtIndex:(int)index
{
    NSLog(@"in issue");
    SBBook *oldbook =[bookArray objectAtIndex:index];
    SBBook * newbook =[[SBBook alloc]init];
    newbook.title=oldbook.title;
   newbook.bookId=oldbook.bookId ;
    newbook.author=oldbook.author;
    newbook.issued=@"YES";
    [bookArray replaceObjectAtIndex:index withObject:newbook];
}
-(void)didReturnAtIndex:(int)index
{
    NSLog(@"in return");
    SBBook *oldbook =[bookArray objectAtIndex:index];
    SBBook * newbook =[[SBBook alloc]init];
    newbook.title=oldbook.title;
    newbook.bookId=oldbook.bookId ;
    newbook.author=oldbook.author;
    newbook.issued=@"NO";
    [bookArray replaceObjectAtIndex:index withObject:newbook];
}

@end
