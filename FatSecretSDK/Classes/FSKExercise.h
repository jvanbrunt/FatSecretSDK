
#import <JSONModel/JSONModel.h>

@protocol FSKExercise
@end

@interface FSKExercise : JSONModel

@property (nonatomic) NSString *exercise_id;
@property (nonatomic) NSString *exercise_name;

@end
