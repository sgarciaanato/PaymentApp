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
    
    [self.paymentAmmountLabel setText:[[NSString alloc] initWithFormat:@"%@ $",self.paymentAmmount]];
    
    [self.paymentMethodImageView sd_setImageWithURL:[NSURL URLWithString:self.selectedPaymentMethod.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    [self.paymentMethodLabel setText:self.selectedPaymentMethod.name];
    
    [self.cardIssuerImageView sd_setImageWithURL:[NSURL URLWithString:self.selectedCardIssuer.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    [self.cardIssuerLabel setText:self.self.selectedCardIssuer.name];
    [self.recommendedMessageLabel setText:self.selectedPayerCost.recommended_message];
    
}
- (IBAction)closePopUp:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
