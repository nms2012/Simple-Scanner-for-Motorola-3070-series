//
//  ManagerBarCodeTableViewCell.h
//  textScan
//
//  Created by MD. NAZMUS SAADAT on 10/10/14.
//  Copyright (c) 2014 Ebizu Sdn Bhd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerBarCodeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblBarCode;
@property (strong, nonatomic) IBOutlet UITextField *txtItemName;
@property (strong, nonatomic) IBOutlet UITextField *txtPrice;
- (IBAction)clearCell:(id)sender;

@end
