//
//  List.h
//  ObjectiveCApp
//
//  Created by Ravi Bastola on 10/29/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface List : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *completedAt;
@property (strong, nonatomic) NSString *storeName;

@end

NS_ASSUME_NONNULL_END
