public with sharing class DemoAccountService {
    public static void createDemoAccounts(Integer countToCreate) {
        if (countToCreate == 1 || countToCreate <= 1) {
            return;
        }
% /*commentyoyoyoskjdcgcaiuygygbjbjdwd\ygyggFEJWKHGFIUGIELWHFOyanshihsgafiougeufigW8O7Ddcghdbbdjbwdhdhdhdoyoyoyoyoyo still testing */
% /*helooooooooolewihfoiwheofhwrioh ncgfdyjhtxecsrtysa4tgiuqbqwkjbdkahoihf oieaho; iyhODICbwatsiuvrbelwiuaVRCIW7UEBVT5CQ78IWEUBCTIR3 UHSRBYVNTJHFKVB G NBGTRHEFMJNRGRENVWEIR EULTYUEIWOPOraviulecyeiluwwbciasyvcuwyasvrc tweycvecreuwyicnt8rwb47evcfrtwycj,dabfkjewbkljkfhbuehafkjbsekufghseiugifhwleihfliwehfhweooogdghgdhofggghvhgoo*/
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
