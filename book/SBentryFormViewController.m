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
@property (weak, nonatomic) IBOutlet UITextField *bookIdText;
@property (weak, nonatomic) IBOutlet UITextField *authorText;

@property (weak, nonatomic) IBOutlet UITextField *titleText;
@property (weak, nonatomic) IBOutlet UITextField *issuedText;
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
    
    SBBookManagerViewController *sharedManager = [SBBookManagerViewController sharedManager];
    delegate=sharedManager;
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]];
    
    self.view.backgroundColor = background;
    

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addDetailButton:(id)sender {
  [delegate addBookwithTitle:_titleText.text withId:_bookIdText.text withAuthor:_authorText.text andIssued:_issuedText.text];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [self.navigationController popViewControllerAnimated:NO];
}
@end
