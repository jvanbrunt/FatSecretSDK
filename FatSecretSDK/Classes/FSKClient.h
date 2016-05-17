
#import <Foundation/Foundation.h>

@class FSKFood, FSKFoodSearchResult, FSKExerciseResult;

@interface FSKClient : NSObject

+ (instancetype)clientWithKey:(NSString *)key secret:(NSString *)secret;

+ (instancetype)clientWithSession:(NSURLSession *)session key:(NSString *)key secret:(NSString *)secret;

- (void)searchFoods:(NSString *)searchTerm
         pageNumber:(NSUInteger)pageNumber
         maxResults:(NSUInteger)maxResults
            success:(void(^)(FSKFoodSearchResult *result))success
            failure:(void(^)(NSError *error))failure;

- (void)getFood:(long)food_Id
        success:(void(^)(FSKFood *food))success
        failure:(void(^)(NSError *error))failure;

- (void)getExercisesSuccess:(void(^)(FSKExerciseResult *result))success
                    failure:(void(^)(NSError *error))failure;

@end
