//
//  DetailViewController.m
//  ITGurus
//
//  Created by Amol on 17/03/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.infoArray = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    self.featureName.text = self.featurenameS;
    self.numberOfVotes.text = self.votesS;
    self.featureDescription.text = self.featureDescriptionS;
    self.requestedDate.text = self.requestOnS;
    self.requestBy.text = self.requestByS;
    self.useCase.text = self.usecaseS;
    self.priority.text = self.priorityS;

    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)voteForFeatures:(id)sender {
}
@end
