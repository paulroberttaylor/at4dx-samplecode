@isTest
private class CreateAccountControllerTest {

    @isTest
    static void givenComponentWhenCreateWithNameThenNewAccountIsCreated()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IAccountsService mockAccountsService = (IAccountsService) mocks.mock( IAccountsService.class );

        mocks.startStubbing();
            String testAccountName = 'Amanda Lorian';
            Id expectedId = fflib_IDGenerator.generate( Account.SObjectType);
            mocks.when( mockAccountsService.createWithName(testAccountName) ).thenReturn(expectedId);
        mocks.stopStubbing();

        Application.Service.setMock(IAccountsService.class, mockAccountsService);

        Test.startTest();
            Id actualId = AccountsService.createWithName(testAccountName);
        Test.stopTest();

        System.assertEquals(expectedId, actualId, 'The account id should have been ' + expectedId + ' but was ' + actualId + '.');

        ((IAccountsService) mocks.verify( mockAccountsService)).createWithName(testAccountName);
    }
}
