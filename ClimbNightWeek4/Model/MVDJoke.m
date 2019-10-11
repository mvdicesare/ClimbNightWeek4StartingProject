//
//  MVDJoke.m
//  ClimbNightWeek4
//
//  Created by Michael Di Cesare on 10/10/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

#import "MVDJoke.h"

static NSString * const kJokeKey = @"joke";
static NSString * const kCatagoriesKey = @"categories";



@implementation MVDJoke

-(MVDJoke *)initWithJoke:(NSString *)joke categories:(NSArray<NSString *> *)categories
{
    self = [super init];
    if (self)
    {
        _joke = joke;
        _categories = categories;
    }
    return self;
}

@end
@implementation MVDJoke (JSONConvertable)



- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSString * joke = dictionary[kJokeKey];
    NSArray * categories = dictionary[kCatagoriesKey];
    return [self initWithJoke:joke categories:categories];
}
    @end
