using SupplierService as service from '../../../srv/supplier-service';

annotate service.RequestSuppliers with @Capabilities.InsertRestrictions.Insertable : false;
annotate service.RequestSuppliers with @Capabilities.DeleteRestrictions.Deletable : false;

annotate service.RequestSuppliers with @(
    // UI.FieldGroup #GeneratedGroup : {
    //     $Type : 'UI.FieldGroupType',
    //     Data : [
    //         {
    //             $Type : 'UI.DataField',
    //             Label : 'status',
    //             Value : status,
    //         },
    //         {
    //             $Type : 'UI.DataField',
    //             Label : 'responseDate',
    //             Value : responseDate,
    //         },
    //     ],
    // },
    // UI.Facets : [
    //     {
    //         $Type : 'UI.ReferenceFacet',
    //         ID : 'GeneratedFacet1',
    //         Label : 'General Information',
    //         Target : '@UI.FieldGroup#GeneratedGroup',
    //     },
    // ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Role',
            Value : c_request.position.roles,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Vacancy',
            Value : c_request.position.no_of_positions,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'responseDate',
            Value : responseDate,
        },
    ],
    UI.HeaderInfo:{
        TypeName: 'Contractor Request',
        TypeNamePlural : 'Contractor Requests',
        Title:{
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
    },
    UI.Facets : [
        {
        $Type: 'UI.CollectionFacet',
        Label: 'Project Info',
        ID: 'ProjectSectoin',
        Facets: [
            {
                $Type: 'UI.ReferenceFacet',
                Label: 'Project Details',
                Target: '@UI.Identification#Project'
            },
            {
                $Type: 'UI.ReferenceFacet',
                Label: 'Roles and Positions',
                Target: '@UI.FieldGroup#Project'
            },
            {
                $Type: 'UI.ReferenceFacet',
                Label: 'Offering',
                Target: '@UI.FieldGroup#ProjectOfferings'
            }
        ]
        },
        {
            $Type: 'UI.CollectionFacet',
            Label: 'Project Manager Details',
            ID: 'ManagerSection',
                Facets: [
                    {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Manager Details',
                    Target: '@UI.FieldGroup#Manager'
                    }
                ]
        },
        {
            $Type: 'UI.CollectionFacet',
            Label: 'Status',
            ID: 'StatusUpdate',
                Facets: [
                    {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Status',
                    Target: '@UI.FieldGroup#status'
                    }
                ]
        },

        {
            $Type: 'UI.ReferenceFacet',
            Target: 'responses/@UI.LineItem',
        }

    ],

    UI.Identification#Project:[
        { $Type: 'UI.DataField', Label: 'Project Name', Value: c_request.position.project.project_name }, 
        { $Type: 'UI.DataField', Label: 'Start Date', Value: c_request.position.project.startDate },
        { $Type: 'UI.DataField', Label: 'End Date', Value: c_request.position.project.endDate },
        { $Type: 'UI.DataField', Label: 'Planned Hours', Value: c_request.position.project.plannedHours },
    ],

    UI.FieldGroup#Project: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Role', Value: c_request.position.roles },
            { $Type: 'UI.DataField', Label: 'Vacancy', Value: c_request.position.no_of_positions },
            { $Type: 'UI.DataField', Label: 'Required Skills', Value: c_request.requiredSkills },
            { $Type: 'UI.DataField', Label: 'Job Description',Value : c_request.position.description }
        ]
    },
    UI.FieldGroup#ProjectOfferings: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Hourly Rate', Value: c_request.position.hourlyRate },
            { $Type: 'UI.DataField', Label: 'Currency Code', Value: c_request.position.currency_code },
            { $Type: 'UI.DataField', Label: 'Buyer Name', Value: c_request.position.buyer.buyer_name },
            { $Type: 'UI.DataField', Label: 'Buyer Name', Value: c_request.position.buyer.b_contactEmail },
        ]
    },
    UI.FieldGroup#Manager: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Manager Name', Value: c_request.position.project.project_manager.Manager_name },
            { $Type: 'UI.DataField', Label: 'Manager Mail', Value: c_request.position.project.project_manager.p_contactEmail},
        ]
    },
    UI.FieldGroup#status: {
        Data: [
            { $Type: 'UI.DataField', Label: 'Respond Date', Value: responseDate },
            { $Type: 'UI.DataField', Label: 'Status', Value: status},
        ]
    }
);


annotate service.ContractorProfiles with @(

    

    UI.LineItem:[
        { $Type: 'UI.DataField', Label: 'ID', Value: ID },
        { $Type: 'UI.DataField', Label: 'Contractor Name', Value: contractor.co_name },
        { $Type: 'UI.DataField', Label: 'Experience', Value: contractor.experience },
        { $Type: 'UI.DataField', Label: 'Status', Value: status},
        { $Type: 'UI.DataField', Label: 'Resume', Value: contractor.resume },
    ],
    UI.HeaderInfo:{
        TypeName: 'Contractor Profile',
        TypeNamePlural : 'Contractor Profiles',
        Title:{
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
    },

    UI.Facets:[
        {
            $Type: 'UI.CollectionFacet',
            Label: 'Contractor Profile',
            ID: 'Contractor_Profile',
            Facets: [
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Project Details',
                    Target: '@UI.Identification#Profile'
                },
            ]
        },
    ],

    UI.Identification#Profile:[
        { $Type: 'UI.DataField', Label: 'Contractor ID', Value: contractor_ID },
        //{ $Type: 'UI.DataField', Label: 'Contractor Name', Value: contractor.co_name },
        //{ $Type: 'UI.DataField', Label: 'Experience', Value: contractor.experience },
        //{ $Type: 'UI.DataField', Label: 'Skills', Value: contractor.skills },
        //{ $Type: 'UI.DataField', Label: 'Rate', Value: contractor.rate },
        //{ $Type: 'UI.DataField', Label: 'Resume', Value: contractor.resume },
    ]
);


annotate service.ContractorProfiles with {
    //ID @UI.Hidden;
   supplier_ID @UI.Hidden;
};


annotate service.ContractorProfiles with {
    contractor_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Contractor',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : contractor_ID,
                ValueListProperty : 'ID',
            },
            // {
            //     $Type : 'Common.ValueListParameterInOut',
            //     LocalDataProperty : contractor.co_name,
            //     ValueListProperty : 'co_name',
            // },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                //LocalDataProperty : contractor.co_name,
                ValueListProperty : 'co_name',
            },
            // {
            //     $Type : 'Common.ValueListParameterInOut',
            //     LocalDataProperty : contractor.experience,
            //     ValueListProperty : 'experience',
            // },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                //LocalDataProperty : contractor.experience,
                ValueListProperty : 'experience',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty : contractor.skills,
                ValueListProperty : 'skills',
            },
            // {
            //     $Type : 'Common.ValueListParameterInOut',
            //     LocalDataProperty : contractor.rate,
            //     ValueListProperty : 'rate',
            // },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                //LocalDataProperty : contractor.rate,
                ValueListProperty : 'rate',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                //LocalDataProperty : contractor.rate,
                ValueListProperty : 'resume',
            },
            // {
            //     $Type : 'Common.ValueListParameterInOut',
            //     LocalDataProperty : contractor.resume,
            //     ValueListProperty : 'resume',
            // },
        ],
    } 
};



annotate service.RequestSuppliers with {
    c_request @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'ContractorRequests',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : c_request_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'requiredSkills',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'createdAt',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'modifiedAt',
            },
        ],
    }
};

