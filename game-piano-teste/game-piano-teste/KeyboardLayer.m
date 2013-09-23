//
//  keyboardLayer.m
//  game-piano-teste
//
//  Created by Newton Carlos Ouriques Brandalize Junior on 9/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "keyboardLayer.h"

@implementation KeyboardLayer

-(id)init {
    if ((self = [super init])) {
        self.isTouchEnabled = YES;
        [self createKeys];
    }
    return self;
}

-(void)createKeys {
    
    int widthIvoryKey = 78;
    int middleIvoryKey = 39;
    
    int ivoryCount = 0;
    int zKey = 0;
    float offsetX = 0.0;
    float offsetY = 0.0;
    BOOL bIvory = true;
    BOOL bEbony = false;
    
    KeyBase * keyPrev = nil;
    KeyBase * key = nil;
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"keyboardaudio" ofType:@"plist"];
    NSArray* names = [NSArray arrayWithContentsOfFile:plistPath];
    
    _keys = [[CCArray alloc] initWithCapacity:[names count]];
    
    // Load Audio
    for (int i = 0; i < [names count]; i++) {

        
        if (i == 5) {
            bEbony = true;
        }
        
        if ((i % 2) == 0) {
            bIvory = !bEbony;
        } else {
            bIvory = bEbony;
        }
        
        if (bIvory) {
            key = [KeyBase keyBaseWithFile:@"ivory_keyup.png" fileNameDown:@"ivory_keydown.png" keyid:i];
            
            offsetX = widthIvoryKey * ivoryCount;
            offsetY = 0.0;
            
            ivoryCount += 1;
            zKey = 0;
            
        } else {
            key = [KeyBase keyBaseWithFile:@"ebony_keyup.png" fileNameDown:@"ebony_keydown.png" keyid:i];
            [key setEbonyKey:TRUE];
            
            offsetX += middleIvoryKey;
            offsetY = 73;
            zKey = 1;
        }
        
        if (keyPrev != nil) {
            [keyPrev setKeyNext:key];
        }
        [key setKeyPrev:keyPrev];
        
        
        key.position = ccp(offsetX, offsetY);
        
        // Load Audio
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:names[i] ofType:@"aif"]], &soundID);
        NSNumber* audioId = @(soundID);
        key.audio = audioId;
        
        [_keys addObject:key];
        [self addChild:key z:zKey];
        
        keyPrev = key;
    }
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self ccTouchesMoved:touches withEvent:event];
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    KeyBase *key;
    KeyBase *keyTemp;
    
    BOOL keyIsPressed = NO;
    BOOL ignore = NO;
    
    CCARRAY_FOREACH(_keys, key) {
        keyIsPressed = NO;
        for ( UITouch* touch in touches ) {
            CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
            
            CGRect rect = CGRectMake(self.position.x+key.position.x+[key Rect].origin.x, self.position.y+key.position.y+[key Rect].origin.y, [key width], [key height]);
            
            if (CGRectContainsPoint(rect, location)) {
                ignore = NO;
                if (!key.isEbonyKey) {
                    
                    keyTemp = [key getKeyNext];
                    if (keyTemp != nil && keyTemp.isEbonyKey) {
                        CGRect rect = CGRectMake(self.position.x+keyTemp.position.x+[keyTemp Rect].origin.x, self.position.y+keyTemp.position.y+[keyTemp Rect].origin.y, [keyTemp width], [keyTemp height]);
                        
                         if (CGRectContainsPoint(rect, location)) {
                             ignore = YES;
                         }
                    }
                    
                    keyTemp = [key getKeyPrev];
                    if (keyTemp != nil && keyTemp.isEbonyKey) {
                        CGRect rect = CGRectMake(self.position.x+keyTemp.position.x+[keyTemp Rect].origin.x, self.position.y+keyTemp.position.y+[keyTemp Rect].origin.y, [keyTemp width], [keyTemp height]);
                        
                        if (CGRectContainsPoint(rect, location)) {
                            ignore = YES;
                        }
                    }
                }
                
                if (ignore == NO) {
                    keyIsPressed = YES;
                    [key keyPressDown];
                }
                
            } else {
                if (keyIsPressed == NO) {
                    [key keyPressUp];
                }
            }
        }
    }

}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    KeyBase *key;
    for ( UITouch* touch in touches ) {
        CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
        
        KeyBase *keyPressed = nil;
        CCARRAY_FOREACH(_keys, key) {
            
            CGRect rect = CGRectMake(self.position.x+key.position.x+[key Rect].origin.x, self.position.y+key.position.y+[key Rect].origin.y, [key width], [key height]);
            
            if (CGRectContainsPoint(rect, location)) {
                if (keyPressed != nil) {
                    if (!keyPressed.isEbonyKey) {
                        keyPressed = key;
                    }
                } else {
                    keyPressed = key;
                }
            }
        }
        
        if (keyPressed != nil) {
            [keyPressed keyPressUp];
        }

    }
}

@end
