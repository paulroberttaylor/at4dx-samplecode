public with sharing class CreateAccountController {

    @AuraEnabled(cacheable=true)
    public static Id createAccount(String accountName){
        try {
            throw new AuraHandledException('pending');
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
