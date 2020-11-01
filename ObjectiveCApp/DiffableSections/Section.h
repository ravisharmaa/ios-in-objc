//
//  Section.h
//  ObjectiveCApp
//
//  Created by Ravi Bastola on 11/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Section : NSObject 

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSUUID *UUID;

@end

NS_ASSUME_NONNULL_END
