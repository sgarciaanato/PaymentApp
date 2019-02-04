//
//  OrderDetailViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/2/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "OrderDetailViewController.h"

@interface OrderDetailViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *paymentAmmountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *paymentMethodImageView;
@property (weak, nonatomic) IBOutlet UILabel *paymentMethodLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardIssuerImageView;
@property (weak, nonatomic) IBOutlet UILabel *cardIssuerLabel;
@property (weak, nonatomic) IBOutlet UILabel *recommendedMessageLabel;

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self.containerView layer] setCornerRadius: 8];
    
    [self.paymentAmmountLabel setText:[[NSString alloc] initWithFormat:@"%@ $", self.currentOrder.paymentAmmount]];
    
    [self.paymentMethodImageView sd_setImageWithURL:[NSURL URLWithString:self.currentOrder.selectedPaymentMethod.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    [self.paymentMethodLabel setText:self.currentOrder.selectedPaymentMethod.name];
    
    [self.cardIssuerImageView sd_setImageWithURL:[NSURL URLWithString:self.currentOrder.selectedCardIssuer.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    [self.cardIssuerLabel setText:self.self.currentOrder.selectedCardIssuer.name];
    [self.recommendedMessageLabel setText:self.currentOrder.selectedPayerCost.recommended_message];
    
}

- (IBAction)closePopUp:(UIButton *)sender {
    [self dismissViewControllerAnimated:false completion:nil];
}

@end
