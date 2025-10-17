sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.contractor.projects.projects',
            componentId: 'ProjectsEntityObjectPage',
            contextPath: '/ProjectsEntity'
        },
        CustomPageDefinitions
    );
});