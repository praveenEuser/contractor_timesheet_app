using SupplierService as service from '../../../srv/supplier-service';
annotate service.Contractor with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'co_name',
                Value : co_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'skills',
                Value : skills,
            },
            {
                $Type : 'UI.DataField',
                Label : 'experience',
                Value : experience,
            },
            {
                $Type : 'UI.DataField',
                Label : 'rate',
                Value : rate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Upload Resume',
                Value : resume,
            },
            {
                $Type : 'UI.DataFieldWithUrl',
                Label : 'File Name',
                Value : resumeName,
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
            Label : 'co_name',
            Value : co_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'skills',
            Value : skills,
        },
        {
            $Type : 'UI.DataField',
            Label : 'experience',
            Value : experience,
        },
        {
            $Type : 'UI.DataField',
            Label : 'rate',
            Value : rate,
        },
        {
                $Type : 'UI.DataFieldWithUrl',
                Label : 'File Name',
                Value : resumeName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Resume',
            Value : resume,
        },
    ],
);

