

#import<Foundation/Foundation.h>

@class JSTestParam;




@interface JSTestParam : NSObject
    
    
    @property(nonatomic, assign) int intParam;
    
    @property(nonatomic, assign) double doubleParam;
    
    @property(nonatomic, strong) NSString *stringParam;
    
    @property(nonatomic, strong) NSArray *listParam;
    + (Class)listParamElementClass;
    
    @property(nonatomic, strong) NSDictionary *mapParam;
    + (Class)mapParamElementClass;
    
    @property(nonatomic, strong) JSTestParam *param;
    
    @property(nonatomic, strong) NSDate *date;
    
    
    
    @end


