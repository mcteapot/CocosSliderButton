//
//  DoubleAngleCircle.h
//  robotz
//
//  Created by arjun prakash on 7/5/12.
//  Copyright (c) 2012 CyborgDino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

@interface DoubleAngleCircle : NSObject {

 //Data
    
    NSInteger radiusInt;
    CGFloat radiusFloat;
    
    NSInteger leaves;
    NSInteger arraySize;
    
    CGFloat period;
    CGFloat radian;
    CGFloat PI;
    
    NSMutableArray *points;
}

// Properties 
@property (nonatomic, assign) NSInteger radiusInt;
@property (nonatomic, assign) CGFloat radiusFloat;
@property (nonatomic, assign) NSInteger leaves;
@property (nonatomic, assign) CGFloat period;
@property (nonatomic, readonly) NSMutableArray *points;


// Methods Declarations
-(id) initWithRadiusInt:(NSInteger) r withLeaves:(NSInteger) l;
-(id) initWithRadiusFloat:(CGFloat) r withLeaves:(NSInteger) l;

-(void) rotateDegreesTo:(CGFloat) d;
-(void) createCoordinates;

@end

