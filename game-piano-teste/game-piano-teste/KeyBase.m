//
//  keyBase.m
//  game-piano-teste
//
//  Created by Newton Carlos Ouriques Brandalize Junior on 9/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "KeyBase.h"

@implementation KeyBase

+(id)keyBaseWithFile:(NSString *)fileNameUp fileNameDown:(NSString *)fileNameDown keyid:(int)key {
    return [[self alloc] initWithFile:fileNameUp fileNameDown:fileNameDown keyid:key];
}

-(id)initWithFile:(NSString *)fileNameUp fileNameDown:(NSString *)fileNameDown keyid:(int)key {
    if ((self = [super init])) {
        
        _down = [CCSprite spriteWithFile:fileNameDown];
        [_down setVisible:FALSE];
        [self addChild:_down z:1];
        
        _up = [CCSprite spriteWithFile:fileNameUp];
        [self addChild:_up z:0];
        
        _keyId = key;
        _prev = nil;
        _next = nil;
        _playing = false;
        //[self scheduleUpdate];
    }
    return self;
}

-(void)keyPressDown {
    [_down setVisible:TRUE];
    
    if (_playing == false) {
        _playing = true;
    
        SystemSoundID soundID = [_audio unsignedLongValue];
        AudioServicesPlaySystemSound(soundID);
    }
}
-(void)keyPressUp {
    [_down setVisible:FALSE];
    _playing = false;
}

-(CGFloat) width {
    return [_up boundingBox].size.width;
}

-(CGFloat) height {
    return [_up boundingBox].size.height;
}

-(CGRect) Rect {
    return [_up boundingBox];
}

-(void)setEbonyKey:(BOOL)isEbony {
    _ebony = isEbony;
}

-(bool)isEbonyKey {
    return _ebony;
}

-(bool)isPressed {
    return _down.visible;
}

-(void)setKeyPrev:(KeyBase*)key {
    _prev = key;
}

-(void)setKeyNext:(KeyBase*)key {
    _next = key;
}

-(KeyBase*)getKeyPrev {
   return _prev;
}

-(KeyBase*)getKeyNext {
   return _next;
}

@end
