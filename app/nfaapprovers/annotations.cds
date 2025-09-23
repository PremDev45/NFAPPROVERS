using NfaForm as service from '../../srv/service';
using from '../../db/schema';

annotate service.Rules with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ruleName',
                Value : ruleName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'activeStatus',
                Value : activeStatus,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Rules Conditions',
            ID : 'RulesConditions',
            Target : 'RulesToRulesCondition/@UI.LineItem#RulesConditions',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Levels',
            ID : 'Levels',
            Target : 'RulesToRulesLevels/@UI.LineItem#Levels',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ruleName',
            Value : ruleName,
        },
    ],
);

annotate service.RulesCondition with @(
    UI.LineItem #RulesConditions : [
        {
            $Type : 'UI.DataField',
            Value : comparator,
            Label : 'comparator',
        },
        {
            $Type : 'UI.DataField',
            Value : field,
            Label : 'field',
        },
        {
            $Type : 'UI.DataField',
            Value : value2,
            Label : 'value2',
        },
        {
            $Type : 'UI.DataField',
            Value : value1,
            Label : 'value1',
        },
        {
            $Type : 'UI.DataField',
            Value : ruleName,
            Label : 'ruleName',
        },
    ]
);

annotate service.RulesLevels with @(
    UI.LineItem #Levels : [
        {
            $Type : 'UI.DataField',
            Value : level,
            Label : 'level',
        },
        {
            $Type : 'UI.DataField',
            Value : ruleName,
            Label : 'ruleName',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'GeneralSection',
            ID : 'GeneralSection',
            Target : '@UI.FieldGroup#GeneralSection',
            @UI.Hidden,
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Approvers',
            ID : 'Approvers',
            Target : 'RulesLevelsToRulesApprovers/@UI.LineItem#Approvers',
        },
    ],
    UI.FieldGroup #GeneralSection : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : level,
                Label : 'level',
            },
            {
                $Type : 'UI.DataField',
                Value : ruleName,
                Label : 'ruleName',
            },
        ],
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : level,
                Label : 'level',
            },
            {
                $Type : 'UI.DataField',
                Value : ruleName,
                Label : 'ruleName',
            },
        ],
    },
);

annotate service.RulesApprovers with @(
    UI.LineItem #Approvers : [
        {
            $Type : 'UI.DataField',
            Value : EmployeeID,
            Label : 'EmployeeID',
        },
        {
            $Type : 'UI.DataField',
            Value : EmployeeName,
            Label : 'EmployeeName',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'RulesApprovers',
            ID : 'RulesApprovers',
            Target : '@UI.FieldGroup#RulesApprovers',
        },
    ],
    UI.FieldGroup #RulesApprovers : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : EmployeeID,
                Label : 'EmployeeID',
            },
            {
                $Type : 'UI.DataField',
                Value : EmployeeName,
                Label : 'EmployeeName',
            },
            {
                $Type : 'UI.DataField',
                Value : level,
                Label : 'level',
            },
            {
                $Type : 'UI.DataField',
                Value : ruleName,
                Label : 'ruleName',
            },
        ],
    },
);

annotate service.RulesApprovers with {
    EmployeeID @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Approvers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : EmployeeID,
                    ValueListProperty : 'EmployeeID',
                },
            ],
            PresentationVariantQualifier : 'vh_RulesApprovers_EmployeeID',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Approvers with {
    EmployeeID @(
        Common.Text : EmployeeName,
        Common.Text.@UI.TextArrangement : #TextLast,
)};

annotate service.RulesApprovers with {
    EmployeeName @Common.FieldControl : #ReadOnly
};

annotate service.Approvers with @(
    UI.PresentationVariant #vh_RulesApprovers_EmployeeID : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : EmployeeID,
                Descending : false,
            },
        ],
    }
);

