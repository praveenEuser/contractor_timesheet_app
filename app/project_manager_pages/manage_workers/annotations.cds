using ManagerService as service from '../../../srv/manager-service';
annotate service.Workers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            // {
            //     $Type : 'UI.DataField',
            //     Value : ,
            // },
            { $Type: 'UI.DataField', Label: 'Worker Name', Value: contractorProfile.contractor.co_name },
            // { $Type: 'UI.DataField', Label: 'Position ID', Value: assignedPosition_ID },
            // { $Type: 'UI.DataField', Label: 'Project ID', Value: assignedProject_ID },
            // { $Type: 'UI.DataField', Label: 'Manager ID', Value: assigned_ProjectManager_ID },
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
    UI.LineItem : [
        { $Type: 'UI.DataField', Label: 'Worker Name', Value: contractorProfile.contractor.co_name },
        { $Type: 'UI.DataField', Label: 'Position ID', Value: 'position_ID' },
        { $Type: 'UI.DataField', Label: 'Project ID', Value: 'project_ID' },
        { $Type: 'UI.DataField', Label: 'Buyer ID', Value: 'buyer_ID' },
        { $Type: 'UI.DataField', Label: 'Manager ID', Value: 'project_manager_ID' },
    ],
);

annotate service.Workers with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Suppliers',
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

annotate service.Workers with {
    assignedProject @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Projects',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : assignedProject_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'project_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'startDate',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'endDate',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'plannedHours',
            },
        ],
    }
};

annotate service.Workers with {
    contractorProfile @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ContractorProfiles',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : contractorProfile_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'co_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'experience',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'rate',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'skills',
            },
        ],
    }
};

