sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/supplier/supplier/test/integration/pages/ContractorRequestsList",
	"com/contractor/supplier/supplier/test/integration/pages/ContractorRequestsObjectPage"
], function (JourneyRunner, ContractorRequestsList, ContractorRequestsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/supplier/supplier') + '/test/flp.html#app-preview',
        pages: {
			onTheContractorRequestsList: ContractorRequestsList,
			onTheContractorRequestsObjectPage: ContractorRequestsObjectPage
        },
        async: true
    });

    return runner;
});

