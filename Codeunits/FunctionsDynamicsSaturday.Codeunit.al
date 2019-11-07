codeunit 50003 "Functions Dynamics Saturday"
{
    procedure CustomerHomologation(CustomerNo:Code[20];ItemNo:Code[20];Date:Date):Boolean;
    // CustomerHomologation comprueba si existe combinación de Cliente/categoría de producto para la fecha indicada.
    var
        Item:Record Item;
        CustomerHomologation: Record "Customer homologation";
    begin
        Item.GET(ItemNo);
        Customerhomologation.SETRANGE("Customer no.",CustomerNo);
        Customerhomologation.SETRANGE("Item category code",Item."Item Category Code");
        Customerhomologation.SETFILTER("Expiration date",'>=%1',Date);
        IF Customerhomologation.FINDSET THEN
            EXIT(TRUE)
        ELSE
            EXIT(FALSE);
    end;

}