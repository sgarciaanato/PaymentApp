//
//  PaymentAmmountViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "PaymentAmmountViewController.h"

@interface PaymentAmmountViewController ()
@property (weak, nonatomic) IBOutlet UITextField *ammountTextField;

@end

@implementation PaymentAmmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)unwindToPaymentAmmountViewController:(UIStoryboardSegue *)unwindSegue{
    NSLog(@"%@,%@,%@,%@",
          self.paymentAmmount,
          self.selectedPaymentMethod.id,
          self.selectedCardIssuer.id,
          self.selectedPayerCost.recommended_message);
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self performSegueWithIdentifier:@"goToOrderDetail" sender:nil];
    });
    
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if ([identifier isEqualToString:@"goToPaymentMethod"] && ![self.ammountTextField.text  isEqual: @""] && self.ammountTextField.text.length > 0) {
        return true;
    }
    return false;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"goToPaymentMethod"]) {
        
        PaymentMethodViewController *paymentMethodViewController = segue.destinationViewController;
        paymentMethodViewController.paymentAmmount = self.ammountTextField.text;
        
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
        
        return;
    }
    
    if ([[segue identifier] isEqualToString:@"goToOrderDetail"]) {
        
        PaymentAmmountViewController *paymentAmmountViewController = segue.destinationViewController;
        paymentAmmountViewController.selectedPaymentMethod = self.selectedPaymentMethod;
        paymentAmmountViewController.selectedCardIssuer = self.selectedCardIssuer;
        paymentAmmountViewController.paymentAmmount = self.paymentAmmount;
        paymentAmmountViewController.selectedPayerCost = self.selectedPayerCost;
        
        return;
    }
}


@end
