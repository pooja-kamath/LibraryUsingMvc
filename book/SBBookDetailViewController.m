//
//  SBBookDetailViewController.m
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBBookDetailViewController.h"
#import "SBBookManagerViewController.h"
#import "SBBookListViewController.h"
@interface SBBookDetailViewController ()

@property (strong) IBOutlet UILabel *titleLabel;
@property (strong) IBOutlet UILabel *bookIdLabel;
@property (strong ) IBOutlet UILabel *authorLabel;
@property (strong )IBOutlet UILabel *issuedLabel;
@property (retain, nonatomic) IBOutlet UISwitch *swtch;

- (IBAction)okButton:(id)sender;
@end

@implementation SBBookDetailViewController
@synthesize delegate;
@synthesize detail;
@synthesize s;
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    
    NSIndexPath *indx=[delegate getIndex];
    
   detail=[delegate getBookDetailwithindex:indx];
    NSLog(@" innndx %ld",(long)indx.row);
    
    _titleLabel.text=[detail objectAtIndex:0];
    _bookIdLabel.text=[detail objectAtIndex:1];
    _authorLabel.text=[detail objectAtIndex:2];
    _issuedLabel.text=[detail objectAtIndex:3];
    
    UIColor *background = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]]autorelease];
    
    self.view.backgroundColor = background;
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)okButton:(id)sender {
    
   [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc
{
    [_titleLabel release];
    [_bookIdLabel release];
    [_authorLabel release];
    [_issuedLabel release];
    
    [s release];
    [_swtch release];
    [super dealloc];
}
@end
