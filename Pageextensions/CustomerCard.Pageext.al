pageextension 50000 pageextension50000 extends "Customer Card" 
{
    // version NAVW111.00.00.21836,NAVES11.00.00.21836,DynamicsSaturday2018
    // Añadimos acción a la lista de Homologaciones.
    actions
    {
        addafter(CustomerReportSelections)
        {
            action(Homologations)
            {
                ApplicationArea = All;
                CaptionML = ENU='Homologations',
                            ESP='Homologaciones';
                Image = UserCertificate;
                RunObject = Page 50000;
                RunPageLink = "Customer no."=field("No.");                
                //RunPageLink = Customer no.=FIELD(No.);
                
            }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

