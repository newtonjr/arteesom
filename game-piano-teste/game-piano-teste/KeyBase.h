//
//  keyBase.h
//  game-piano-teste
//
//  Created by Newton Carlos Ouriques Brandalize Junior on 9/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioServices.h>
#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface KeyBase : CCSprite {
    CCSprite * _down;
    CCSprite * _up;
    
    bool _playing;
    bool _ebony;
    int _keyId;
    
    KeyBase * _prev;
    KeyBase * _next;
}

@property (nonatomic, strong) NSNumber * audio;

+(id)keyBaseWithFile:(NSString *)fileNameUp fileNameDown:(NSString *)fileNameDown keyid:(int)key;
-(id)initWithFile:(NSString *)filenameUp fileNameDown:(NSString *)fileNameDown keyid:(int)key;
-(CGFloat) width;
-(CGFloat) height;
-(CGRect) Rect;

-(void)keyPressDown;
-(void)keyPressUp;

-(void)setEbonyKey:(BOOL)isEbony;
-(bool)isEbonyKey;

-(bool)isPressed;

-(void)setKeyPrev:(KeyBase*)key;
-(void)setKeyNext:(KeyBase*)key;
-(KeyBase*)getKeyPrev;
-(KeyBase*)getKeyNext;

@end
