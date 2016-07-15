//
//  LKKProgressView.m
//  Pods
//
//  Created by Lazy on 2016/7/15.
//
//

#import "LKKProgressView.h"

@interface LKKProgressView ()

@property (nonatomic) UIView *indicatorView;

@end

@implementation LKKProgressView{
    CGFloat _lastRecordedProgress;
}

const static CGFloat kAnimationDuration = 0.5f;

#pragma mark - initializer -

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewsAndConstraints];
    }
    return self;
}

#pragma mark -

#pragma mark - private -

- (void)setupViewsAndConstraints
{
    _indicatorView = [[UIView alloc] init];
    
    [self addSubview:_indicatorView];
}

#pragma mark - getter & setter -

- (void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorView.backgroundColor = indicatorColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    [self.layer setCornerRadius:cornerRadius];
    [_indicatorView.layer setCornerRadius:cornerRadius];
}

- (void)setProgress:(CGFloat)progress
{
    if (progress > 1.0f) {
        progress = 1.0f;
    } else if (progress < 0.0f) {
        progress = 0.0f;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!_animated) {
            _indicatorView.frame = CGRectMake(0, 0, progress * CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        } else {
            _indicatorView.frame = CGRectMake(0, 0, _lastRecordedProgress * CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
            [UIView animateWithDuration:kAnimationDuration animations:^{
                _indicatorView.frame = CGRectMake(0, 0, progress * CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
            }];
        }
        
        _lastRecordedProgress = progress;
    });
}

- (UIView *)indicatorView 
{
	if(!_indicatorView) {
		_indicatorView = [[UIView alloc] init];
	}
	return _indicatorView;
}

@end
