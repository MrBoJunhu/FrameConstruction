
#import <UIKit/UIKit.h>

typedef void(^ClickBBUIBarButtonItemHandle)();

@interface BBUIBarButtonItem : UIBarButtonItem

/**
 返回

 @param image 『Arrow-small』
 @param handle handle description
 @return return value description
 */
-(instancetype)initWithClickHandle:(ClickBBUIBarButtonItemHandle)handle;

-(instancetype)initWithImageName:(NSString *)imageName clickHandle:(ClickBBUIBarButtonItemHandle)handle;


-(instancetype)initWithTitle:(NSString *)title clickHandle:(ClickBBUIBarButtonItemHandle)handle;

@end
