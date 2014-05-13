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

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
int indx;
@implementation SBBookListViewController
@synthesize delegate;
@synthesize booklist;

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
    
    UIBarButtonItem* infoButton = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)]autorelease];
    self.navigationItem.rightBarButtonItem = infoButton;
    self.navigationItem.hidesBackButton = YES;

}
-(void)issue:(UIButton*)sender
{
    UIButton *senderButton = (UIButton *)sender;
    NSLog(@"current Row=%ld",(long)senderButton.tag);
      NSIndexPath *path = [NSIndexPath indexPathForRow:senderButton.tag inSection:0];
   
    [delegate didIssueAtIndex:path];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been issued" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
}
-(void)returns:(UIButton*)sender
{
    UIButton *senderButton = (UIButton *)sender;
    NSLog(@"current Row=%ld",(long)senderButton.tag);
    NSIndexPath *path = [NSIndexPath indexPathForRow:senderButton.tag inSection:0];
    
    [delegate didReturnAtIndex:path];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been returned" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UIColor *background = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"stack-of-books.jpg"]]autorelease];
    
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier]autorelease] ;
    }
   
    cell.textLabel.text =[booklist objectAtIndex:indexPath.row];
    
  
    
     UIColor *clr = [UIColor colorWithRed:0.89f green:0.81f blue:0.87f alpha:1];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(160.0f, 10.0f, 45.0f, 25.0f);
    button.backgroundColor=clr;
    [button setTitle:@"Issue" forState:UIControlStateNormal];
    
    
    
     button.tag=indexPath.row;
    
    
   [button addTarget:self action:@selector(issue:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:button ];
    
    UIButton *details = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    details.frame = CGRectMake(225.0f, 10.0f, 50.0f, 25.0f);
    details.backgroundColor=clr;
    [details setTitle:@"Return" forState:UIControlStateNormal];
    
     details.tag=indexPath.row;
   [details addTarget:self action:@selector(returns:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:details ];

    table.backgroundColor = background;
    cell.backgroundColor=[UIColor clearColor];
    
  cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [booklist count];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [delegate didSelectRow:indexPath];
    SBBookDetailViewController *detailView=[[[SBBookDetailViewController alloc]initWithNibName:@"SBBookDetailViewController" bundle:nil]autorelease];
    [self.navigationController pushViewController:detailView animated:YES];
   
    
}

-(void)add
{
    SBentryFormViewController *entryForm=[[[SBentryFormViewController alloc]initWithNibName:@"SBentryFormViewController" bundle:nil]autorelease];
    [self.navigationController pushViewController:entryForm animated:YES];
    
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"reaching accessoryButtonTappedForRowWithIndexPath:");
//    [self performSegueWithIdentifier:@"modaltodetails" sender:[self.eventsTable cellForRowAtIndexPath:indexPath]];
    
    [delegate didSelectRow:indexPath];
    SBBookDetailViewController *detailView=[[[SBBookDetailViewController alloc]initWithNibName:@"SBBookDetailViewController" bundle:nil]autorelease];
    [self.navigationController pushViewController:detailView animated:YES];
   
    
}
- (void)dealloc
{

    [booklist release];
    [_tableView release];
    [super dealloc];
    
    
}

@end
