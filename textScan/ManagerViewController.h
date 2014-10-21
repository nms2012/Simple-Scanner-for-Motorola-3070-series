//
//  ManagerViewController.h
//  textScan
//
//  Created by MD. NAZMUS SAADAT on 10/9/14.
//  Copyright (c) 2014 Ebizu Sdn Bhd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtBarCodeScanned;
@property (strong, nonatomic) IBOutlet UITableView *inventoryWithBarCodeTableView;
- (IBAction)resetAll:(id)sender;

@end
