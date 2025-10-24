sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/checkcontractorrequests/checkcontractorrequests/test/integration/pages/RequestSuppliersList",
	"com/contractor/checkcontractorrequests/checkcontractorrequests/test/integration/pages/RequestSuppliersObjectPage",
	"com/contractor/checkcontractorrequests/checkcontractorrequests/test/integration/pages/ContractorProfilesObjectPage"
], function (JourneyRunner, RequestSuppliersList, RequestSuppliersObjectPage, ContractorProfilesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/checkcontractorrequests/checkcontractorrequests') + '/test/flp.html#app-preview',
        pages: {
			onTheRequestSuppliersList: RequestSuppliersList,
			onTheRequestSuppliersObjectPage: RequestSuppliersObjectPage,
			onTheContractorProfilesObjectPage: ContractorProfilesObjectPage
        },
        async: true
    });

    return runner;
});

