using Admin as service from '../../srv/admin-service';
annotate service.WorkerEntity with @(

    UI.SelectionFields:[
        ID,
        worker_name,
        w_email
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Worker ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Worker Name',
            Value : worker_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : w_email,
        },
    ],

    UI.HeaderInfo:{
        TypeName: 'Worker',
        TypeNamePlural: 'Workers',
    },

    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Worker ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Worker Name',
                Value : worker_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : w_email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email',
                Value : w_email,
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

annotate service.WorkerEntity with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'SupplierEntity',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'supplier_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 's_contactEmail',
            },
        ],
    }
};

