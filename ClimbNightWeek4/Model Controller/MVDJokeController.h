//
//  MVDJokeController.h
//  ClimbNightWeek4
//
//  Created by Michael Di Cesare on 10/10/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVDJoke.h"


NS_ASSUME_NONNULL_BEGIN

@interface MVDJokeController : NSObject

+(void)fetchJokesWithFirstName: (NSString *)firstName
                      lastName:(NSString *)lastName
                 numberOfJokes:(NSInteger )numberOfJokes
                    completion:(void (^)(NSArray<MVDJoke *>* _Nullable))completion;


@end

NS_ASSUME_NONNULL_END
