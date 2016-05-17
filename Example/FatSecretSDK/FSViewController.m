//
//  FSViewController.m
//  FatSecretSDK
//
//  Created by Jacob Van Brunt on 05/16/2016.
//  Copyright (c) 2016 Jacob Van Brunt. All rights reserved.
//

#import <FatSecretSDK/FSKClient.h>

#import "FSViewController.h"

static NSString *const kFatSecretKey = @"YOUR_KEY";
static NSString *const kFatSecretSecret = @"YOUR_SECRET";

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
