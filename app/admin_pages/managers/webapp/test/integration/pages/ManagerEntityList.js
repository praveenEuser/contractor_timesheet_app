sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.contractor.managers.managers',
            componentId: 'ManagerEntityList',
            contextPath: '/ManagerEntity'
        },
        CustomPageDefinitions
    );
});