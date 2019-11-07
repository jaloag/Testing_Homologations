codeunit 50001 "Test Saturday2"
{

    Subtype = Test;    

    [Test]
    procedure HomologationCustomerItem();
    // Test de que un cliente con homologación no debe dar error.
    var
        CustomerNo : Code[20];
        ItemNo:Code[20];
        FunctionsDynamicsSaturday: Codeunit "Functions Dynamics Saturday";
        
    begin

        CustomerNo := CreateCustomer;
        ItemNo := CreateItem;

        CreateHomologation(CustomerNo,ItemNo,WORKDATE);

        IF NOT(FunctionsDynamicsSaturday.CustomerHomologation(CustomerNo,ItemNo,WORKDATE)) THEN
            ERROR('Customer no. %1 is not allowed for the item category %2, on date %3.',CustomerNo,ItemNo,WORKDATE);  
    end;

    [Test]  
    procedure HomologationCustomerItemEmpty()
    // Test de que un cliente sin homologación debe dar error.
    var
        CustomerNo : Code[20];
        ItemNo : Code[20];
        FunctionsDynamicsSaturday : Codeunit "Functions Dynamics Saturday";
    begin
        CustomerNo := CreateCustomer;
        ItemNo := CreateItem;

        IF NOT(FunctionsDynamicsSaturday.CustomerHomologation(CustomerNo,ItemNo,WORKDATE)) THEN 
            ASSERTERROR ERROR('Customer no. %1 is not allowed for the item category %2, on date %3.',CustomerNo,ItemNo,WORKDATE);          
    end;

    [Test]     
    procedure HomologationCuastomerItemExpiration()
    // Test de que un cliente con homologación caducada debe dar error.
    var
        CustomerNo : Code[20];
        ItemNo : Code[20];
        FunctionsDynamicsSaturday : Codeunit "Functions Dynamics Saturday";
    begin
        CustomerNo := CreateCustomer;
        ItemNo := CreateItem;

        CreateHomologation(CustomerNo,ItemNo,WORKDATE);

        IF NOT(FunctionsDynamicsSaturday.CustomerHomologation(CustomerNo,ItemNo,CALCDATE('+1M',WORKDATE))) THEN
            ASSERTERROR ERROR('Customer no. %1 is not allowed for the item category %2, on date %3.',CustomerNo,ItemNo,CALCDATE('+1M',WORKDATE));          
    end;

    local procedure CreateCustomer():Code[20]
    var
        Customer: Record Customer;
    begin
        Customer.INIT;
        Customer.Validate(Name,'Test Customer name');
        Customer.INSERT(TRUE);

        exit(Customer."No.");
    end;

    local procedure CreateItem():Code[20]
    var
        Item: record item;
        ItemCategory : Record "Item Category";
    begin
        Item.INIT;
        Item.VALIDATE(Description,'Test Item');
        ItemCategory.FINDFIRST;
        Item.VALIDATE("Item Category Code",ItemCategory.Code);
        Item.INSERT(TRUE);

        EXIT(Item."No.");
    end;

    local procedure CreateHomologation(CustomerNo:Code[20];ItemNo:Code[20];Date:Date)
    var
        Item: Record item;
        CustomerHomologation: Record "Customer homologation";
    begin
        Item.GET(ItemNo);

        Customerhomologation.INIT;
        Customerhomologation.VALIDATE("Customer no.",CustomerNo);
        Customerhomologation.VALIDATE("Item category code",Item."Item Category Code");
        Customerhomologation.VALIDATE("Expiration date",Date);
        Customerhomologation.INSERT;    
    end;

}








