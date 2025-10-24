using Buyer as service from '../../../srv/buyer-service';

annotate service.Positions with @Capabilities.InsertRestrictions.Insertable : false;
annotate service.Positions with @Capabilities.DeleteRestrictions.Deletable : true;
annotate service.Positions with @Capabilities.UpdateRestrictions.Updatable : true;



annotate service.Positions with @(


    UI.LineItem : [
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
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Criticality: ColorCoding
        },
    ],

    UI.HeaderInfo:{
        TypeName : 'Position',
        TypeNamePlural : 'Positions',
        Title:{
            $Type : 'UI.DataField',
            Value : ID,
        }
    },


    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            ID: 'PositionsSection',
            Label: 'General Information',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Position Info',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Offering',
                    Target : '@UI.FieldGroup#Offering',
                },
            ],
            
            
        },
        
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'contractor_req/@UI.LineItem',
        },
        
    ],

    UI.Identification:[
            {
                $Type : 'UI.DataField',
                Label : 'Role',
                Value : roles,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Vacancy',
                Value : no_of_positions,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            }
        ],
    UI.FieldGroup #Offering: {
        Label : 'Offering',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : hourlyRate,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Criticality: ColorCoding
            },

        ],
    },
);


annotate service.ContractorRequestEntity with @Capabilities.InsertRestrictions.Insertable : true;
annotate service.ContractorRequestEntity with @Capabilities.UpdateRestrictions.Updatable : true;

annotate service.ContractorRequestEntity with @(

    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : position.roles,
        },
        {
            $Type : 'UI.DataField',
            Value : position.no_of_positions
        },
        {
            $Type : 'UI.DataField',
            Value : requiredSkills,
        },
        {
            $Type: 'UI.DataField',
            Value : position.description
        },    
    ],
    

    UI.HeaderInfo:{
        TypeName : 'Contractor Request',
        TypeNamePlural : 'Contractor Requests',
        Title:{
            $Type : 'UI.DataField',
            Value : ID,
        },
    },
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label: 'Contractor Request Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Project Info',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Assigned Details',
                    Target : '@UI.FieldGroup#assign',
                },
            ],
            
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Request Suppliers',
            Target: 'requestsupplier/@UI.LineItem',
        },
    ],

    UI.Identification:[
        {
            $Type: 'UI.DataField',
            Label:'Request ID',
            Value : ID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Role',
            Value : position.roles,
        },
    ],
    UI.FieldGroup #assign: {
        Data : [
            {
                $Type : 'UI.DataField',
                Label: 'Buyer Name',
                Value : position.buyer.buyer_name
            },
            {
                $Type : 'UI.DataField',
                Label: 'Skills',
                Value : requiredSkills
            },
        ],
    },
);



annotate service.RequestSuppliers with @(

    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Label: 'ID',
            Value : ID
        },
        {
            $Type : 'UI.DataField',
            Label: 'Supplier Name',
            Value : supplier.supplier_name
        },
        {
            $Type : 'UI.DataField',
            Label: 'Status',
            Value : status
        },
    ],

    UI.Facets: [
        {
            $Type: 'UI.CollectionFacet',
            Label: 'Add Suppliers',
            ID: 'AddSuppliersSection',
            Facets: [
                {
                $Type: 'UI.ReferenceFacet',
                Label: 'Add Suppliers',
                Target: '@UI.FieldGroup#AddSuppliers'
                }
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Contractors',
            Target: 'responses/@UI.LineItem',
        },
  ],
  UI.FieldGroup#AddSuppliers: {
    Data: [
      { $Type: 'UI.DataField', Label: 'Supplier Request ID', Value: ID },
      { $Type: 'UI.DataField', Label: 'Supplier ID', Value: supplier_ID },
      { $Type: 'UI.DataField', Label: 'Status', Value: status },
      { $Type: 'UI.DataField', Label: 'Role', Value: c_request.position.roles }
    ]
  }


) ;

annotate service.ContractorProfile with @(
    UI.LineItem:[
        { $Type: 'UI.DataField', Label: 'Contractor ID', Value: contractor_ID },
        { $Type: 'UI.DataField', Label: 'Contractor Name', Value: contractor.co_name },
        { $Type: 'UI.DataField', Label: 'Supplier ID', Value: request.supplier_ID },
        { $Type: 'UI.DataField', Label: 'Experience', Value: contractor.experience },
        { $Type: 'UI.DataField', Label: 'Status', Value: status},
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
        { $Type: 'UI.DataField', Label: 'Contractor Name', Value: contractor.co_name },
        { $Type: 'UI.DataField', Label: 'Experience', Value: contractor.experience },
        { $Type: 'UI.DataField', Label: 'Skills', Value: contractor.skills },
        { $Type: 'UI.DataField', Label: 'Rate', Value: contractor.rate },
        { $Type: 'UI.DataField', Label: 'Resume', Value: contractor.resume },
    ]
);


annotate service.RequestSuppliers with {
    supplier_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Suppliers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'supplier_ID',
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'supplier.supplier_name',
                ValueListProperty : 'supplier_name',
            },
        ],
    }
};  
   

annotate service.Positions with {
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
                ValueListProperty : 'buyer_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'department',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'b_contactEmail',
            },
        ],
    }
};

