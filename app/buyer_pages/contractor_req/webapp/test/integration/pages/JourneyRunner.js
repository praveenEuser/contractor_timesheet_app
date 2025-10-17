sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/requests/contractorreq/test/integration/pages/ContractorRequestEntityList",
	"com/contractor/requests/contractorreq/test/integration/pages/ContractorRequestEntityObjectPage"
], function (JourneyRunner, ContractorRequestEntityList, ContractorRequestEntityObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/requests/contractorreq') + '/test/flp.html#app-preview',
        pages: {
			onTheContractorRequestEntityList: ContractorRequestEntityList,
			onTheContractorRequestEntityObjectPage: ContractorRequestEntityObjectPage
        },
        async: true
    });

    return runner;
});

