//
//  PaymentAmmountViewController.m
//  PaymentApp
//
//  Created by Samuel on 2/1/19.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "PaymentAmmountViewController.h"

@interface PaymentAmmountViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *ammountTextField;
@property (weak, nonatomic) IBOutlet UIButton *paymentButton;

@end

@implementation PaymentAmmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self.containerView layer] setCornerRadius: 8];
    [[self.paymentButton layer] setCornerRadius: 8];
    [[self.paymentButton layer] setBorderWidth: 1];
    [[self.paymentButton layer] setBorderColor: UIColor.lightGrayColor.CGColor];
    
    [self animateEntry];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (IBAction)unwindToPaymentAmmountViewController:(UIStoryboardSegue *)unwindSegue{
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        
        [self saveOrder];
        
        [self performSegueWithIdentifier:@"goToOrderDetail" sender:nil];
    });
    
}

-(void) saveOrder {
    
    [OrderManager storeOrder: self.currentOrder];

}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if ([identifier isEqualToString:@"goToPaymentMethod"] && ([self.ammountTextField.text  isEqual: @""] || self.ammountTextField.text.length <= 0)) {
        return false;
    }
    if ([identifier isEqualToString:@"goToOrders"] && ([OrderManager getCurrentOrders].count <= 0)) {
        return false;
    }
    return true;
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
        
        self.ammountTextField.text = @"";
        
        return;
    }
    
    if ([[segue identifier] isEqualToString:@"goToOrderDetail"]) {
        
        OrderDetailViewController *orderDetailViewController = segue.destinationViewController;
        orderDetailViewController.currentOrder = self.currentOrder;
        
        return;
    }
}


@end
