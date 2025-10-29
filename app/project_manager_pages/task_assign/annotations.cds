using WorkerAssign as service from '../../../srv/workertaskassign-service';
annotate service.Tasks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'isBillable',
                Value : isBillable,
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
            Target : 'assignments/@UI.LineItem',
        },

    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'isBillable',
            Value : isBillable,
        },
    ],
);

annotate service.TaskAssignment with @(
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Label : 'Worker ID',
            Value : worker_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Worker Name',
            Value : co_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Task ID',
            Value : task_ID,
        },
    ]
);


annotate service.TaskAssignment with {
    worker_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Worker',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : worker_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'co_names',
            },
            
        ],
    }
};




annotate service.Tasks with {
    position @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Position',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : position_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'worker.co_name',
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

