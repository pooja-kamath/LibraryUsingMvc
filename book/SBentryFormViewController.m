//
//  SBentryFormViewController.m
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBentryFormViewController.h"
#import "SBBookManagerViewController.h"
@interface SBentryFormViewController ()

//text field that fetch the values
@property (strong, nonatomic) IBOutlet UITextField *bookIdText;
@property (strong, nonatomic) IBOutlet UITextField *authorText;

@property (strong, nonatomic) IBOutlet UITextField *titleText;
@property (strong, nonatomic) IBOutlet UITextField *issuedText;

//button that calls the delegate method addbookWithTitle
- (IBAction)addDetailButton:(id)sender;

@end

@implementation SBentryFormViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //initialise delegate
    SBBookManagerViewController *sharedManager = [SBBookManagerViewController sharedManager];
    delegate=sharedManager;
    
    //set background image
    UIColor *background = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]]autorelease];
    self.view.backgroundColor = background;
   
    [_bookIdText addTarget:self action:@selector(textFieldDidChange)forControlEvents:UIControlEventEditingChanged];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addDetailButton:(id)sender {
    
    //check if any of the fields entered is empty and display alert
    NSString *bid=_bookIdText.text;
    if([_titleText.text isEqual:@""] || [_bookIdText.text isEqual:@""] || [_authorText.text isEqual:@""] || [_issuedText.text isEqual:@""])
    {
        NSLog(@"enter valid input");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"enter valid input" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];

    }
    else if(bid.length>4)
    {
        NSLog(@"enter valid input");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"enter valid input for book id \n number of characters should not exceed 4" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];
        
    }
   else
    {
        
        //call the delegate method to create a object of book and enter it into array
        [delegate addBookwithTitle:_titleText.text withId:_bookIdText.text withAuthor:_authorText.text andIssued:_issuedText.text];
        
        //alert that book has been added
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
       [alert show];
        [alert release];
        //push the list view
        SBBookListViewController *list=[[[SBBookListViewController alloc]initWithNibName:@"SBBookListViewController" bundle:nil]autorelease];
        [self.navigationController pushViewController:list animated:YES];
               
    }
}

-(void)textFieldDidChange
{
    NSString *bid=_bookIdText.text;
   if(bid.length>4)
    {
        NSLog(@"enter valid input");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"enter valid input for book id \n number of characters should not exceed 4" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];
        
    }


}
- (void)dealloc
{
       [_bookIdText release];
    [_authorText release];
    [_titleText release];
    [_issuedText release];
    [super dealloc];
}
@end
