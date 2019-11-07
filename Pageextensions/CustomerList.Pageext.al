pageextension 50001 pageextension50001 extends "Customer List" 
{
    // version NAVW111.00.00.21836,NAVES11.00.00.21836,DynamicsSaturday2018
    // Añadimos acción a la lista de homologaciones.
    actions
    {
        addafter(ApprovalEntries)
        {
            action(Homologations)
            {
                ApplicationArea = All;
                CaptionML = ENU='Homologations',
                            ESP='Homologaciones';
                Image = UserCertificate;
                RunObject = page 50000;
                RunPageLink = "Customer no." = field("No.");
                //RunPageLink = Customer no.=FIELD(No.);
            }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

