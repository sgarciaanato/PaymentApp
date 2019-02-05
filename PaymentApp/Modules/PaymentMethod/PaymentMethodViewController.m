//
//  PaymentMethodViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "PaymentMethodViewController.h"

@interface PaymentMethodViewController ()

@property (strong, nonatomic) NSArray<PaymentMethod*> *paymentMethods;
@property (strong, nonatomic) PaymentMethod *selectedPaymentMethod;

@end

@implementation PaymentMethodViewController

NSString * paymentMethodCell = @"defaultTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"DefaultTableViewCell" bundle:nil]
         forCellReuseIdentifier:paymentMethodCell];
    self.tableView.tableFooterView = [UIView new];
    
    [self setTitle:@"Seleccione tipo de tarjeta"];
    
    NSDictionary *parameters = @{};
    
    [self showLoading];
    
    [NetworkingManager getPaymentMethod : parameters onSuccess : ^(NSArray<PaymentMethod*> *paymentMethods, NSError *error) {
        
        [self hideLoading];
        
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedPaymentMethod = [self.paymentMethods objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"goToCardIssuer" sender:nil];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DefaultTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:paymentMethodCell forIndexPath:indexPath];
    
    PaymentMethod *paymentMethod = [self.paymentMethods objectAtIndex:indexPath.row];
    
    cell.defaultTextLabel.text = paymentMethod.name;
    
    
    [cell.defaultImageView sd_setImageWithURL:[NSURL URLWithString:paymentMethod.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
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
        cardIssuersViewController.paymentAmmount = self.paymentAmmount;
        
        return;
    }
}


@end
