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

@property (weak, nonatomic) IBOutlet UILabel *paymentCostLabel;
@property (weak, nonatomic) IBOutlet UIImageView *paymentMethodImageView;
@property (weak, nonatomic) IBOutlet UILabel *paymentMethodLabel;

@property (weak, nonatomic) IBOutlet UIImageView *cardIssuerImageView;
@property (weak, nonatomic) IBOutlet UILabel *cardIssuerLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation InstallmentViewController

NSString * installmentCell = @"installmentCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
    [self fetchRequest];
}

-(void) setUpView{
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier: installmentCell];
    self.tableView.tableFooterView = [UIView new];
    [self setTitle:@"Seleccione n° de cuotas"];
    
    [[self.tableView layer] setBorderWidth:1];
    [[self.tableView layer] setBorderColor:UIColor.lightGrayColor.CGColor];
    
    [self.paymentCostLabel setText:[[NSString alloc] initWithFormat:@"Total a pagar %@ $",[self.paymentAmmount stringByReplacingOccurrencesOfString:@"." withString:@","]]];
    [self.paymentMethodImageView sd_setImageWithURL:[NSURL URLWithString:self.selectedPaymentMethod.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [self.paymentMethodLabel setText:self.self.selectedPaymentMethod.name];
    [self.cardIssuerImageView sd_setImageWithURL:[NSURL URLWithString:self.selectedCardIssuer.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [self.cardIssuerLabel setText:self.selectedCardIssuer.name];
    
}

-(void) fetchRequest {
    
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
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [self showMessage:@"No se consiguieron Cuotas"];
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"unWindToPaymentAmmount"]) {
        
        PaymentAmmountViewController *paymentAmmountViewController = segue.destinationViewController;
        paymentAmmountViewController.currentOrder = self.currentOrder;

        return;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.installment.payer_costs.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedPayerCost = self.installment.payer_costs[indexPath.row];
    
    Order *order = [[Order alloc] init];
    order.paymentAmmount = self.paymentAmmount;
    order.selectedPaymentMethod = self.selectedPaymentMethod;
    order.selectedCardIssuer = self.selectedCardIssuer;
    order.selectedPayerCost = self.selectedPayerCost;
    
    self.currentOrder = order;
    
    [self performSegueWithIdentifier:@"unWindToPaymentAmmount" sender:nil];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:installmentCell forIndexPath:indexPath];
    
    PayerCost *payerCost = [self.installment.payer_costs objectAtIndex:indexPath.row];
    
    cell.textLabel.text = payerCost.recommended_message;
    
    return cell;
    
}
@end
