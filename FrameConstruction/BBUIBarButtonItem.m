
#import "BBUIBarButtonItem.h"

@interface BBUIBarButtonItem()

@property (nonatomic, copy) ClickBBUIBarButtonItemHandle handle;


@end

@implementation BBUIBarButtonItem

- (instancetype)initWithClickHandle:(ClickBBUIBarButtonItemHandle)handle {
    
    if (self = [super initWithImage:[UIImage imageNamed:@"Arrow-small"] style:UIBarButtonItemStylePlain target:self action:@selector(clickItemAction:)]) {
      
        self.tintColor = [UIColor whiteColor];
        
        self.handle = handle;
        
    }
    
    return self;
}

-(instancetype)initWithImageName:(NSString *)imageName clickHandle:(ClickBBUIBarButtonItemHandle)handle {
    
    if (self = [super initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:@selector(clickItemAction:)]) {
        
        self.tintColor = [UIColor whiteColor];
        
        self.handle = handle;
    }
 
    return self;
    
}

- (instancetype)initWithTitle:(NSString *)title clickHandle:(ClickBBUIBarButtonItemHandle)handle {
    
    if (self = [super initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(clickItemAction:)]) {
        
        self.tintColor = [UIColor whiteColor];
        
        self.handle = handle;
        
    }
 
    return self;
    
}


- (void)clickItemAction:(id)sender {
    
    if (self.handle) {
        
        self.handle();
   
    }
    
}
@end
