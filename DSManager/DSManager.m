//
//  DSManager.m
//  DSManager
//
//  Created by Evan on 9/1/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "DSManager.h"

@implementation DSManager

-(id)init {
    
    if (self = [super init]) {
        
        getBlocks = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}

-(void)setCurrentIndex:(int)index {
    
    currentIndex = index;
    
    int limit = 0;
    int multipleIndex = 0;
    void (^block)(int);
    
    for (int i = 0; i < getBlocks.count; i++) {
        
        limit = [[[getBlocks objectAtIndex:i]valueForKey:@"limit"]intValue];;
        multipleIndex = [[[getBlocks objectAtIndex:i]valueForKey:@"multiple_index"]intValue];;
        block = [[getBlocks objectAtIndex:i]valueForKey:@"block"];
        
        int currentMultipleIndex = (currentIndex / limit);
        
        if (currentMultipleIndex > multipleIndex) {
            [[getBlocks objectAtIndex:i]setValue:[NSNumber numberWithInt:currentMultipleIndex] forKey:@"multiple_index"];
            block(currentIndex);
        }
        
    }
    
}

-(void)setGet:(int)limit block:(void (^)(int))block {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setObject:[NSNumber numberWithInt:limit] forKey:@"limit"];
    [dictionary setObject:[NSNumber numberWithInt:0] forKey:@"multiple_index"];
    [dictionary setObject:block forKey:@"block"];
    
    [getBlocks addObject:dictionary];
        
}

@end
