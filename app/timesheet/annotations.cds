using WorkerService as service from '../../srv/worker-service';
annotate service.TimeSheetEntity with @(

    
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
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
                Label : 'comments',
                Value : comments,
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
            Target : 'timeEntries/@UI.LineItem',
        }
    ],
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
            Label : 'comments',
            Value : comments,
        },
    ],
);


annotate service.TimeEntryEntity with @(
    UI.LineItem:[
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
            Label : 'Billable',
            Value : task.isBillable
        },
        {
            $Type : 'UI.DataField',
            Label : 'Task ID',
            Value : task_ID
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
                    Label: 'Project Details',
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
            Label : 'Billable',
            Value : task.isBillable
        },
        {
            $Type : 'UI.DataField',
            Label : 'Task ID',
            Value : task_ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Notes',
            Value : notes,
        },
    ]
);

annotate service.TimeEntryEntity with {
    task_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'TasksEntity',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : task_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'isBillable',
            },
        ],
    }
};

annotate service.TimeSheetEntity with {
    worker @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Worker',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : worker_ID,
                ValueListProperty : 'ID',
            },
        ],
    }
};

