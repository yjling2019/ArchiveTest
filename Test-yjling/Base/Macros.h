//
//  Macros.m
//  Test-yjling
//
//  Created by 凌永剑 on 2021/12/2.
//

#import <Foundation/Foundation.h>
#import "UIColor+VVHelp.h"
#import "NSArray+DataProtect.h"
#import "NSDictionary+DataProtect.h"

#pragma mark - Lazy load
#define VVLazyload(class, name, config)     - (class *)name\
                                            {\
                                                if (!_##name) {\
                                                    _##name = [[class alloc] init];\
                                                    config;\
                                                }\
                                                return _##name;\
                                            }


#pragma mark - Colors
#define CNo_f5f7f9 [UIColor colorWithHex:0xf5f7f9]

#pragma mark - Assert
#if DEBUG

#define VVAssert(condition, desc, ...) NSAssert(condition, desc, ## __VA_ARGS__)
#define VVAssert1(condition, desc, arg1) VVAssert((condition), (desc), (arg1))
#define VVAssert2(condition, desc, arg1, arg2) VVAssert((condition), (desc), (arg1), (arg2))
#define VVAssert3(condition, desc, arg1, arg2, arg3) VVAssert((condition), (desc), (arg1), (arg2), (arg3))
#define VVAssert4(condition, desc, arg1, arg2, arg3, arg4) VVAssert((condition), (desc), (arg1), (arg2), (arg3), (arg4))
#define VVAssert5(condition, desc, arg1, arg2, arg3, arg4, arg5) VVAssert((condition), (desc), (arg1), (arg2), (arg3), (arg4), (arg5))
#define VVParameterAssert(condition) VVAssert((condition), @"Invalid parameter not satisfying: %@", @#condition)

#else

#define VVAssert(condition, desc, ...)
#define VVAssert1(condition, desc, arg1)
#define VVAssert2(condition, desc, arg1, arg2)
#define VVAssert3(condition, desc, arg1, arg2, arg3)
#define VVAssert4(condition, desc, arg1, arg2, arg3, arg4)
#define VVAssert5(condition, desc, arg1, arg2, arg3, arg4, arg5)
#define VVParameterAssert(condition)

#endif


#if DEBUG
#define VVAssertReturn(condition, desc, result)        NSAssert(condition, desc); \
                                                    if (!condition) { return result; }
#define VVAssertReturnVoid(condition, desc)            NSAssert(condition, desc); \
                                                    if (!condition) { return; }
#define VVAssertReturnNil(condition, desc)            NSAssert(condition, desc); \
                                                    if (!condition) { return nil; }
#else
#define VVAssertReturn(condition, desc, result)        if (!condition) { return result; }
#define VVAssertReturnVoid(condition, desc)            if (!condition) { return; }
#define VVAssertReturnNil(condition, desc)            if (!condition) { return nil; }
#endif


#define VVClassAssert(instance, class_name)                         VVAssert([instance isKindOfClass:[class_name class]], @"class error.")
#define VVClassAssertReturn(instance, class_name, result)           VVAssertReturn([instance isKindOfClass:[class_name class]], @"class error.", result)
#define VVClassAssertReturnVoid(instance, class_name)               VVAssertReturnVoid([instance isKindOfClass:[class_name class]], @"class error.")
#define VVClassAssertReturnNil(instance, class_name)                VVAssertReturnNil([instance isKindOfClass:[class_name class]], @"class error.")

#define VVParameterAssertReturn(condition, result)                  VVAssertReturn((condition), @"params error.", result)
#define VVParameterAssertReturnVoid(condition)                      VVAssertReturnVoid(condition), @"params error.")
#define VVParameterAssertReturnNil(condition)                       VVParameterAssertReturnNil(condition), @"params error.")


