sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.contractor.checkcontractorrequests.checkcontractorrequests',
            componentId: 'ContractorProfilesObjectPage',
            contextPath: '/RequestSuppliers/responses'
        },
        CustomPageDefinitions
    );
});