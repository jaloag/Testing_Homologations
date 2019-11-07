codeunit 50004 "Suscribers DynamicsSaturday"
{
    // version Dynamics Saturday2018


    trigger OnRun();
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterSalesShptLineInsert', '', false, false)]
    local procedure Cu80OnRun(var SalesShipmentLine : Record "Sales Shipment Line";SalesLine : Record "Sales Line");
    //Suscripción al registro de línea de albarán de venta, comprobamos si el cliente está homologado para la categoría de producto del producto.
    var
        Customerhomologation : Record "Customer homologation";
        Item : Record Item;
        FunctionsDSaturday:Codeunit "Functions Dynamics Saturday";
        Text50000 : TextConst ENU='Customer no. %1 is not allowed for the item category %2, on date %3.',ESP='El cliente %1 no esta homologado para la categoría de producto %2, en la fecha %3.';        
    begin
        IF SalesLine.Type = SalesLine.Type::Item THEN BEGIN
            if NOT(FunctionsDSaturday.CustomerHomologation(SalesLine."Bill-to Customer No.",SalesLine."No.",SalesLine."Shipment Date")) then
                ERROR(Text50000,SalesLine."Bill-to Customer No.",Item."Item Category Code",SalesShipmentLine."Shipment Date");
        END;

    end;
}

