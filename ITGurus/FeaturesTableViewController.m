//
//  FeaturesTableViewController.m
//  ITGurus
//
//  Created by Amol on 17/03/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "FeaturesTableViewController.h"
#import "DetailViewController.h"
#import "AddNewFeatureViewController.h"
#import "FeatureInfoTableViewCell.h"
#import "FeatureInfoTableViewCell.h"
#import "featureInfo.h"

@interface FeaturesTableViewController ()

@end

@implementation FeaturesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.featureInfoArray=[[NSMutableArray alloc]init];
    [self reloadTable];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerNib:[UINib nibWithNibName:@"FeatureInfoTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.featureInfoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeatureInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    featureInfo *obj=[self.featureInfoArray objectAtIndex:indexPath.row];
    cell.featureName.text = obj.featureTitle;
    cell.RequestedDate.text=obj.requestedDate;
    cell.descriptionOfFeature.text=obj.featureDescription;
    cell.requestBy.text=obj.name;
    cell.numberOfVotes.text=obj.votes;
//    cell.textLabel.text=@"test";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
-(void)viewWillAppear:(BOOL)animated{
    [self.featureInfoArray removeAllObjects];
    [self reloadTable];
}
-(void)reloadTable{
   // NSString *str=[NSString stringWithFormat:@"http://kaamini.hashdemo.in/taskITGurus/allfeatures.php"];
    NSURL *url=[NSURL URLWithString:@"http://kaamini.hashdemo.in/taskITGurus/allfeatures.php"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data){
            NSLog(@"Data=%@",data);
            NSArray *Array=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Array=%@",Array);
            for(NSDictionary *dicObj in Array){
                featureInfo *obj=[[featureInfo alloc]init];
                obj.featureTitle = [dicObj valueForKey:@"featureTitle"];
                obj.requestedDate =[dicObj valueForKey:@"requestDate"];
                obj.featureDescription = [dicObj valueForKey:@"featureDescription"];
                obj.name =[dicObj valueForKey:@"username"];
                obj.votes = [dicObj valueForKey:@"votes"];
                obj.priority = [dicObj valueForKey:@"priority"];
                obj.useCase = [dicObj valueForKey:@"usecase"];
               [self.featureInfoArray addObject:obj];
                NSLog(@"%@",self.featureInfoArray);
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
        else{
            NSLog(@"No Connection");
        }
    }];
    [task resume];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addNewFeature:(id)sender {
    UIStoryboard *s=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AddNewFeatureViewController *anfvc=[s instantiateViewControllerWithIdentifier:@"AddNewFeatureViewController"];
    [self.navigationController pushViewController:anfvc animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *s=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    DetailViewController *dvc=[s instantiateViewControllerWithIdentifier:@"DetailViewController"];

                
               featureInfo *obj=[self.featureInfoArray objectAtIndex:indexPath.row];

                dvc.featurenameS=obj.featureTitle;
                dvc.requestByS=obj.name;
                dvc.featureDescriptionS=obj.featureDescription;
                dvc.requestOnS=obj.requestedDate;
                dvc.votesS=obj.votes;
                dvc.priorityS=obj.priority;
                dvc.usecaseS=obj.useCase;
                
                

    [self.navigationController pushViewController:dvc animated:YES];
}
@end
