using ManagerService as service from '../../srv/manager-service';




annotate service.Projects with @(
    UI.SelectionFields:[
        project_name,
        ID,
        buyer_ID,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Project Name',
            Value : project_name,
        },
        {
                $Type : 'UI.DataField',
                Label : 'Buyer ID',
                Value : buyer_ID
        },
        {
                $Type : 'UI.DataField',
                Label : 'Assigned to',
                Value : worker_ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Start Date',
            Value : startDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'End Date',
            Value : endDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Planned Hours',
            Value : plannedHours,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Hourly Rate',
            Value : hourlyRate,
        },
    ],
    UI.HeaderInfo:{
        TypeName: 'Project',
        TypeNamePlural: 'Projects',
        Title:{
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description:{
            $Type : 'UI.DataField',
            Value : project_name,
        },
    },

    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label: 'Project Info',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Project Details',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Duration',
                    Target : '@UI.FieldGroup#Duration',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Time and Cost',
                    Target : '@UI.FieldGroup#TimeandCost',
                },
            ],
            
        }
    ],

    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : project_name,
        },
        {
            $Type : 'UI.DataField',
            Value : buyer_ID,
        },
        {
            $Type : 'UI.DataField',
            Label: 'Assigned to',
            Value : worker_ID
        },
    ],
    UI.FieldGroup #Duration : {
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Planned Hours',
                Value : plannedHours,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Hourly Rate',
                Value : hourlyRate,
            },
        ],
    },
    UI.FieldGroup #TimeandCost : {
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Planned Hours',
                Value : plannedHours,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Hourly Rate',
                Value : hourlyRate,
            },
        ],
    }


    
);

annotate service.Projects with {
    buyer_ID @Common.ValueList : {
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
                ValueListProperty : 'buyer_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'department',
            },
        ],
    }
};

annotate service.Projects with {
    worker_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Workers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : worker_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'worker_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'supplier.supplier_name',
            },
        ],
    }
};
