//
//  FSViewController.m
//  FatSecretSDK
//
//  Created by Jacob Van Brunt on 05/16/2016.
//  Copyright (c) 2016 Jacob Van Brunt. All rights reserved.
//

#import <FatSecretSDK/FSKClient.h>

#import "FSViewController.h"

static NSString *const kFatSecretKey = @"KEY";
static NSString *const kFatSecretSecret = @"SECRET";

@interface FSViewController ()

@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
    
    [client getExercisesSuccess:^(FSKExerciseResult *result) {
        NSLog(@"Exercises: %@", result);
    } failure:^(NSError *error) {
        NSLog(@"ERROR: %@", error.localizedDescription);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
