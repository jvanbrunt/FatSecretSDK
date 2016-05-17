
@import MRCEnumerable;

#import "FSKClient.h"
#import "OAuthCore.h"
#import "FSKFood.h"
#import "FSKFoodSearchResult.h"
#import "FSKExerciseResult.h"

static NSString *const kFatSecretAPIURL = @"http://platform.fatsecret.com/rest/server.api";

#pragma mark Methods

static NSString *const kFatSecretSearchMethod = @"foods.search";
static NSString *const kFatSecretFoodGetMethod = @"food.get";
static NSString *const kExerciseGetMethod = @"exercises.get";

#pragma mark Parameters

static NSString *const kSearchTerm = @"search_expression";
static NSString *const kPageNumber = @"page_number";
static NSString *const kMaxResults = @"max_results";
static NSString *const kFoodId = @"food_id";

@interface FSKClient ()

@property (nonatomic) NSURLSession *session;
@property (nonatomic) NSString *key;
@property (nonatomic) NSString *secret;

@end

@implementation FSKClient

+ (instancetype)clientWithKey:(NSString *)key secret:(NSString *)secret {
    return [FSKClient clientWithSession:[NSURLSession sharedSession] key:key secret:secret];
}

+ (instancetype)clientWithSession:(NSURLSession *)session key:(NSString *)key secret:(NSString *)secret {
    FSKClient *client = [FSKClient new];
    client.session = session;
    client.key = key;
    client.secret = secret;
    return client;
}


- (void)searchFoods:(NSString *)searchTerm
         pageNumber:(NSUInteger)pageNumber
         maxResults:(NSUInteger)maxResults
            success:(void(^)(FSKFoodSearchResult *result))success
              failure:(void(^)(NSError *error))failure {
    
    NSDictionary *parameters = @{
                                 kSearchTerm : searchTerm,
                                 kPageNumber : @(pageNumber),
                                 kMaxResults : @(maxResults)
                                 };
    
    [self GET:kFatSecretSearchMethod parameters:parameters success:^(id data, NSURLResponse *response) {
        if (success) {
            FSKFoodSearchResult *result = [[FSKFoodSearchResult alloc] initWithDictionary:data[@"foods"] error:nil];
            success(result);
        }
        
    } failure:^(NSError *error, NSURLResponse *response) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)getFood:(long)food_Id success:(void (^)(FSKFood *))success failure:(void (^)(NSError *))failure {
    
    NSDictionary *parameters = @{
                                 kFoodId: @(food_Id)
                                 };
    
    [self GET:kFatSecretFoodGetMethod parameters:parameters success:^(id data, NSURLResponse *response) {
        if (success) {
            FSKFood *food = [[FSKFood alloc] initWithDictionary:data[@"food"] error:nil];
            success(food);
        }
    } failure:^(NSError *error, NSURLResponse *response) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)getExercisesSuccess:(void (^)(FSKExerciseResult *))success failure:(void (^)(NSError *))failure {
    [self GET:kExerciseGetMethod parameters:@{} success:^(id data, NSURLResponse *response) {
        if (success) {
            FSKExerciseResult *result = [[FSKExerciseResult alloc] initWithDictionary:data[@"exercises"] error:nil];
            success(result);
        }
    } failure:^(NSError *error, NSURLResponse *response) {
        if (failure) {
            failure(error);
        }
    }];
}


#pragma mark Private Methods

- (NSString *)queryStringFromDictionary:(NSDictionary *)dict {
    NSMutableArray *array = [NSMutableArray array];
    [dict each:^(id key, id obj) {
        NSString *item = [NSString stringWithFormat:@"%@=%@", key, obj];
        [array addObject:item];
    }];
    
    return [array componentsJoinedByString:@"&"];
}

- (void)GET:(NSString *)method parameters:(NSDictionary *)parameters success:(void(^)(id data, NSURLResponse *response))success failure:(void(^)(NSError *error, NSURLResponse *response))failure {
    [self httpMethod:@"GET" method:method parameters:parameters success:success failure:failure];
}

- (void)POST:(NSString *)method parameters:(NSDictionary *)parameters success:(void(^)(id data, NSURLResponse *response))success failure:(void(^)(NSError *error, NSURLResponse *response))failure {
    [self httpMethod:@"POST" method:method parameters:parameters success:success failure:failure];
}

- (void)httpMethod:(NSString *)httpMethod method:(NSString *)method parameters:(NSDictionary *)parameters success:(void(^)(id data, NSURLResponse *response))success failure:(void(^)(NSError *error, NSURLResponse *response))failure {
    NSMutableDictionary *mutableParameters = parameters.mutableCopy;
    [mutableParameters addEntriesFromDictionary:self.defaultParameters];
    [mutableParameters addEntriesFromDictionary:@{@"method": method}];
    
    NSString *query = [self queryStringFromDictionary:mutableParameters];
    NSData *data = [NSData dataWithBytes:query.UTF8String length:query.length];
    NSString *oauthHeader = OAuthorizationHeader([NSURL URLWithString:kFatSecretAPIURL],
                                                 httpMethod,
                                                 data,
                                                 self.key,
                                                 self.secret,
                                                 nil,
                                                 @"");
    
    NSString *urlString = [kFatSecretAPIURL stringByAppendingFormat:@"?%@", oauthHeader];
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            failure(error, response);
        } else {
            id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            success(json, response);
        }
    }] resume];
}

- (NSDictionary *)defaultParameters {
    return @{@"format": @"json"};
}
@end
