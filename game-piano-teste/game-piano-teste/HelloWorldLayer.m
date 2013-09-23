//
//  HelloWorldLayer.m
//  game-piano-teste
//
//  Created by Newton Carlos Ouriques Brandalize Junior on 9/21/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer impl ementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		_keyboard = [KeyboardLayer node];
        _keyboard.position = CGPointMake(48.0, 166.0);
        [self addChild:_keyboard];
		
	}
	return self;
}

//-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [[event allTouches] anyObject];
//    CGPoint location = [touch locationInView:[touch view]];
//    location = [[CCDirector sharedDirector] convertToGL:location];
//    
//    NSLog(@"ccTouchesBegan");
//    //CCLOG(@"TOUCH LOCATION: %@", NSStringFromCGPoint(location));
//    
//}

//-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"ccTouchesBegan");
//}
//
//-(void)keyboardLayer:(KeyboardLayer *)keyboardLayer whyKeyPlay:(int)keyId {
//    //[_hero walkWithDirection:direction];
//    NSLog(@"keyboardLayer");
//}
//
//-(void)keyboardLayerTouchEnded:(KeyboardLayer *)keyboardLayer {
//    //
//     NSLog(@"keyboardLayerTouchEnded");
//}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
