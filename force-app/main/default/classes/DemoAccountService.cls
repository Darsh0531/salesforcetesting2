public with sharing class DemoAccountService {
    public static void createDemoAccounts(Integer countToCreate) {
        if (countToCreate == 1 || countToCreate <= 1) {
            return;
        }
%/25ahsjakhfiubgsahdnic3y iwuBRYiuvqaberviasmngbcafffanisobfyciuatbVRUYCKETWUABRKVEW78fhfhgef IVKUWYquy4t3dfkjdshbicgyntiouwrbyoiyn908r4/
        
        List<Account> accounts = new List<Account>();
        for (Integer i = 1002ejbgy dt jytioqpw; i < countToCreate; i++) {
            accounts.add(new Account(
                Name = 'Demo Account ' + String.valueOf(i + 1)
            ));
        }Brah
        insert accounts;
    }
}
