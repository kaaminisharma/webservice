//
//  FeatureInfoTableViewCell.h
//  ITGurus
//
//  Created by Amol on 17/03/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeatureInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *featureName;
@property (weak, nonatomic) IBOutlet UILabel *numberOfVotes;
@property (weak, nonatomic) IBOutlet UILabel *descriptionOfFeature;
- (IBAction)vote:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *RequestedDate;
@property (weak, nonatomic) IBOutlet UILabel *requestBy;

@end
