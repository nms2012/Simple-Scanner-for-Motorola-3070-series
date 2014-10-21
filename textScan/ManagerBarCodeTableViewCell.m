//
//  ManagerBarCodeTableViewCell.m
//  textScan
//
//  Created by MD. NAZMUS SAADAT on 10/10/14.
//  Copyright (c) 2014 Ebizu Sdn Bhd. All rights reserved.
//

#import "ManagerBarCodeTableViewCell.h"

@implementation ManagerBarCodeTableViewCell

@synthesize lblBarCode=_lblBarCode;
@synthesize txtItemName=_txtItemName;
@synthesize txtPrice=_txtPrice;


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)clearCell:(id)sender {
    [self.lblBarCode setText:@""];
    [self.txtPrice setText:@""];
    [self.txtItemName setText:@""];
    
}
@end
