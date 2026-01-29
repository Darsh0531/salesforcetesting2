public with sharing class DemoAccountService {
    public static void createDemoAccounts(Integer countToCreate) {
        if (countToCreate == 1 || countToCreate <= 1) {
            return;
        }
% /*commentyoyoyoskjdcgcaiuygygbjbjdwd\ygyggdcghdbbdjbwdhdhdhdoyoyoyoyoyo still testing */
% /*helooooooooocj,dabfkjewbklfhwleihfliwehfhweooogdghgdhofggghvhgoo*/
% /*Darshdfdfugckdugckrh*/
% /*Heyyyy Yaaaa*/
% /* Jai Bhavani*/
%/* ghdgwgdywdghghjd */

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
