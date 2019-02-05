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

@property (weak, nonatomic) IBOutlet UIButton *button1Stars;
@property (weak, nonatomic) IBOutlet UIButton *button2Stars;
@property (weak, nonatomic) IBOutlet UIButton *button3Stars;
@property (weak, nonatomic) IBOutlet UIButton *button4Stars;
@property (weak, nonatomic) IBOutlet UIButton *button5Stars;

@property (strong, nonatomic) IBOutlet NSArray<UIButton *> *buttonsArray;

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpOrder];
    
    [self addButtonsToArray];
    
}

-(void) setUpOrder {
    
    [[self.containerView layer] setCornerRadius: 8];
    
    [self.paymentAmmountLabel setText:[[NSString alloc] initWithFormat:@"Se pagó %@ $", self.currentOrder.paymentAmmount]];
    
    [self.paymentMethodImageView sd_setImageWithURL:[NSURL URLWithString:self.currentOrder.selectedPaymentMethod.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    [self.paymentMethodLabel setText:self.currentOrder.selectedPaymentMethod.name];
    
    [self.cardIssuerImageView sd_setImageWithURL:[NSURL URLWithString:self.currentOrder.selectedCardIssuer.secure_thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    [self.cardIssuerLabel setText:self.currentOrder.selectedCardIssuer.name];
    [self.recommendedMessageLabel setText:self.currentOrder.selectedPayerCost.recommended_message];
    
}

-(void) addButtonsToArray {
    
    self.buttonsArray = [[NSArray alloc] initWithObjects:
                         self.button1Stars,
                         self.button2Stars,
                         self.button3Stars,
                         self.button4Stars,
                         self.button5Stars,nil];
    
    [self placeStars : [self.currentOrder.rate intValue]];
    
}

- (IBAction)setRate:(UIButton *)sender {
    self.currentOrder.rate = [NSNumber numberWithInt:(int)sender.tag];
    [self placeStars : (int)sender.tag];
}

-(void) placeStars : (int) rate {
    for(UIButton *button in _buttonsArray){
        if(button.tag <= rate){
            [button setImage: [UIImage imageNamed:@"icon-5-star"] forState:UIControlStateNormal];
        }else{
            [button setImage: [UIImage imageNamed:@"icon-0-star"] forState:UIControlStateNormal];
        }
    }
}

- (IBAction)saveAction:(UIButton *)sender {
    [OrderManager saveOrder: self.currentOrder];
    [self notifyUpdate];
    [self dismissViewControllerAnimated:false completion:nil];
}


-(void)notifyUpdate{
    if ([self.delegate respondsToSelector:@selector(updateOrder:)]) {
        [self.delegate updateOrder:self.currentOrder];
    }
}

- (IBAction)closePopUp:(UIButton *)sender {
    [self dismissViewControllerAnimated:false completion:nil];
}

@end
