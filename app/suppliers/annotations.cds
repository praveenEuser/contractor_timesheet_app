using Admin as service from '../../srv/admin-service';
annotate service.SupplierEntity with @(

    UI.SelectionFields:[
        ID,
        supplier_name,
        s_contactEmail
    ],

    UI.LineItem : [
        {
                $Type : 'UI.DataField',
                Label : 'Supplier ID',
                Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Supplier Name',
            Value : supplier_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : s_contactEmail,
        },
    ],
    UI.HeaderInfo:{
        TypeName: 'Supplier',
        TypeNamePlural: 'Suppliers',
    },
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Supplier ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Supplier Name',
                Value : supplier_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : s_contactEmail,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
);

