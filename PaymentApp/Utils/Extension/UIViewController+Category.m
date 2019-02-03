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

@end
