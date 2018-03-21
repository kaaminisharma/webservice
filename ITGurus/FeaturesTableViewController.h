//
//  FeaturesTableViewController.h
//  ITGurus
//
//  Created by Amol on 17/03/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeaturesTableViewController : UITableViewController
- (IBAction)addNewFeature:(id)sender;
@property(nonatomic,retain)NSMutableArray *featureInfoArray;
-(void)reloadTable;
@end
