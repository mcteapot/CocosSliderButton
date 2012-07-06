//
//  DoubleAngleCircle.m
//  robotz
//
//  Created by arjun prakash on 7/5/12.
//  Copyright (c) 2012 CyborgDino. All rights reserved.
//

#import "DoubleAngleCircle.h"

@implementation DoubleAngleCircle

// Synthesize
@synthesize  radiusInt = _radiusInt;
@synthesize  radiusFloat = _radiusFloat;
@synthesize  leaves = _leaves;
@synthesize  period = _period;
@synthesize  circleCoordinates = _circleCoordinates;

// Inits
- (id) init {
    
    self = [super init];
    if (self) {
     
        
        return self;
        
    }

}

-(id) initWithRadiusInt:(NSInteger) r withLeaves:(NSInteger) l {
    self = [super init];
    if (self) {
        PI = (CGFloat)atan(1)*4;
        
        
        _radiusInt = r;
        radiusFloat = (CGFloat)r;
        
        _period = 2.0f/PI;
        
        _leaves = l;
        
        circleCoordinates = [[NSArray alloc] initWithCapacity:l]; 
        
        return self;
    }
}

#pragma mark -
#pragma mark API






#pragma mark -
#pragma mark Dealloc Method

-(void) dealloc {
    
    NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    // Relase objects
    [circleCoordinates release];
    
    
    // always call [super dealloc] in the dealloc method!
    [super dealloc]; 
    
}
@end
