using Admin as service from '../../srv/admin-service';
annotate service.ManagerEntity with @(


    UI.SelectionFields:[
        ID,
        Manager_name,
        p_contactEmail
    ],

    UI.LineItem : [
        {
                $Type : 'UI.DataField',
                Label : 'Manager ID',
                Value : ID,
            },
        {
            $Type : 'UI.DataField',
            Label : 'Manager name',
            Value : Manager_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : p_contactEmail,
        },
    ],
    UI.HeaderInfo:{
        TypeName: 'Manager',
        TypeNamePlural: 'Managers',
    },

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Manager ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Manager name',
                Value : Manager_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : p_contactEmail,
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

