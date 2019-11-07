page 50000 "Customer homologation"
{
    // version DynamicsSaturday2018
    // Page con la lista de homologaciones.

    CaptionML = ENU='Customer homologation',
                ESP='Homologación de cliente';
    PageType = List;
    SourceTable = "Customer homologation";
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer no.";"Customer no.")
                {
                    ApplicationArea = All;
                }
                field("Item category code";"Item category code")
                {
                    ApplicationArea = All;
                }
                field("Expiration date";"Expiration date")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
    }
}

