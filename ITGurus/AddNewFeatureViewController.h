//
//  AddNewFeatureViewController.h
//  ITGurus
//
//  Created by Amol on 17/03/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewFeatureViewController : UIViewController<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *emailId;
@property (weak, nonatomic) IBOutlet UITextField *featureTitle;
@property (weak, nonatomic) IBOutlet UITextView *featureDescription;

- (IBAction)priority:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *lowPriority;
@property (weak, nonatomic) IBOutlet UIButton *highPriority;
@property (weak, nonatomic) IBOutlet UIButton *mediumPriority;
@property (weak, nonatomic) IBOutlet UITextView *useCase;
- (IBAction)sendData:(id)sender;
@property(nonatomic,retain)NSString *priority;


@end
