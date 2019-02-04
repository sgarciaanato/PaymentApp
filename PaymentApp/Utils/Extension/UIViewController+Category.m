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
#ifdef __IPHONE_8_0
// suppress these errors until we are ready to handle them
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
#else
// temporarily define an empty NS_DESIGNATED_INITIALIZER so we can use now,
// will be ready for iOS8 SDK
#define NS_DESIGNATED_INITIALIZER
#endif

-(void) showLoading{
    indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [indicator startAnimating];
    });
}

-(void) hideLoading{
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [indicator stopAnimating];
    });
}

-(void) animateEntry {
    
    __block CGFloat timer = 0.5f;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
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
