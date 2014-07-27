//
//  BNRCoursesViewController.m
//  NerdFeed
//
//  Created by Ozan Asan on 27/07/14.
//  Copyright (c) 2014 Ozan Asan. All rights reserved.
//

#import "BNRCoursesViewController.h"

@interface BNRCoursesViewController()

@property (nonatomic) NSURLSession *session;

@end

@implementation BNRCoursesViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self){
        self.navigationItem.title = @"BNR Courses";
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:nil
                                            delegateQueue:nil];
        [self fetchFeed];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)fetchFeed
{
    NSString *requestString = @"http://bookapi.bignerdranch.com/courses.json";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req
                                                 completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error){
                                          NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                          NSLog(@"%@", jsonObject);
                                      }];
    [dataTask resume];
}
@end
