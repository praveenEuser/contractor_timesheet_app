using BuyerAssignService as service from '../../../srv/buyerassign-service';


annotate service.Projects with @Capabilities.InsertRestrictions.Insertable : false;
annotate service.Projects with @Capabilities.DeleteRestrictions.Deletable : false;
annotate service.Projects with @Capabilities.UpdateRestrictions.Updatable : true;


annotate service.Projects with @(

    UI.SelectionFields:[
        ID,
        project_name,
        project_manager,
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value :  ID,
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


annotate service.Positions with @Capabilities.InsertRestrictions.Insertable : false;
annotate service.Positions with @Capabilities.DeleteRestrictions.Deletable : false;
annotate service.Positions with @Capabilities.UpdateRestrictions.Updatable : true;

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
        },
        {
            $Type: 'UI.DataField',
            Label: 'Supplier ID',
            Value : worker.contractorProfile.contractor.supplier_ID,
        },   
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
                    Target : '@UI.Identification#IDS',
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

                // {
                //     $Type : 'UI.ReferenceFacet',
                //     Label : 'Worker Assign',
                //     Target : '@UI.FieldGroup#Assign',
                // },
            ],
            
        },
        {
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Workers Assignment',
                    Target: 'workers/@UI.LineItem'
                },
        // {
        //     $Type : 'UI.CollectionFacet',
        //     Label: 'Assign Workers',
        //     Facets : [
        //         {
        //             $Type : 'UI.ReferenceFacet',
        //             Label : 'Worker Assign',
        //             Target : '@UI.Identification#Assign',
        //         },
        //     ],
            
        // },

    ],

    

    UI.Identification#IDS:[
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
    // UI.FieldGroup#Assign:{
    //     Data: [
    //         {
    //             $Type: 'UI.DataField',
    //             Label:'Worker ID',
    //             Value : worker_ID,
    //         },
    //         {
    //             $Type: 'UI.DataField',
    //             Label:'Worker Name',
    //             Value : worker.contractorProfile.contractor.co_name,
    //         },
    //         {
    //             $Type: 'UI.DataField',
    //             Label:'Supplier Name',
    //             Value : worker.contractorProfile.contractor.supplier.supplier_name
    //         },
            
    //     ],
    // }
    
);

annotate service.Workers with @Capabilities.InsertRestrictions.Insertable : true;
annotate service.Workers with @Capabilities.DeleteRestrictions.Deletable : true;
annotate service.Workers with @Capabilities.UpdateRestrictions.Updatable : true;

annotate service.Workers with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Worker ID',
            Value : ID
        },
        {
                $Type : 'UI.DataField',
                Label : 'Contractor Profile ID',
                Value : contractorProfile_ID,
        },
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
            Label : 'Position ID',
            Value : assignedPosition_ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Supplier ID',
            Value : contractorProfile.contractor.supplier_ID
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
    ],

);


annotate service.Workers with {
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
                ValueListProperty : 'co_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contractor.skills',
            },
        ],
    }
};




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

annotate service.Positions with {
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
                ValueListProperty : 'contractor_name',
            },
            // {
            //     $Type : 'Common.ValueListParameterDisplayOnly',
            //     ValueListProperty : 'w_email',
            // },
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
