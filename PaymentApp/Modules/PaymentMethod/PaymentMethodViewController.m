//
//  PaymentMethodViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "PaymentMethodViewController.h"
#import "NetworkingManager.h"
#import "PaymentMethod.h"
#import "CardIssuersViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface PaymentMethodViewController ()

@property (strong, nonatomic) NSArray<PaymentMethod*> *paymentMethods;
@property (strong, nonatomic) PaymentMethod *selectedPaymentMethod;

@end

@implementation PaymentMethodViewController

NSString * paymentMethodCell = @"paymentMethodCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier: paymentMethodCell];
    
    NSDictionary *parameters = @{};
    
    [NetworkingManager getPaymentMethod : parameters onSuccess : ^(NSArray<PaymentMethod*> *paymentMethods, NSError *error) {
        
        if (error){
            NSLog(@"Error %@", error.localizedDescription);
        }
        
        self.paymentMethods = paymentMethods;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.paymentMethods.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedPaymentMethod = [self.paymentMethods objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"goToCardIssuer" sender:nil];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:paymentMethodCell forIndexPath:indexPath];
    
    PaymentMethod *paymentMethod = [self.paymentMethods objectAtIndex:indexPath.row];
    
    cell.textLabel.text = paymentMethod.name;
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:paymentMethod.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (cacheType != SDImageCacheTypeMemory){
            [self.tableView reloadRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
        }
    }];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"goToCardIssuer"]) {
        
        CardIssuersViewController *cardIssuersViewController = segue.destinationViewController;
        cardIssuersViewController.selectedPaymentMethod = self.selectedPaymentMethod;
        
        return;
    }
}


@end
