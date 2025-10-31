using ManageWorkerService as service from '../../../srv/manageworker_service';


annotate service.Workers with @Capabilities.InsertRestrictions.Insertable : false;
annotate service.Workers with @Capabilities.UpdateRestrictions.Updatable : true;
annotate service.Workers with @Capabilities.DeleteRestrictions.Deletable : false;



annotate service.Workers with @(
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
                Value : contractorProfile.contractor.co_name
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
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'timeSheets/@UI.LineItem',
        },
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
                Value : contractorProfile.contractor.co_name
        },
    ],
);

annotate service.Timesheet with @Capabilities.InsertRestrictions.Insertable : false;
annotate service.Timesheet with @Capabilities.UpdateRestrictions.Updatable : true;
annotate service.Timesheet with @Capabilities.DeleteRestrictions.Deletable : false;

annotate service.Timesheet with @(
    UI.LineItem : [
        {
                $Type : 'UI.DataField',
                Label : 'Worker ID',
                Value : worker_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'weekStart',
                Value : weekStart,
            },
            {
                $Type : 'UI.DataField',
                Label : 'weekEnd',
                Value : weekEnd,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Total Hours',
                Value : totalhours,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'RejectReason',
                Value : rejectedreason,
            },
            {
                $Type : 'UI.DataField',
                Label : 'comments',
                Value : comments,
            },
    ],
    UI.HeaderInfo:{
        TypeName: 'Time Sheet',
        TypeNamePlural : 'Time Sheets',
        Title:{
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
    },

    UI.Facets : [
        {
        $Type: 'UI.CollectionFacet',
        Label: 'Time Sheet',
        ID: 'DailyEntry',
            Facets: [
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Time Sheet',
                    Target: '@UI.Identification'
                },
                // {
                //     $Type: 'UI.ReferenceFacet',
                //     Label: 'Roles and Positions',
                //     Target: '@UI.FieldGroup#Project'
                // },
                // {
                //     $Type: 'UI.ReferenceFacet',
                //     Label: 'Offering',
                //     Target: '@UI.FieldGroup#ProjectOfferings'
                // }
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'timeEntries/@UI.LineItem',
        },

    ],

    UI.Identification:[
        {
                $Type : 'UI.DataField',
                Label : 'Worker ID',
                Value : worker_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'weekStart',
                Value : weekStart,
            },
            {
                $Type : 'UI.DataField',
                Label : 'weekEnd',
                Value : weekEnd,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Total Hours',
                Value : totalhours,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'RejectReason',
                Value : rejectedreason,
            },
            {
                $Type : 'UI.DataField',
                Label : 'comments',
                Value : comments,
            },
    ]


);


annotate service.TimeEntry with @Capabilities.InsertRestrictions.Insertable : false;
annotate service.TimeEntry with @Capabilities.UpdateRestrictions.Updatable : true;
annotate service.TimeEntry with @Capabilities.DeleteRestrictions.Deletable : false;


annotate service.TimeEntry with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label : 'Days',
            Value : workDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Hours',
            Value : hours,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Task ID',
            Value : tasks.task_ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Billable',
            Value : tasks.task.isBillable
        },
        {
            $Type : 'UI.DataField',
            Label : 'Notes',
            Value : notes,
        },
    ],

    UI.HeaderInfo:{
        TypeName: 'Time Entry',
        TypeNamePlural : 'Time Entries',
        Title:{
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
    },

    UI.Facets : [
        {
        $Type: 'UI.CollectionFacet',
        Label: 'Daily Entry',
        ID: 'DailyEntry',
            Facets: [
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Daily Entry',
                    Target: '@UI.Identification'
                },
                // {
                //     $Type: 'UI.ReferenceFacet',
                //     Label: 'Roles and Positions',
                //     Target: '@UI.FieldGroup#Project'
                // },
                // {
                //     $Type: 'UI.ReferenceFacet',
                //     Label: 'Offering',
                //     Target: '@UI.FieldGroup#ProjectOfferings'
                // }
            ]
        }
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Label : 'Date',
            Value : workDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Hours',
            Value : hours,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Task ID',
            Value : tasks.task_ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Notes',
            Value : notes,
        },
    ]


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
    assigned_ProjectManager @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ProjectManagers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : assigned_ProjectManager_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Manager_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'p_contactEmail',
            },
        ],
    }
};

annotate service.Workers with {
    assignedPosition @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Positions',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : assignedPosition_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'roles',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'no_of_positions',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'hourlyRate',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'currency_code',
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
                ValueListProperty : 'status',
            },
        ],
    }
};

