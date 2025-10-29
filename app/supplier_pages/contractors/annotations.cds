using SupplierService as service from '../../../srv/supplier-service';
annotate service.Contractor with @(

    UI.DataPoint #Rating :{
        Value : rate,
        TargetValue : 5,
        Visualization : #Rating,
    },

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
            {
                $Type : 'UI.DataFieldWithUrl',
                Label : 'Supplier ID',
                Value : supplier_ID,
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
                $Type : 'UI.DataFieldForAnnotation',
                Label : 'Rate',
                Target : '@UI.DataPoint#Rating'
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


annotate service.Contractor with {
    supplier_ID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Supplier',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'supplier_name',
            }
        ],
    }
};