
#import <JSONModel/JSONModel.h>

#import "FSKFood.h"

@interface FSKFoodSearchResult : JSONModel

@property (nonatomic) int max_results;
@property (nonatomic) int total_results;
@property (nonatomic) int page_number;

@property (nonatomic) NSArray<Optional, FSKFood> *food;

@end
