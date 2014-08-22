//
//  ParallaxBlurTests.m
//  ParallaxBlurTests
//
//  Created by pyro2927 on 08/22/2014.
//  Copyright (c) 2014 pyro2927. All rights reserved.
//

#import "JPBFloatingTextViewController.h"

SpecBegin(InitialSpecs)

describe(@"these will pass", ^{
    
    it(@"can initialize", ^{
        expect([[JPBFloatingTextViewController alloc] init]).notTo.beNil();
    });
    
});

SpecEnd
