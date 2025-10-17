using Admin as service from '../../../srv/admin-service';
annotate service.BuyerEntity with @(

    UI.SelectionFields:[
        ID,
        buyer_name,
        department,
        b_contactEmail
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Buyer ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Buyer Name',
            Value : buyer_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Department',
            Value : department,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : b_contactEmail,
        },
    ],

    UI.HeaderInfo:{
        TypeName: 'Buyer',
        TypeNamePlural: 'Buyers',
    },

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Buyer ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Buyer Name',
                Value : buyer_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Department',
                Value : department,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : b_contactEmail,
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

