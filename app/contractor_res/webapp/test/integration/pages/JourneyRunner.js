sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/response/contractorres/test/integration/pages/ContractorRequestsList",
	"com/contractor/response/contractorres/test/integration/pages/ContractorRequestsObjectPage"
], function (JourneyRunner, ContractorRequestsList, ContractorRequestsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/response/contractorres') + '/test/flp.html#app-preview',
        pages: {
			onTheContractorRequestsList: ContractorRequestsList,
			onTheContractorRequestsObjectPage: ContractorRequestsObjectPage
        },
        async: true
    });

    return runner;
});

