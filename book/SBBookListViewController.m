//
//  SBBookListViewController.m
//  book
//
//  Created by Pooja Kamath on 12/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBBookListViewController.h"
#import "SBBookDetailViewController.h"
#import "SBBookManagerViewController.h"
@interface SBBookListViewController ()

@end
int indx;
@implementation SBBookListViewController
@synthesize delegate;
@synthesize booklist;
@synthesize indexValue;
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
    booklist=[delegate getCellText];
    
    
    

    
}
-(void)issue:(UIButton*)sender
{
    
    [delegate didIssueAtIndex:indexValue];
}
-(void)returns:(UIButton*)sender
{
    [delegate didReturnAtIndex:indexValue];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]];
    
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier] ;
    }
    
    cell.textLabel.text =[booklist objectAtIndex:indexPath.row];
    
  
    
     UIColor *clr = [UIColor colorWithRed:0.76f green:0.81f blue:0.87f alpha:1];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(175.0f, 10.0f, 65.0f, 25.0f);
    button.backgroundColor=clr;
    [button setTitle:@"Issue" forState:UIControlStateNormal];
    
    
   [button addTarget:self action:@selector(issue:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:button ];
    
    UIButton *details = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    details.frame = CGRectMake(250.0f, 10.0f, 60.0f, 25.0f);
    details.backgroundColor=clr;
    [details setTitle:@"Return" forState:UIControlStateNormal];
    
    
   [details addTarget:self action:@selector(returns:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:details ];

    table.backgroundColor = background;
    cell.backgroundColor=[UIColor clearColor];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [booklist count];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexValue=indexPath.row;
    SBBookDetailViewController *detailView=[[SBBookDetailViewController alloc]initWithNibName:@"SBBookDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailView animated:YES];
    NSLog(@" did select %d",indexValue);
    
}


@end
