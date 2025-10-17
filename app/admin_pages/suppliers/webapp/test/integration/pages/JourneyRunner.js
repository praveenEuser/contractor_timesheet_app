sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/suppliers/suppliers/test/integration/pages/SupplierEntityList",
	"com/contractor/suppliers/suppliers/test/integration/pages/SupplierEntityObjectPage"
], function (JourneyRunner, SupplierEntityList, SupplierEntityObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/suppliers/suppliers') + '/test/flp.html#app-preview',
        pages: {
			onTheSupplierEntityList: SupplierEntityList,
			onTheSupplierEntityObjectPage: SupplierEntityObjectPage
        },
        async: true
    });

    return runner;
});

