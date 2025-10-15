using ManagerService as service from '../../srv/manager-service';
annotate service.ContractorRequests with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'requiredSkills',
                Value : requiredSkills,
            },
            {
                $Type : 'UI.DataField',
                Label : 'startDate',
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'endDate',
                Value : endDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'estimatedHours',
                Value : estimatedHours,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ignoreReason',
                Value : ignoreReason,
            },
            {
                $Type : 'UI.DataField',
                Label : 'createdAt',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'updatedAt',
                Value : updatedAt,
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
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'requiredSkills',
            Value : requiredSkills,
        },
        {
            $Type : 'UI.DataField',
            Label : 'startDate',
            Value : startDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'endDate',
            Value : endDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'estimatedHours',
            Value : estimatedHours,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status,
        },
    ],
);

annotate service.ContractorRequests with {
    requestedBy @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Buyers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : requestedBy_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'buyer_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'department',
            },
        ],
    }
};

annotate service.ContractorRequests with {
    project @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Projects',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : project_ID,
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

annotate service.ContractorRequests with {
    preferredSupplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Suppliers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : preferredSupplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'supplier_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contactEmail',
            },
        ],
    }
};

