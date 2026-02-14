public with sharing class QuickAccountController {
    @AuraEnabled
    public static Account createAccount(String name, String phone, String industry, 
                                      Decimal annualRevenue, String accountNumber, 
                                      String website, Integer employees, String billingCity) {
        try {
            // Validation: Ensure Enterprise accounts have AnnualRevenue >= 1,000,000
            if (annualRevenue != null && annualRevenue < 1000000) {
                throw new AuraHandledException('Enterprise accounts must have Annual Revenue of at least $1,000,000. Current revenue: $' + annualRevenue.format());
            }
            
            Account newAcc = new Account(
                Name = name,
                Phone = phone,
                Industry = industry,
                AnnualRevenue = annualRevenue,
                AccountNumber = accountNumber,
                Website = website,
                NumberOfEmployees = employees,
                BillingCity = billingCity
            );
            insert newAcc;
            return newAcc;
        } catch (Exception e) {
            throw new AuraHandledException('Error creating account: ' + e.getMessage());
        }
    }
}