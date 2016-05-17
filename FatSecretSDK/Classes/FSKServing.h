
#import <JSONModel/JSONModel.h>

@interface FSKServing : JSONModel

@property (nonatomic) NSString *serving_id;
@property (nonatomic) NSString *serving_description;
@property (nonatomic) NSString *serving_url;
@property (nonatomic) NSString *metric_serving_amount;
@property (nonatomic) NSString *metric_serving_unit;
@property (nonatomic) NSString *calcium;
@property (nonatomic) NSString *calories;
@property (nonatomic) NSString *carbohydrate;
@property (nonatomic) NSString *cholesterol;
@property (nonatomic) NSString *fat;
@property (nonatomic) NSString *fiber;
@property (nonatomic) NSString *iron;
@property (nonatomic) NSString *meaurement_description;
@property (nonatomic) NSString *monounsaturated_fat;
@property (nonatomic) NSString *number_of_units;
@property (nonatomic) NSString *polyunsaturated_fat;
@property (nonatomic) NSString *potassium;

@end
