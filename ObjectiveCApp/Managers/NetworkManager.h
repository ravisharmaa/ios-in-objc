//
//  NetworkManager.h
//  ObjectiveCApp
//
//  Created by Javra Software on 10/31/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (NetworkManager *) sharedManager;

@end


@interface NetworkManager()

@end

NS_ASSUME_NONNULL_END
