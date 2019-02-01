//
//  SplashViewController.m
//  PaymentApp
//
//  Created by Samuel on 1/31/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "SplashViewController.h"
#import "NetworkingManager.h"
#import "EndpointStructure.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self performSegueWithIdentifier: @"goToPaymentAmmount" sender: nil];
    
}

@end
