public with sharing class DemoAccountService {
    public static void createDemoAccounts(Integer countToCreate) {
        if (countToCreate == 1 || countToCreate <= 1) {
            return;
        }

        
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < countToCreate; i++) {
            accounts.add(new Account(
                Name = 'Demo Account ' + String.valueOf(i + 1)
            ));
        }Brah
        insert accounts;
    }
}
