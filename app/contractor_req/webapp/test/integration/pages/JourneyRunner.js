sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/request/contractorreq/test/integration/pages/ContractorRequestsList",
	"com/contractor/request/contractorreq/test/integration/pages/ContractorRequestsObjectPage"
], function (JourneyRunner, ContractorRequestsList, ContractorRequestsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/request/contractorreq') + '/test/flp.html#app-preview',
        pages: {
			onTheContractorRequestsList: ContractorRequestsList,
			onTheContractorRequestsObjectPage: ContractorRequestsObjectPage
        },
        async: true
    });

    return runner;
});

