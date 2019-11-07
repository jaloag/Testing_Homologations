table 50000 "Customer homologation"
{
    // version DynamicsSaturday2018
    // Tabla con las homologaciones entre clientes y categorías de producto, con fecha de caducidad.

    CaptionML = ENU='Customer homologation',
                ESP='Homologación de cliente';

    fields
    {
        field(1;"Customer no.";Code[20])
        {
            CaptionML = ENU='Customer no.',
                        ESP='No. cliente';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(2;"Item category code";Code[20])
        {
            CaptionML = ENU='Item category code',
                        ESP='Cod. categoría prod.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;
        }
        field(3;"Expiration date";Date)
        {
            CaptionML = ENU='Expiration date',
                        ESP='Fecha caducidad';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Customer no.","Item category code")
        {
        }
    }

    fieldgroups
    {
    }
}

