//
//  AddNewFeatureViewController.m
//  ITGurus
//
//  Created by Amol on 17/03/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "AddNewFeatureViewController.h"
#import "FeaturesTableViewController.h"

@interface AddNewFeatureViewController ()

@end

@implementation AddNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lowPriority.tag=1;
    self.highPriority.tag=3;
    self.mediumPriority.tag=2;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)priority:(UIButton *)sender {
    sender.selected  = ! sender.selected;
    if(sender.selected){
    if(sender.tag==1){
        self.priority = @"L";
        if(self.mediumPriority.selected){
            self.mediumPriority.selected=!self.mediumPriority.selected;}
        if(self.highPriority.selected){
        self.highPriority.selected=!self.highPriority.selected;
        }
        [sender setBackgroundImage:[UIImage imageNamed:@"RadioButtonChecked"] forState:UIControlStateSelected];
    }
    else
        if(sender.tag==3){
           self.priority =@"H";

            if(self.mediumPriority.selected){
                
                self.mediumPriority.selected=!self.mediumPriority.selected;}
            if(self.lowPriority.selected){
                self.lowPriority.selected=!self.lowPriority.selected;}
            [sender setBackgroundImage:[UIImage imageNamed:@"RadioButtonChecked"] forState:UIControlStateSelected];
        }
    else
        if(sender.tag==2){
            self.priority =@"M";

            if(self.lowPriority.selected){
               
                self.lowPriority.selected=!self.lowPriority.selected;}
            if(self.highPriority.selected){
                self.highPriority.selected=!self.highPriority.selected;}
            [sender setBackgroundImage:[UIImage imageNamed:@"RadioButtonChecked"] forState:UIControlStateSelected];
        }
    }
    else{
        self.priority =@"";
    }
    
    NSLog(@"Priority=%@",self.priority);
}
- (IBAction)sendData:(id)sender {
    
    if([self.Name.text isEqualToString:@""]){
        self.errorLabel.hidden=false;
        self.errorLabel.text=@"Name field can't be empty";
        self.errorLabel.textColor=[UIColor redColor];
    }
    else if([self.emailId.text isEqualToString: @""] ){
        self.errorLabel.hidden=false;
        self.errorLabel.text=@"emailid field can't be empty";
        self.errorLabel.textColor=[UIColor redColor];
        
    }
    else if([self.featureTitle.text isEqualToString: @""]){
        self.errorLabel.hidden=false;
        self.errorLabel.text=@"Title field can't be empty";
        self.errorLabel.textColor=[UIColor redColor];
    }
    else if([self.featureDescription.text isEqualToString: @""]){
        self.errorLabel.hidden=false;
        self.errorLabel.text=@"Description field can't be empty";
        self.errorLabel.textColor=[UIColor redColor];
    }
    else if([self.useCase.text isEqualToString:@""]){
        self.errorLabel.hidden=false;
        self.errorLabel.text=@"UseCase field can't be empty";
        self.errorLabel.textColor=[UIColor redColor];
    }
    else
    {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];
    
    NSString *strDate = [NSString stringWithFormat:@"%ld.%ld.%ld", (long)day, (long)month, (long)year];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"YYYY-MM-DD HH:MI:SS";
        NSString *regDate = [formatter stringFromDate:[NSDate date]];

//
//NSString *str=[NSString stringWithFormat:@"username=%@&email=%@&featureTitle=%@&featureDescription=%@&priority=%@&usecase=%@&votes=0&requestDate=%@",self.Name.text,self.emailId.text,self.featureTitle.text,self.featureDescription.text,self.priority,_useCase.text,regDate];
//    NSLog(@"URLSring=%@",str);
//
//NSData *postData = [str dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"]http://kaamini.hashdemo.in/taskITGurus/insert.php"]];
//    [request setURL:[NSURL URLWithString:@"http://kaamini.hashdemo.in/taskITGurus/insert.php"]];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:postData];
//    NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration defaultSessionConfiguration];
//
//    NSURLSession *session=[NSURLSession sessionWithConfiguration:configuration];
//    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
//    request.HTTPMethod = @"POST";
//    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"Response=%@",response);
//    NSLog(@"Data=%@",data);
//        NSDictionary *dictionaryObject =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"Dic=%@",dictionaryObject);
//        BOOL success=[dictionaryObject valueForKey:@"success"];
//        if(success){
//            NSLog(@"Success");
//
//            dispatch_async(dispatch_get_main_queue(), ^{
//                UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Feature Added successfully" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//                [Alert show]; });
//        }
//    }];
//
//    [task resume];
        
        
        //Using Dictionary
        
        NSMutableDictionary *mapData=[[NSMutableDictionary alloc]init];
        [mapData setObject:self.Name.text forKey:@"username"];
        [mapData setObject:self.emailId.text forKey:@"email"];
        [mapData setObject:self.featureTitle.text forKey:@"featureTitle"];
        [mapData setObject:self.featureDescription.text forKey:@"featureDescription"];
        [mapData setObject:self.priority forKey:@"priority"];
        [mapData setObject:_useCase.text forKey:@"usecase"];
        [mapData setObject:@"0" forKey:@"votes"];
        [mapData setObject:regDate forKey:@"requestDate"];
        
        //NSLog(@"Dic=%@",mapData);
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURL * url = [NSURL URLWithString:[ NSString stringWithFormat:@"http://kaamini.hashdemo.in/taskITGurus/insert.php"]];;
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        
       // NSDictionary *mapData = [[NSDictionary alloc] initWithObjectsAndKeys:@"212333333",@"ABCD",@"6544345345",@"NMHG",nil];
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:nil];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                              
        {
            NSLog(@"Response=%@",response);
            
            
            NSArray *array =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"res---%@", array);
            
            
            if(error == nil)
            {
                NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                NSLog(@"Data = %@",text);
            }
            
        }];
        
        [postDataTask resume];
         
         
        /*
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setHTTPMethod:@"POST"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        NSString *postParams = @"username=gf&email=example@example.com&featureTitle=hh&featureDescription=hhh&priority=low&usecase=addpost&votes=4&requestDate=03/01/1993";
        NSData *postData = [postParams dataUsingEncoding:NSUTF8StringEncoding];
        
        
         //NSDictionary *postDict = @{@"username": @"sdas", @"email": @"a@g.com",@"featureTitle":@"tests",@"featureDescription":@"dasfafa",@"priority":@"low",@"usecase":@"profile",@"votes":@"2",@"requestDate":@"03/01/1993"};
         //NSData *postData = [NSJSONSerialization dataWithJSONObject:postDict options:0 error:nil];
        
        [request setURL:[NSURL URLWithString:@"http://kaamini.hashdemo.in/taskITGurus/insert.php"]];
        [request setHTTPBody:postData];
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (!error) {
                NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"response: %@",responseDict);
            } else {
                // error code here
                NSLog(@"error: %@",error);
            }
            
            
        }];
        
        [postDataTask resume];
        */

    NSLog(@"Date=%@",regDate);
}
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0){
    if(buttonIndex == 1){
        UIStoryboard *s=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        FeaturesTableViewController *ftvc=[s instantiateViewControllerWithIdentifier:@"FeaturesTableViewController"];
        [self.navigationController pushViewController:ftvc animated:YES];
    }
}

@end
