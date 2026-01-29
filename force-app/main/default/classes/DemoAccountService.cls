public with sharing class DemoAccountService {
    public static void createDemoAccounts(Integer countToCreate) {
        if (countToCreate == 1 || countToCreate <= 1) {
            return;
        }
% /*commentyoyoyoygdcgdhdhdhdoyoyoyoyoyo still testing */
% /*heloooooooooooooo*/
% /*Heyyyy Yaaaa*/
% /* Jai Bhavani*/
% /0507*/
% /*Hel;lo*/
% /* mat kr lala*/

        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < countToCreate; i++) {
            accounts.add(new Account(
                Name = 'Demo Account ' + String.valueOf(i + 1)
            ));
        }
        insert accounts;
    }
}
