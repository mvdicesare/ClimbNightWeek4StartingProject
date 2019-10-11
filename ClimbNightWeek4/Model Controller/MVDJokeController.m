//
//  MVDJokeController.m
//  ClimbNightWeek4
//
//  Created by Michael Di Cesare on 10/10/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

#import "MVDJokeController.h"
// http://www.icndb.com/api/
static NSString * const baseURLString = @"http://api.icndb.com";
static NSString * const jokeRouteString = @"jokes";
static NSString * const randomConponet = @"random";
static NSString * const limitOfcatagories =@"[nerdy,explicit]";
static NSString * const FNQueryItem = @"firstName";
static NSString * const LNQueryItem = @"lastName";
static NSString * const limitToQueryQ = @"limitTo";


@implementation MVDJokeController

+(void)fetchJokesWithFirstName:(NSString *)firstName
                      lastName:(NSString *)lastName
                 numberOfJokes:(NSInteger)numberOfJokes
                    completion:(void (^)(NSArray<MVDJoke *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *jokeURL = [baseURL URLByAppendingPathComponent:jokeRouteString];
    NSURL *randomURL = [jokeURL URLByAppendingPathComponent:randomConponet];
    NSURL *numberOfJokesURL = [randomURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%li",(long)numberOfJokes]];
    
    
    // MARK: - FIXME
   
    NSURLQueryItem *fNQuearyItem = [[NSURLQueryItem alloc]initWithName:FNQueryItem value:firstName];
    NSURLQueryItem *lNQuearyItem = [[NSURLQueryItem alloc] initWithName:LNQueryItem value:lastName];
    NSURLQueryItem *limitToQuery = [[NSURLQueryItem alloc] initWithName:limitToQueryQ value:limitOfcatagories];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:numberOfJokesURL resolvingAgainstBaseURL:true];
    components.queryItems = @[fNQuearyItem, lNQuearyItem, limitToQuery];
    
    NSURL *finalURL = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"error with URL %@", error);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
                NSDictionary *arrayOfJokesDict = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error][@"value"];
       
            
            if (arrayOfJokesDict == nil)
            {
            NSLog(@"error dict didnt work %@", error);
            return;
            }
            
            NSMutableArray *jokesArray = [[NSMutableArray alloc] init];
            for (NSDictionary *jokeDict in arrayOfJokesDict)
            {
                MVDJoke *joke = [[MVDJoke alloc] initWithDictionary:jokeDict];
                [jokesArray addObject:joke];
            }
            completion(jokesArray);
        }
    }]resume];
    
}




@end
