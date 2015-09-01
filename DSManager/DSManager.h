//
//  DSManager.h
//  DSManager
//
//  Created by Evan on 9/1/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSManager : NSObject {
    
    int currentIndex;
    int currentMultipleIndex;
    int requestLimit;
    
    void (^getBlock)(int);
    
}

-(void)setCurrentIndex:(int)index;
-(void)setGet:(int)limit block:(void (^)(int))block;

@end
