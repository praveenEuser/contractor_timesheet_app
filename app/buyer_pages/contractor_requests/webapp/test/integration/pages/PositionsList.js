sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.contractor.requests.contractorrequests',
            componentId: 'PositionsList',
            contextPath: '/Positions'
        },
        CustomPageDefinitions
    );
});