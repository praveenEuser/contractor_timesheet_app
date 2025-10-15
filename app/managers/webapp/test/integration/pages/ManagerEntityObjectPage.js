sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.contractor.managers.managers',
            componentId: 'ManagerEntityObjectPage',
            contextPath: '/ManagerEntity'
        },
        CustomPageDefinitions
    );
});