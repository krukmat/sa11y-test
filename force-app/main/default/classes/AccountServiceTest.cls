/**
 * @description       : 
 * @author            : Matias Kruk
 * @group             : 
 * @last modified on  : 01-20-2021
 * @last modified by  : Matias Kruk
 * Modifications Log 
 * Ver   Date         Author        Modification
 * 1.0   01-14-2021   Matias Kruk   Initial Version
**/
@IsTest
private class AccountServiceTest {
  @IsTest
  static void test_should_create_account() {
    String acctName = 'Salesforce';
    String acctNumber = 'SFDC';
    String tickerSymbol = 'CRM';
    Test.startTest();
      AccountService service = new AccountService();
      Account newAcct = service.createAccount( acctName, acctNumber, tickerSymbol );
      insert newAcct;
    Test.stopTest();
    List<Account> accts = [ SELECT Id, Name, AccountNumber, TickerSymbol FROM Account WHERE Id = :newAcct.Id];
    System.assertEquals( acctName, accts[0].Name, 'incorrect name' );
    System.assertEquals( acctNumber, accts[0].AccountNumber, 'account number' );
    System.assertEquals( tickerSymbol, accts[0].TickerSymbol, 'incorrect ticker symbol' );
  }

  @isTest
  static void test_should_create_accounts() {
    String acctName = 'Salesforce';
    String acctNumber = 'SFDC';
    String tickerSymbol = 'CRM';
    Test.startTest();
      AccountService service = new AccountService();
      List<Account> newAccts = new List<Account>();
      for (Integer i=1; i<30; i++){
        String suffix = ' ' + String.valueOf(i);
        Account newAcct = service.createAccount( acctName + suffix, acctNumber + suffix, tickerSymbol + suffix );
        newAccts.add(newAcct);
      }
      insert newAccts;
    Test.stopTest();
    List<Account> accts = [ SELECT Id, Name, AccountNumber, TickerSymbol FROM Account];
    System.assertEquals( 29, accts.size(), 'should have found new accounts' );
  }
}