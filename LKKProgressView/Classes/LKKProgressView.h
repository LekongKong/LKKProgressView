//
//  LKKProgressView.h
//  Pods
//
//  Created by Lazy on 2016/7/15.
//
//

#import <UIKit/UIKit.h>

@interface LKKProgressView : UIView

/**
 *  The indicator color of progress view.
 */
@property (nonatomic) UIColor *indicatorColor UI_APPEARANCE_SELECTOR;


/**
 *  The corner radius of progress view.
 */
@property (nonatomic) CGFloat cornerRadius UI_APPEARANCE_SELECTOR;


/**
 *  The progress of progress view, the value should be varied between 0 and 1.
 */
@property (nonatomic) CGFloat progress;


/**
 *  If it's set to YES, each time the progress value change, the progress bar will perform 
 *  an animated transition.
 */
@property (nonatomic) BOOL animated;

@end
