#import <UIKit/UIKit.h>

@interface NYSegmentIndicator : UIView

@property (nonatomic) CGFloat cornerRadius;

@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) UIColor *borderColor;

@property (nonatomic) BOOL drawsGradientBackground;
@property (nonatomic) BOOL drawsGradientHorizontally;
@property (nonatomic) UIColor *gradientTopColor;
@property (nonatomic) UIColor *gradientBottomColor;

@end
