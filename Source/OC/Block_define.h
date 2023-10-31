//
//  Block_define.h
//  MN5SwiftKit
//
//  Created by week on 2023/9/22.
//

#ifndef Block_define_h
#define Block_define_h

#import <Foundation/Foundation.h>

/// block defination guide:  http://fuckingblocksyntax.com/
typedef void(^VoidBlock)(void);
typedef void(^StringBlock)(NSString *s);
typedef void(^BoolBlock)(BOOL b);
typedef void(^IntBlock)(int i);
typedef void(^DoubleBlock)(double d);
typedef void(^ObjectBlock)(NSObject *object);


#endif /* Block_define_h */


