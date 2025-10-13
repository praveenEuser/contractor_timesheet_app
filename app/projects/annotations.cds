using ManagerService as service from '../../srv/manager-service';
annotate service.Projects with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
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
                Label : 'plannedHours',
                Value : plannedHours,
            },
            {
                $Type : 'UI.DataField',
                Label : 'hourlyRate',
                Value : hourlyRate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'totalHoursWorked',
                Value : totalHoursWorked,
            },
            {
                $Type : 'UI.DataField',
                Label : 'totalCost',
                Value : totalCost,
            },
            {
                $Type : 'UI.DataField',
                Label : 'progressPercent',
                Value : progressPercent,
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
            Label : 'name',
            Value : name,
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
            Label : 'plannedHours',
            Value : plannedHours,
        },
        {
            $Type : 'UI.DataField',
            Label : 'hourlyRate',
            Value : hourlyRate,
        },
    ],
);

annotate service.Projects with {
    buyer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Buyers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : buyer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'department',
            },
        ],
    }
};

