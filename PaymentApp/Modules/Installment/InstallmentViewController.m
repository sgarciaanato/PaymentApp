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
                                 @"amount":@"100",
                                 @"payment_method_id": self.selectedPaymentMethod.id,
                                 @"issuer.id":self.selectedCardIssuer.id
                                 };
    
    [NetworkingManager getInstallment : parameters onSuccess : ^(Installment *installment, NSError *error) {
        
        if (error){
            NSLog(@"Error %@", error.localizedDescription);
        }
        
        self.installment = installment;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.installment.payer_costs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:installmentCell forIndexPath:indexPath];
    
    PayerCost *payerCost = [self.installment.payer_costs objectAtIndex:indexPath.row];
    
    cell.textLabel.text = payerCost.recommended_message;
    
    return cell;
    
}
@end
