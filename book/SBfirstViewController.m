//
//  SBfirstViewController.m
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBfirstViewController.h"
#import "SBentryFormViewController.h"
#import "SBBookListViewController.h"
@interface SBfirstViewController ()

- (IBAction)addButton:(id)sender;
- (IBAction)displayButton:(id)sender;
@end

@implementation SBfirstViewController

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
       UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]];
    
    self.view.backgroundColor = background;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButton:(id)sender {
    
    SBentryFormViewController *entryForm=[[SBentryFormViewController alloc]initWithNibName:@"SBentryFormViewController" bundle:nil];
    [self.navigationController pushViewController:entryForm animated:YES];
    
}

- (IBAction)displayButton:(id)sender {
    SBBookListViewController *listview=[[SBBookListViewController alloc]initWithNibName:@"SBBookListViewController" bundle:nil];
    [self.navigationController pushViewController:listview animated:YES];
}
@end
