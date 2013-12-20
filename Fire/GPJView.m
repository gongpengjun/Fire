//
//  GPJView.m
//  Fire
//
//  Created by 巩 鹏军 on 13-12-20.
//  Copyright (c) 2013年 巩 鹏军. All rights reserved.
//

#import "GPJView.h"

// Reference: http://nsscreencast.com/episodes/100-particle-systems

@implementation GPJView

+ (Class)layerClass {
    return [CAEmitterLayer class];
}

- (void)awakeFromNib {
    CAEmitterLayer *emitter = (CAEmitterLayer *)self.layer;
    emitter.emitterShape = kCAEmitterLayerPoint;
    emitter.renderMode = kCAEmitterLayerOldestLast;
    emitter.emitterPosition = CGPointMake(self.frame.size.width / 2 , self.frame.size.height*3/5);
    emitter.emitterCells = @[[self starsEmitterCell], [self fireEmitterCell]];
}

// Creating fire particles lazily
- (CAEmitterCell*)fireEmitterCell {
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    fire.contents = (id)[[UIImage imageNamed:@"particle.png"] CGImage];
    fire.contentsRect = CGRectMake(0, 0, 1.0, 1.0);
    fire.birthRate = 13.0;
    fire.lifetime = 5.0;
    fire.velocity = 40;
    fire.velocityRange = 10;
    
    fire.scale = 1.0;
    fire.scaleRange = 0.1;
    fire.scaleSpeed = 0.2;
    
    fire.alphaRange = 0.2;
    fire.alphaSpeed = -0.2;
    
    fire.emissionLongitude = -M_PI_2;
    fire.emissionRange = M_PI / 8;
    fire.color = [[UIColor colorWithRed:0.95 green:0.6 blue:0.2 alpha:0.9] CGColor];
    fire.redRange = 0.1;
    fire.greenSpeed = -0.2;
    fire.blueSpeed = -0.2;
    return fire;
}

// Creating a star fountain lazily
- (CAEmitterCell*)starsEmitterCell {
    CAEmitterCell *stars = [CAEmitterCell emitterCell];
    stars.contents = (id)[[UIImage imageNamed:@"star.png"] CGImage];
    stars.contentsRect = CGRectMake(0, 0, 1, 1);
    stars.birthRate = 60;
    stars.lifetime = 10;
    stars.velocity = 200;
    stars.scale = 0.2;
    stars.scaleSpeed = -0.05;
    stars.emissionLongitude = -M_PI_4;
    stars.emissionRange = M_PI /16;
    stars.yAcceleration = 40;
    stars.alphaSpeed = -0.2;
    return stars;
}

@end
