//
//  CircleSliderButtonLayer.m
//  ciricleSlideButton
//
//  Created by arjun prakash on 7/6/12.
//  Copyright 2012 CyborgDino. All rights reserved.
//

#import "CircleSliderButtonLayer.h"


@implementation CircleSliderButtonLayer


+(id) menuWithRaidus:(CGFloat) r andItems: (CCMenuItem*) item, ...
{
    va_list args;
	va_start(args,item);
	
	id s = [[[self alloc] initWithItems: item VaList:args AndRaidus:r] autorelease];
	
	va_end(args);
	return s;
}

- (id) init {
    
    self = [super init];
    if (self) {
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        
        // Initialization code here.
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        // Adding sprites to cache
        
        // Create sprite

        // Adding quad parts to screen
        
        // Adding quad click locations
        
        // Standard method to create a button
        
        
        // Preload Audio
        
        
        
    }
    
    [self schedule:@selector(step)];
    
    return self;
}

-(id) initWithItems:(CCMenuItem*) item VaList:(va_list) args AndRaidus:(CGFloat) r
{

    self = [super init];
    if (self) {
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        
        distance = r;
        
        circleMenu = [[CCMenu alloc]initWithItems:item vaList:args];
        [self addChild:circleMenu];
        circleMenu.anchorPoint = ccp(0.5f, 0.5f);
        circleMenu.position = ccp(0,0);
        
        
        totalButtons = circleMenu.children.count;
        if (totalButtons == 1) {
            leavestCount = 2;
            evenButtons = NO;
        } else if (totalButtons == 2) {
            leavestCount = 2;
            evenButtons = YES;
        } else if (totalButtons % 2 == 0) {
            leavestCount = totalButtons / 2;
            evenButtons = YES;
        } else {
            leavestCount = totalButtons;
            evenButtons = NO;
        }
        // Initialization code here.
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        circleCoordinates = [[DoubleAngleCircle alloc] initWithRadiusFloat:distance withLeaves:leavestCount];
        
        
        
    }
    
    [self schedule:@selector(step)];
    
    return self;
}

-(id) initWithButtons:(NSInteger) b AndDistance:(CGFloat) d AtPoint:(CGPoint) p{
    
    self = [super init];
    if (self) {
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        
        distance = d;
        
        totalButtons = b;
        if (b % 2 == 0) {
            leavestCount = b / 2;
            evenButtons = YES;
        } else {
            leavestCount = b;
            evenButtons = NO;
        }
        // Initialization code here.
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        circleCoordinates = [[DoubleAngleCircle alloc] initWithRadiusFloat:distance withLeaves:leavestCount];
        [circleCoordinates rotateDegreesTo:30];
        
        origin = p;
        
        // Adding sprites to cache
        
        // Create sprite
        
        for (int i = 0; i < circleCoordinates.points.count; i++) {
            if (i == circleCoordinates.points.count - 1) { 
                CCSprite *selectButton = [CCSprite spriteWithFile:@"selectX.png"];
                [self addChild:selectButton];
                selectButton.position = ccpAdd(origin, [[circleCoordinates.points objectAtIndex:i] CGPointValue]);
            }else {
                CCSprite *selectButton = [CCSprite spriteWithFile:[NSString stringWithFormat:@"select%i.png", i]];
                [self addChild:selectButton];
                selectButton.position = ccpAdd(origin, [[circleCoordinates.points objectAtIndex:i] CGPointValue]);
            }
        }
        
        
        
        // Adding quad parts to screen
        
        // Adding quad click locations
        
        // Standard method to create a button
        
        
        // Preload Audio
        
        
        
    }
    
    [self schedule:@selector(step)];
    
    return self;

}


//-(void) onEnter {
//
//}


#pragma mark -
#pragma mark API

-(void) openButtons {
    for (int i = 0; i < totalButtons; i++) {
        CCMenuItem *item = (CCMenuItem *)[circleMenu.children objectAtIndex:i];
        CGPoint p = [[circleCoordinates.points objectAtIndex:i] CGPointValue];
        CCLOG(@"X: %f, Y: %f", p.x, p.y);
        if (totalButtons == 1) {
            int j = 0;
            item.position = [[circleCoordinates.points objectAtIndex:j] CGPointValue];
            break;
        } else if (totalButtons == 2) {
            int j = i*2;
            item.position = [[circleCoordinates.points objectAtIndex:j] CGPointValue];
        } else {
            item.position = [[circleCoordinates.points objectAtIndex:i] CGPointValue];
        }
    }
}

-(void) openButtonsWithDegreeRotation:(CGFloat) d {
    [circleCoordinates rotateDegreesTo:d];
    [self openButtons];

}
-(void) setButtons:(BOOL)enable {
    
    
}

-(void) unloadAudioEffects {

}




#pragma mark -
#pragma mark Updeate Method

- (void) update:(ccTime)deltaTime {
    
    
}  

-(void) step {
    //BOOL changeState = NO;
    
}

#pragma mark -
#pragma mark Touches Method


#pragma mark -
#pragma mark Dealloc Method

-(void) dealloc {
    
    CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    [self unloadAudioEffects];
    
    [circleCoordinates release];
    [circleMenu release];
    
    // always call [super dealloc] in the dealloc method!
    [super dealloc]; 
    
}


@end
