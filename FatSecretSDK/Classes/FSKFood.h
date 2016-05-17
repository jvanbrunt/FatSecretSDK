
#import <JSONModel/JSONModel.h>

@class FSKServings;

@protocol FSKFood
@end

@interface FSKFood : JSONModel

@property (nonatomic) NSString *food_id;
@property (nonatomic) NSString *food_name;
@property (nonatomic) NSString *food_type;
@property (nonatomic) NSString *food_url;
@property (nonatomic) NSString<Optional> *brand_name;
@property (nonatomic) FSKServings<Optional> *servings;

@end
