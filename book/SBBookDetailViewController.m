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
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *bookIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *issuedLabel;

- (IBAction)okButton:(id)sender;
@end

@implementation SBBookDetailViewController
@synthesize delegate;
@synthesize detail;
@synthesize s;
- (id)init
{
    self = [super init];
    if (self) {
        
      
        

    }
    return self;
}
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
    
    
      SBBookListViewController *s=[[SBBookListViewController alloc]init];
   detail=[delegate getBookDetailwithindex:s.indexValue];
    NSLog(@" innndx %d",s.indexValue );
    
    _titleLabel.text=[detail objectAtIndex:0];
    _bookIdLabel.text=[detail objectAtIndex:1];
    _authorLabel.text=[detail objectAtIndex:2];
    _issuedLabel.text=[detail objectAtIndex:3];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]];
    
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
@end
