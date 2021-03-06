#import "NYSegmentIndicator.h"

@implementation NYSegmentIndicator

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        self.drawsGradientBackground = NO;
        self.opaque = NO;
        self.cornerRadius = 4.0f;
        self.gradientTopColor = [UIColor colorWithRed:0.27f green:0.54f blue:0.21f alpha:1.0f];
        self.gradientBottomColor = [UIColor colorWithRed:0.22f green:0.43f blue:0.16f alpha:1.0f];
        self.borderColor = [UIColor lightGrayColor];
        self.borderWidth = 1.0f;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    if (self.drawsGradientBackground) {
        CAGradientLayer *gradientLayer = (CAGradientLayer *)self.layer;
		gradientLayer.colors = @[(__bridge id)[self.gradientTopColor CGColor],
								 (__bridge id)[self.gradientBottomColor CGColor]];
		if(self.drawsGradientHorizontally) {
			gradientLayer.startPoint = CGPointMake(0, 0.5f);
			gradientLayer.endPoint = CGPointMake(1, 0.5f);
		}
    } else {
        self.layer.backgroundColor = [self.backgroundColor CGColor];
    }
}

#pragma mark - Getters and Setters

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = [borderColor CGColor];
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setDrawsGradientBackground:(BOOL)drawsGradientBackground {
    _drawsGradientBackground = drawsGradientBackground;
    [self setNeedsDisplay];
}

- (void)setDrawsGradientHorizontally:(BOOL)drawsGradientHorizontally {
	_drawsGradientHorizontally = drawsGradientHorizontally;
	[self setNeedsDisplay];
}

- (void)setGradientTopColor:(UIColor *)gradientTopColor {
    _gradientTopColor = gradientTopColor;
    [self setNeedsDisplay];
}

- (void)setGradientBottomColor:(UIColor *)gradientBottomColor {
    _gradientBottomColor = gradientBottomColor;
    [self setNeedsDisplay];
}

@end
