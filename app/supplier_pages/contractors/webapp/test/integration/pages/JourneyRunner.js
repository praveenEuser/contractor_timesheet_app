sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/contractors/contractors/test/integration/pages/ContractorList",
	"com/contractor/contractors/contractors/test/integration/pages/ContractorObjectPage"
], function (JourneyRunner, ContractorList, ContractorObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/contractors/contractors') + '/test/flp.html#app-preview',
        pages: {
			onTheContractorList: ContractorList,
			onTheContractorObjectPage: ContractorObjectPage
        },
        async: true
    });

    return runner;
});

