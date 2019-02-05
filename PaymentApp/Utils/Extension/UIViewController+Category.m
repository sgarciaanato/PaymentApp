//
//  UIViewController+Category.m
//  PaymentApp
//
//  Created by Samuel on 2/2/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

UIActivityIndicatorView *indicator;
LOTAnimationView *animation;

-(void) showLoading{
    animation = [LOTAnimationView animationNamed:@"loading"];
    [animation setFrame:CGRectMake((self.view.frame.size.width / 2) - 100, (self.view.frame.size.height / 2) - 100, 200, 200)];
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self.view addSubview:animation];
        [animation play];
    });
}

-(void) hideLoading{
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [animation stop];
        [animation removeFromSuperview];
    });
}

-(void) showMessage : (NSString *) message{
    CGRect startContainerFrame = CGRectMake((self.view.frame.size.width - 300 ) / 2, - 100, 300, 100);
    CGRect finishContainerFrame = CGRectMake((self.view.frame.size.width - 300 ) / 2, (self.view.frame.size.height - 100 ) / 2, 300, 100);
    CGRect labelFrame = CGRectMake(0, 30, 300, 40);
    UIView *containerView = [[UIView alloc] initWithFrame:startContainerFrame];
    [containerView.layer setCornerRadius:8];
    [containerView setBackgroundColor:UIColor.redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    [label setTextAlignment:NSTextAlignmentCenter];
    label.text = message;
    [label setTextColor:UIColor.whiteColor];
    [containerView addSubview:label];
    [self.parentViewController.view addSubview:containerView];
    
    
    [UIView animateWithDuration:0.4f animations:^{
        [containerView setFrame:finishContainerFrame];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration: 0.4f delay: 2.0 options:UIViewAnimationOptionTransitionNone animations:^{
            [containerView setFrame: startContainerFrame];
        } completion:nil];
    }];
}

-(void) animateEntry {
    
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;

    if(statusBarHeight != 20){
        return;
    }
    
    __block CGFloat timer = 0.5f;
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        
        NSMutableArray <UIView*> *arraySubViews = [self getArraySubViews:self.view parentArrayView:[[NSMutableArray alloc] init]];
        
        for(UIView *view in arraySubViews.reverseObjectEnumerator){
            timer = timer + 0.2F;
            
            [view setFrame:CGRectMake(
                                      view.frame.origin.x - self.view.frame.size.width,
                                      view.frame.origin.y,
                                      view.frame.size.width,
                                      view.frame.size.height)];
            
        }
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSMutableArray <UIView*> *arraySubViews = [self getArraySubViews:self.view parentArrayView:[[NSMutableArray alloc] init]];
        
        [self getBlocks:arraySubViews]();
        
    });
    
}

-(NSMutableArray <UIView*> *) getArraySubViews : (UIView *) view parentArrayView : (NSMutableArray <UIView*> *) parentArrayView {
    
    if(view.subviews.count == 0){
        return parentArrayView;
    }
    
    for(UIView *subview in view.subviews){
        [parentArrayView insertObject:subview atIndex:0];
        [self getArraySubViews:subview parentArrayView:parentArrayView];
    }
    
    return parentArrayView;
    
}

-(void (^)(void)) getBlocks : (NSMutableArray <UIView *> *) arrayView {
    
    UIView *view = arrayView.lastObject;
    
    void (^block)(void) = ^{
        
        [UIView animateWithDuration:0.2f animations:^{
            [view setFrame:CGRectMake(
                                      view.frame.origin.x + self.view.frame.size.width,
                                      view.frame.origin.y,
                                      view.frame.size.width,
                                      view.frame.size.height)];
        } completion:^(BOOL finished) {
            [arrayView removeLastObject];
            if(arrayView.count > 0){
                [self getBlocks: arrayView]();
            }
        }];
        
    };
    
    return block;
}


@end
