//
//  InstallmentViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "InstallmentViewController.h"

@interface InstallmentViewController ()

@property (strong, nonatomic) Installment *installment;
@property (strong, nonatomic) PayerCost *selectedPayerCost;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation InstallmentViewController

NSString * installmentCell = @"installmentCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier: installmentCell];
    
    NSDictionary *parameters = @{
                                 @"amount":self.paymentAmmount,
                                 @"payment_method_id": self.selectedPaymentMethod.id,
                                 @"issuer.id":self.selectedCardIssuer.id
                                 };
    [self showLoading];
    
    [NetworkingManager getInstallment : parameters onSuccess : ^(Installment *installment, NSError *error) {
         
        [self hideLoading];
        
        if (error){
            NSLog(@"Error %@", error.localizedDescription);
        }
        
        self.installment = installment;
        
        if (self.installment.payer_costs.count <= 0){
            [self.navigationController popViewControllerAnimated:YES];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"unWindToPaymentAmmount"]) {
        
        PaymentAmmountViewController *paymentAmmountViewController = segue.destinationViewController;
        paymentAmmountViewController.selectedPaymentMethod = self.selectedPaymentMethod;
        paymentAmmountViewController.selectedCardIssuer = self.selectedCardIssuer;
        paymentAmmountViewController.paymentAmmount = self.paymentAmmount;
        paymentAmmountViewController.selectedPayerCost = self.selectedPayerCost;

        return;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.installment.payer_costs.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedPayerCost = self.installment.payer_costs[indexPath.row];
    [self performSegueWithIdentifier:@"unWindToPaymentAmmount" sender:nil];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:installmentCell forIndexPath:indexPath];
    
    PayerCost *payerCost = [self.installment.payer_costs objectAtIndex:indexPath.row];
    
    cell.textLabel.text = payerCost.recommended_message;
    
    return cell;
    
}
@end
