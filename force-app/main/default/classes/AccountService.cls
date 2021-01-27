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
public with sharing class AccountService {
    public Account createAccount( String accountName, String accountNumber, String tickerSymbol ) {
      Integer anExtraValue = 10;
      Account newAcct = new Account(
        Name = accountName,
        AccountNumber = accountNumber,
        TickerSymbol = tickerSymbol
      );
      return newAcct;
    }
  }