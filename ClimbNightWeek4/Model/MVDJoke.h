//
//  MVDJoke.h
//  ClimbNightWeek4
//
//  Created by Michael Di Cesare on 10/10/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVDJoke : NSObject

//declare properties from json
@property (nonatomic, copy, readonly) NSString *joke;
@property (nonatomic, copy, readonly) NSArray<NSString *> *categories;

-(MVDJoke *)initWithJoke:(NSString *)joke
              categories:(NSArray<NSString *> *)categories;

@end
// extention

@interface MVDJoke (JSONConvertable)

-(instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end
NS_ASSUME_NONNULL_END
