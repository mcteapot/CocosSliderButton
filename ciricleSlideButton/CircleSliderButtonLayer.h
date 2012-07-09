//
//  CircleSliderButtonLayer.h
//  ciricleSlideButton
//
//  Created by arjun prakash on 7/6/12.
//  Copyright 2012 CyborgDino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "DoubleAngleCircle.h"

@interface CircleSliderButtonLayer : CCLayer {
    
    DoubleAngleCircle *circleCoordinates;
    
    CCMenu *circleMenu;
    

    
    NSInteger totalButtons;
    NSInteger leavestCount;
    
    CGFloat distance;
    
    CGPoint origin;
    
    BOOL evenButtons;
    
    
    
}

+(id) menuWithRaidus:(CGFloat) r andItems: (CCMenuItem*) item, ... NS_REQUIRES_NIL_TERMINATION;
-(id) initWithItems:(CCMenuItem*) item VaList:(va_list) args AndRaidus:(CGFloat) r;


-(void) openButtons;
-(void) closeButtons;
-(void) degreeRotation:(CGFloat) d;
-(CCArray *) items;
@end
