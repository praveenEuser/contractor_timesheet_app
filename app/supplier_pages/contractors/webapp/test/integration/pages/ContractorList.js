sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.contractor.contractors.contractors',
            componentId: 'ContractorList',
            contextPath: '/Contractor'
        },
        CustomPageDefinitions
    );
});