//
//  DSManager.m
//  DSManager
//
//  Created by Evan on 9/1/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "DSManager.h"

@implementation DSManager

-(void)setCurrentIndex:(int)index {
    
    currentIndex = index;
    
    int multipleIndex = (currentIndex / requestLimit);
    
    if (multipleIndex > currentMultipleIndex) {
        currentMultipleIndex = multipleIndex;
        getBlock(currentIndex);
    }
    
}

-(void)setGet:(int)limit block:(void (^)(int))block {
    
    requestLimit = limit;
    
    getBlock = block;
    
}

@end
