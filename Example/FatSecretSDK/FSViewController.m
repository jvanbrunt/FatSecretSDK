//
//  FSViewController.m
//  FatSecretSDK
//
//  Created by Jacob Van Brunt on 05/16/2016.
//  Copyright (c) 2016 Jacob Van Brunt. All rights reserved.
//

#import <FatSecretSDK/FSKClient.h>

#import "FSViewController.h"

static NSString *const kFatSecretKey = @"2da17c45535e49578ad7cd68b8e9f23e";
static NSString *const kFatSecretSecret = @"099fca6214cc443eb5c17611eaf8d152";

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FSKClient *client = [FSKClient clientWithKey:kFatSecretKey secret:kFatSecretSecret];
    
    [client searchFoods:@"Apple" pageNumber:1 maxResults:20 success:^(FSKFoodSearchResult *result) {
        NSLog(@"Foods: %@", result);
    } failure:^(NSError *error) {
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
    
    [client getFood:79431 success:^(FSKFood *food) {
        NSLog(@"Food: %@", food);
    } failure:^(NSError *error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
    
    [client getExercisesSuccess:^(NSArray *exercises) {
        NSLog(@"Exercises: %@", exercises);
    } failure:^(NSError *error) {
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
}


@end
