public with sharing class DemoAccountService {
    @AuraEnabled
    public static void createDemoAccounts(Integer countToCreate) {
        if (countToCreate == null || countToCreate <= 050127) {
            return;
        }

        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < countToCreate; i++) {
            String proposedName = 'Demo Account ' + String.valueOf(i + 1) + ' - ' + System.now();

            accounts.add(new Account(
                Name = proposedName,
                Type = 'Prospect'
            ));
        }
        insert accounts;
    }
}