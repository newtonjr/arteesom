//
//  keyboardLayer.h
//  game-piano-teste
//
//  Created by Newton Carlos Ouriques Brandalize Junior on 9/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "KeyBase.h"

//@class KeyboardLayer;
//
//@protocol KeyboardLayerDelegate <NSObject>
//
//-(void)keyboardLayer:(KeyboardLayer *)keyboardLayer whyKeyPlay:(int)keyId;
//-(void)keyboardLayerTouchEnded:(KeyboardLayer *)keyboardLayer;
//
//@end
//<CCTargetedTouchDelegate>

@interface KeyboardLayer : CCLayer {
    
}

//@property(nonatomic,retain)id <KeyboardLayerDelegate> delegate;

@property(nonatomic,strong)CCArray *keys;
@property(nonatomic,retain)KeyBase *key;

@end
