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
@synthesize  points = _points;

// Inits
- (id) init {
    
    self = [super init];
    if (self) {
     
        
    }
    return self;
}

-(id) initWithRadiusInt:(NSInteger) r withLeaves:(NSInteger) l {
    self = [super init];
    if (self) {
        PI = (CGFloat)atan(1)*4;
        
        NSLog(@"PI %f", PI);
        _radiusInt = r;
        _radiusFloat = (CGFloat)r;
        
        _period = (2.0f*PI)/l;
        
        radian = _period/4;
        
        _leaves = l;
        
        if (_leaves % 2 == 0) {
            arraySize = _leaves * 2;
            _period = (2.0f*PI)/(l * 2);
        }else {
            arraySize = _leaves;
        }
        
        _points = [[NSMutableArray alloc] init];
        
        [self createCoordinates];

    }
    return self;
}

-(id) initWithRadiusFloat:(CGFloat) r withLeaves:(NSInteger) l {
    self = [super init];
    if (self) {
        PI = (CGFloat)atan(1)*4;
        
        NSLog(@"PI %f", PI);
        //_radiusInt = r;
        _radiusFloat = r;
        
        _period = (2.0f*PI)/l;
        
        //radian = _period/4;
        radian = PI / 6;
        
        _leaves = l;
        
        if (_leaves % 2 == 0) {
            arraySize = _leaves * 2;
            _period = (2.0f*PI)/(l * 2);
        }else {
            arraySize = _leaves;
        }
        
        _points = [[NSMutableArray alloc] init]; 
        
        [self createCoordinates];
        
    }
    return self;
}

#pragma mark -
#pragma mark API

-(void) rotateDegreesTo:(CGFloat) d {
    radian = d*(PI / 180);
    [self createCoordinates];
}

-(void) createCoordinates {
    [_points removeAllObjects];
    for (int i = 0; i < arraySize; i++) {
        CGFloat radianCoordinate = radian + (_period * i);
        CGFloat x = (_radiusFloat * (cosf(radianCoordinate)));
        CGFloat y = (_radiusFloat * (sinf(radianCoordinate)));        

        [_points addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
        NSValue *val = [_points objectAtIndex:i];
        CGPoint p = [val CGPointValue];
        NSLog(@"Point(%f, %f)", p.x, p.y);
        
    }

}


#pragma mark -
#pragma mark Dealloc Method

-(void) dealloc {
    
    NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    // Relase objects
    [_points release];
    
    
    // always call [super dealloc] in the dealloc method!
    [super dealloc]; 
    
}
@end
