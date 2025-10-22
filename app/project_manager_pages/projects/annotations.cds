using ManagerService as service from '../../../srv/manager-service';


annotate service.Projects with @(

    UI.SelectionFields:[
        ID,
        project_name,
        project_manager,
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : project_name,
        },
        {
            $Type : 'UI.DataField',
            Value : project_manager.Manager_name
        },
        {
            $Type : 'UI.DataField',
            Value : startDate,
        },
        {
            $Type : 'UI.DataField',
            Value : endDate,
        },
        {
            $Type : 'UI.DataField',
            Value : plannedHours,
        },
    ],

    UI.HeaderInfo:{
        TypeName : 'Project',
        TypeNamePlural : 'Projects',
        Title:{
            $Type : 'UI.DataField',
            Value : ID,
        }
    },

    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label: 'Project Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Projects Info',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Duration',
                    Target : '@UI.FieldGroup#Duration',
                },
            ],
            
            
        },
        
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'positions/@UI.LineItem',
        },
        
    ],

    UI.Identification:[
            {
            $Type : 'UI.DataField',
            Value : project_manager_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : project_name,
            },
            {
                $Type : 'UI.DataField',
                Value : plannedHours,
            }
        ],
    UI.FieldGroup #Duration: {
        Label : 'Duration',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Value : endDate,
            },
        ],
    },

    
);




annotate service.Positions with @(


    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Label: 'Position ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : roles,
        },
        {
            $Type : 'UI.DataField',
            Value : no_of_positions,
        },
        {
            $Type : 'UI.DataField',
            Value : project_manager.Manager_name
        },
        {
            $Type: 'UI.DataField',
            Value : description,
        },
        {
            $Type: 'UI.DataField',
            Value : hourlyRate,
            Unit: currency_code
        },
        {
            $Type : 'UI.DataField',
            Label: 'Currency Code',
            Value : currency_code,
        },
        {
            $Type: 'UI.DataField',
            Value : buyer.buyer_name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Status',
            Value : status,
            Criticality: ColorCoding
        }    
    ],
    

    UI.HeaderInfo:{
        TypeName : 'Position',
        TypeNamePlural : 'Positions',
        Title:{
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description:{
            $Type : 'UI.DataField',
            Value : description,
        }
    },
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label: 'Position Detials',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'IDs',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Roles and Availability',
                    Target : '@UI.FieldGroup#roles',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Job Description and Offerings',
                    Target : '@UI.FieldGroup#JobDescription',
                },
            ],
            
        },
    ],

    UI.Identification:[
        {
            $Type: 'UI.DataField',
            Label:'Position ID',
            Value : ID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Project ID',
            Value : project_ID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Buyer ID',
            Value : buyer_ID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Manager ID',
            Value : project_manager_ID,
        }
    ],
    UI.FieldGroup #roles: {
        Data : [
            {
                $Type : 'UI.DataField',
                Label: 'Roles',
                Value : roles,
            },
            {
                $Type : 'UI.DataField',
                Label: 'No of Positions',
                Value : no_of_positions,
            },
        ],
    },
    UI.FieldGroup #JobDescription: {
        Label : 'Job Description and Offerings',
        Data : [
            {
                $Type : 'UI.DataField',
                Label: 'Description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label: 'Hourly Rate',
                Value : hourlyRate,
                Unit : currency_code
            },
            {
                $Type : 'UI.DataField',
                Label: 'Currency Code',
                Value : currency_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Status',
                Value : status,
                Criticality: ColorCoding
            }
        ],
    },
);

annotate service.Projects with {
    project_manager_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ProjectManagers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : project_manager_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Manager_name',
            }
        ],
    }
};

annotate service.Positions with {
    project_manager_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ProjectManagers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : project_manager_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Manager_name',
            }
        ],
    }
};


annotate service.Positions with {
    currency_code @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Currencies',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : currency_code,
                ValueListProperty : 'code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            }
        ],
    }
};


annotate service.Positions with {
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
            }
        ],
    }
};

annotate service.Projects with {
    worker @Common.ValueList : {
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
                ValueListProperty : 'w_email',
            },
        ],
    }
};


annotate service.Projects with {
    positions @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Positions',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : positions_ID,
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
                ValueListProperty : 'duration',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

