#  单利模式

```
#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

-(void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)name
{
    return objc_getAssociatedObject(self, @"name");
}


@end



```
