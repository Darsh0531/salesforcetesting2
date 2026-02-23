public with sharing class QuickAccountController {
    @AuraEnabled
    public static Account createAccount(String name, String phone, String industry, 
                                      Decimal annualRevenue, String accountNumber, 
                                      String website, Integer employees, String billingCity) {
        try {
            // Jataka Recommended Pattern: Check Custom Permission before validation
            if (!FeatureManagement.checkPermission('Allow_Low_Revenue_Creation')) {
                // Get threshold from Custom Metadata for configurability
                Enterprise_Settings__mdt settings = Enterprise_Settings__mdt.getInstance('Default');
                Decimal revenueThreshold = settings != null ? settings.Minimum_Revenue_Threshold__c : 1000000;
                
                if (annualRevenue != null && annualRevenue < revenueThreshold) {
                    throw new AuraHandledException('Enterprise Accounts require $' + revenueThreshold.format() + '+ Revenue.');
                }
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