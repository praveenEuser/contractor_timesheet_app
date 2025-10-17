using Buyer as service from '../../../srv/buyer-service';
annotate service.ContractorRequestEntity with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Project ID',
                Value : project_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Position ID',
                Value : position_ID
            },
            {
                $Type : 'UI.DataField',
                Label : 'requiredSkills',
                Value : requiredSkills,
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
                Label : 'modifiedAt',
                Value : modifiedAt,
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
            Label : 'Project ID',
            Value : project_ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Project Name',
            Value : project.project_name
        },
        {
            $Type : 'UI.DataField',
            Label : 'Position ID',
            Value : position_ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'requiredSkills',
            Value : requiredSkills,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Start Date',
            Value : project.startDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'End Date',
            Value : project.endDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Role',
            Value : position.roles
        },
        {
            $Type : 'UI.DataField',
            Label : 'Vacancy',
            Value : position.no_of_positions
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : position.description
        },
        {
            $Type : 'UI.DataField',
            Label : 'Hourly Rate',
            Value : position.hourlyRate
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Planned Hours',
            Value : project.plannedHours,
        }
    ],
);


annotate service.ContractorRequestEntity with {
     position_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Positions',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : position_ID,
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
                ValueListProperty : 'description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'hourlyRate',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'project_ID',
            },
            
        ],
    }
};



annotate service.ContractorRequestEntity with {
    project_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ProjectsEntity',
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

annotate service.Positions with {
  roles @UI.hidden: { create: true };
  no_of_positions @UI.hidden: { create: true };
  description @UI.hidden: { create: true };
  hourlyRate @UI.hidden: { create: true };
};
annotate service.ProjectsEntity with {
  project_name @UI.hidden: { create: true };
  startDate @UI.hidden: { create: true };
  endDate @UI.hidden: { create: true };
};


