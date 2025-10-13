sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/suppliers/suppliers/test/integration/pages/SuppliersList",
	"com/contractor/suppliers/suppliers/test/integration/pages/SuppliersObjectPage"
], function (JourneyRunner, SuppliersList, SuppliersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/suppliers/suppliers') + '/test/flp.html#app-preview',
        pages: {
			onTheSuppliersList: SuppliersList,
			onTheSuppliersObjectPage: SuppliersObjectPage
        },
        async: true
    });

    return runner;
});

