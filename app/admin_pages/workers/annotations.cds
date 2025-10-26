using Admin as service from '../../../srv/admin-service';
annotate service.WorkerEntity with @(

    UI.SelectionFields:[
        ID,
        worker_name,
        w_email
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Worker Name',
            Value : contractorProfile.contractor.co_name
        },
        {
            $Type : 'UI.DataField',
            Label : 'Skills',
            Value : contractorProfile.contractor.skills
        },
        {
            $Type : 'UI.DataField',
            Label : 'Experience',
            Value : contractorProfile.contractor.experience
        },
        {
            $Type : 'UI.DataField',
            Label : 'Resume',
            Value : contractorProfile.contractor.resume
        },
        {
            $Type : 'UI.DataField',
            Label : 'Resume',
            Value : contractorProfile.contractor.resume
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
                Label : 'Contractor Profile ID',
                Value : contractorProfile_ID,
            }

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
    contractorProfile_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'SelectedWorkers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : contractorProfile_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contractor.co_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contractor.skills',
            },
        ],
    }
};


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

