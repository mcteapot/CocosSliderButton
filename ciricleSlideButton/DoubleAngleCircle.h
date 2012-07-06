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
    
    CGFloat period;
    CGFloat PI;
    
    NSArray *circleCoordinates;
}

// Properties 
@property (nonatomic, assign) NSInteger radiusInt;
@property (nonatomic, assign) CGFloat radiusFloat;
@property (nonatomic, assign) NSInteger leaves;
@property (nonatomic, assign) CGFloat period;
@property (nonatomic) NSArray *circleCoordinates;


// Methods Declarations
-(id) initWithRadiusInt:(NSInteger) r withLeaves:(NSInteger) l;

@end
