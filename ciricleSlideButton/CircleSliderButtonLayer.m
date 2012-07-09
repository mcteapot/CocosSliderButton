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
        
        [self closeButtons];
        
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



#pragma mark -
#pragma mark API

-(void) openButtons {
    for (int i = 0; i < totalButtons; i++) {
        circleMenu.opacity = 0.0f;
        circleMenu.visible = YES;
        
        CCMenuItem *item = (CCMenuItem *)[circleMenu.children objectAtIndex:i];
        CGPoint p = [[circleCoordinates.points objectAtIndex:i] CGPointValue];
        CCLOG(@"X: %f, Y: %f", p.x, p.y);
        if (totalButtons == 1) {
            int j = 0;
            
            CGPoint p = [[circleCoordinates.points objectAtIndex:j] CGPointValue];
            CCMoveTo *moveItem = [CCMoveTo actionWithDuration:0.1f position:p];
            [item runAction:moveItem];
            
            //item.position = [[circleCoordinates.points objectAtIndex:j] CGPointValue];
            [item setIsEnabled:YES];
            break;
        } else if (totalButtons == 2) {
            int j = i*2;
            
            CGPoint p = [[circleCoordinates.points objectAtIndex:j] CGPointValue];
            CCMoveTo *moveItem = [CCMoveTo actionWithDuration:0.1f position:p];
            CCFadeIn *fadeMenu = [CCFadeIn actionWithDuration:0.3f];
            [item runAction:moveItem];
            [circleMenu runAction:fadeMenu];
            
            //item.position = [[circleCoordinates.points objectAtIndex:j] CGPointValue];
            [item setIsEnabled:YES];
        } else {
            CGPoint p = [[circleCoordinates.points objectAtIndex:i] CGPointValue];
            CCMoveTo *moveItem = [CCMoveTo actionWithDuration:0.1f position:p];
            CCFadeIn *fadeMenu = [CCFadeIn actionWithDuration:0.2f];
            [item runAction:moveItem];
            [circleMenu runAction:fadeMenu];
            
            
            
            //item.position = [[circleCoordinates.points objectAtIndex:i] CGPointValue];
            [item setIsEnabled:YES];
            [item performSelector:@selector(setIsEnabled:) withObject:self  afterDelay:0.1f];
        }
    }

}

-(void) closeButtons {
    
    for (int i = 0; i < totalButtons; i++) {
        CCMenuItem *item = (CCMenuItem *)[circleMenu.children objectAtIndex:i]; 
        item.position = CGPointZero;
        [item setIsEnabled:NO];
        
    }
    circleMenu.visible = NO;

}



-(void) degreeRotation:(CGFloat) d {
    [circleCoordinates rotateDegreesTo:d];
    
}
-(void) setButtons:(BOOL)enable {
    
    
}

-(CCArray *) items {
    return circleMenu.children;
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
