//
//  CircleSliderButtonScene.h
//  ciricleSlideButton
//
//  Created by arjun prakash on 7/5/12.
//  Copyright 2012 CyborgDino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

#import "CircleSliderButtonLayer.h"
@interface CircleSliderButtonScene : CCLayer {
    
    
    CircleSliderButtonLayer *circleButton;
    
    CCMenuItem *onItem; 
    CCMenuItem *offItem;
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end

