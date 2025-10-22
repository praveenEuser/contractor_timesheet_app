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
        }
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

annotate service.RequestSuppliers with@(
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
    ]
) ;

    

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

