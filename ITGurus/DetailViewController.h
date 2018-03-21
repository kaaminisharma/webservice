//
//  DetailViewController.h
//  ITGurus
//
//  Created by Amol on 17/03/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *featureName;
@property (weak, nonatomic) IBOutlet UILabel *featureDescription;
@property (weak, nonatomic) IBOutlet UILabel *useCase;
@property (weak, nonatomic) IBOutlet UILabel *priority;
@property (weak, nonatomic) IBOutlet UILabel *numberOfVotes;
- (IBAction)voteForFeatures:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *requestedDate;
@property (weak, nonatomic) IBOutlet UILabel *requestBy;
@property(nonatomic,retain)NSString *featurenameS,*featureDescriptionS,*usecaseS,*votesS,*priorityS,*requestByS,*requestOnS;
@end
