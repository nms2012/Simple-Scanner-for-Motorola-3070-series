//
//  ManagerViewController.m
//  textScan
//
//  Created by MD. NAZMUS SAADAT on 10/9/14.
//  Copyright (c) 2014 Ebizu Sdn Bhd. All rights reserved.
//

#import "ManagerViewController.h"
#import "ManagerBarCodeTableViewCell.h"

#define kDataCellIdentifier @"barCodeCellView"

@interface ManagerViewController ()


@property (strong,nonatomic)UITextField *cellTextField;
@property (strong,nonatomic) NSMutableArray *arrayOfScannedBarCodes;
@property (strong, nonatomic)NSMutableDictionary *dummyDataDictionary;



@end
@implementation ManagerViewController
-(void)viewWillAppear:(BOOL)animated{
//set text field first responder to get ready for scan

 if(self.arrayOfScannedBarCodes)
    {
        self.arrayOfScannedBarCodes=nil;
    }
    self.arrayOfScannedBarCodes=[[NSMutableArray alloc]init];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.txtBarCodeScanned setDelegate:self];
    [self.txtBarCodeScanned becomeFirstResponder];
    [self buildDummyDataDictionary];
    [self setupTableViewForBarCode];
    
    
}
-(void)buildDummyDataDictionary{

    self.dummyDataDictionary=[[NSMutableDictionary alloc]init];
    [self.dummyDataDictionary  setObject:@"Part Number" forKey:@"1PCS3070-SR10007WW"];
    [self.dummyDataDictionary setObject:@"Made in China" forKey:@"CN"];
    [self.dummyDataDictionary setObject:@"(S) S/N:13302522502973" forKey:@"S13302522502973"];
    [self.dummyDataDictionary setObject:@"(2P) REV. LEVEL: H" forKey:@"2PH"];
    [self.dummyDataDictionary setObject:@"(D) DATE CODE:29OCT13" forKey:@"D29OCT13"];
}

#pragma mark SetupViews
-(void)setupTableViewForBarCode{
    self.inventoryWithBarCodeTableView=[[UITableView alloc]initWithFrame:CGRectMake(175, 125, 695, 587) style:UITableViewStylePlain];
    [self.inventoryWithBarCodeTableView setBackgroundColor:[UIColor clearColor]];
    [self.inventoryWithBarCodeTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    [self.view addSubview:self.inventoryWithBarCodeTableView];
    
    [self.inventoryWithBarCodeTableView setDelegate:(id)self];
    [self.inventoryWithBarCodeTableView setDataSource:(id)self];
    [self.inventoryWithBarCodeTableView registerNib:[UINib nibWithNibName:@"ManagerBarCodeTableViewCell" bundle:nil]  forCellReuseIdentifier:kDataCellIdentifier];
    
    
}

#pragma mark UITextField delegates


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self postScanActions];
    return YES;
}


// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"Text field did begin editing");
   
    
    
}
// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"Text field ended editing");
}


-(void)postScanActions{

    [self.arrayOfScannedBarCodes addObject:self.txtBarCodeScanned.text];
    [self.txtBarCodeScanned setText:@""];
    [self.inventoryWithBarCodeTableView reloadData];
    

}

#pragma mark tableView related

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  if(tableView==self.inventoryWithBarCodeTableView)
    return 1;
  
    return 0;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{


}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView==self.inventoryWithBarCodeTableView)
    return [self.arrayOfScannedBarCodes count];
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   if(tableView==self.inventoryWithBarCodeTableView)
   {
    if(self.arrayOfScannedBarCodes.count>0)
    {
        ManagerBarCodeTableViewCell *dataCell = (ManagerBarCodeTableViewCell*)[self.inventoryWithBarCodeTableView dequeueReusableCellWithIdentifier:kDataCellIdentifier];
        [dataCell.lblBarCode setText:[self.arrayOfScannedBarCodes objectAtIndex:indexPath.row]];
        [dataCell.txtItemName setText:[self.dummyDataDictionary valueForKey:dataCell.lblBarCode.text]];
        
        [dataCell.txtPrice setText:@"0.00"];
        
        [self.inventoryWithBarCodeTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
        return dataCell;
    }
   }
  //default
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetAll:(id)sender {
    [self.arrayOfScannedBarCodes removeAllObjects];
    [self.inventoryWithBarCodeTableView reloadData];
    [self.inventoryWithBarCodeTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
