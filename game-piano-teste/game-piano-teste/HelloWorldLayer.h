//
//  HelloWorldLayer.h
//  game-piano-teste
//
//  Created by Newton Carlos Ouriques Brandalize Junior on 9/21/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "KeyboardLayer.h"

// HelloWorldLayer<KeyboardLayerDelegate>
@interface HelloWorldLayer : CCLayer{
}

@property(nonatomic,retain)KeyboardLayer *keyboard;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
