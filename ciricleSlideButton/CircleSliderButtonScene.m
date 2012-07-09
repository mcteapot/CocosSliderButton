//
//  CircleSliderButtonScene.m
//  ciricleSlideButton
//
//  Created by arjun prakash on 7/5/12.
//  Copyright 2012 CyborgDino. All rights reserved.
//

#import "CircleSliderButtonScene.h"


@implementation CircleSliderButtonScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CircleSliderButtonScene *layer = [CircleSliderButtonScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        CCSprite *bg = [CCSprite spriteWithFile:@"background.png"];
        bg.anchorPoint = ccp(0, 0);
        [self addChild:bg z:-10];
        
        // creat objects and inits
        
        CCMenuItem *selectOn00 = [CCMenuItemImage itemFromNormalImage:@"select0.png" 
                                                        selectedImage:@"select0.png" target:nil selector:nil];
        CCMenuItem *selectOff00 = [CCMenuItemImage itemFromNormalImage:@"select0Active.png" 
                                                         selectedImage:@"select0Active.png" target:nil selector:nil];
        CCMenuItemToggle *selectItem00 = [CCMenuItemToggle itemWithTarget:self 
                                                               selector:@selector(selectButtonTapped:) items:selectOn00, selectOff00, nil];
       
        
        CCMenuItem *selectOn01 = [CCMenuItemImage itemFromNormalImage:@"select1.png" 
                                                        selectedImage:@"select1.png" target:nil selector:nil];
        CCMenuItem *selectOff01 = [CCMenuItemImage itemFromNormalImage:@"select1Active.png" 
                                                         selectedImage:@"select1Active.png" target:nil selector:nil];
        CCMenuItemToggle *selectItem01 = [CCMenuItemToggle itemWithTarget:self 
                                                                 selector:@selector(selectButtonTapped:) items:selectOn01, selectOff01, nil];
        
        
        CCMenuItem *selectOn02 = [CCMenuItemImage itemFromNormalImage:@"select2.png" 
                                                        selectedImage:@"select2.png" target:nil selector:nil];
        CCMenuItem *selectOff02 = [CCMenuItemImage itemFromNormalImage:@"select2Active.png" 
                                                         selectedImage:@"select2Active.png" target:nil selector:nil];
        CCMenuItemToggle *selectItem02 = [CCMenuItemToggle itemWithTarget:self 
                                                                 selector:@selector(selectButtonTapped:) items:selectOn02, selectOff02, nil];
        
        CCMenuItem *selectItemX = [CCMenuItemImage itemFromNormalImage:@"selectX.png" 
                                                     selectedImage:@"selectXActive.png" 
                                                            target:self selector:@selector(xButtonTapped:)];
        
        
        circleButton = [CircleSliderButtonLayer menuWithRaidus:110 andItems:selectItem00, selectItem01, selectItem02, selectItemX, nil];
        [self addChild:circleButton z:10];
        circleButton.position = ccp(240, 160);
        [circleButton degreeRotation:30];

        
        // add ioButton
    
        onItem = [[CCMenuItemImage itemFromNormalImage:@"ioButtonON.png" 
                                            selectedImage:@"ioButtonON.png" target:nil selector:nil] retain];
        offItem = [[CCMenuItemImage itemFromNormalImage:@"ioButtonOFF.png" 
                                             selectedImage:@"ioButtonOFF.png" target:nil selector:nil] retain];
        CCMenuItemToggle *toggleItem = [CCMenuItemToggle itemWithTarget:self 
                                                               selector:@selector(chipIOButtonTapped:) items:offItem, onItem, nil];
        
        CCMenu *toggleMenu = [CCMenu menuWithItems:toggleItem, nil];
        [self addChild:toggleMenu z:2];
        toggleMenu.anchorPoint = ccp(0.5f, 0.5f);
        toggleMenu.position = ccp(240, 160);
        
        
        // Preload Audio
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"buttonLayerSwichSound.caf"];
        
	
	}
	return self;
}

- (void) selectButtonTapped:(id)sender { 
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"buttonLayerSwichSound.caf"];
    CCLOG(@"WORKING SELECT");
    
}
- (void) chipIOButtonTapped:(id)sender { 
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"buttonLayerSwichSound.caf"];
     CCLOG(@"WORKING IO");
    CCMenuItemToggle *toggleItem = (CCMenuItemToggle *)sender;
    if (toggleItem.selectedItem == onItem) {
        [circleButton openButtons];
    } else if (toggleItem.selectedItem == offItem) {
        [circleButton closeButtons];
        
    }  

}

- (void)xButtonTapped:(id)sender {
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"buttonLayerSwichSound.caf"];
    CCLOG(@"WORKING X");
    for (int i = 0; i < circleButton.items.count-1; i++) {
        CCMenuItemToggle *item = (CCMenuItemToggle *)[circleButton.items objectAtIndex:i];
        [item setSelectedIndex:0];
    }

}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    
    [[SimpleAudioEngine sharedEngine] unloadEffect:@"buttonLayerSwichSound.caf"];
    [onItem release];
    [offItem release];
	
	// don't forget to call "super dealloc"
	[super dealloc];
}


@end
