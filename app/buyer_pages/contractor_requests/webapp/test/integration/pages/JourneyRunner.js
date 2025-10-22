sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/requests/contractorrequests/test/integration/pages/PositionsList",
	"com/contractor/requests/contractorrequests/test/integration/pages/PositionsObjectPage",
	"com/contractor/requests/contractorrequests/test/integration/pages/ContractorRequestEntityObjectPage"
], function (JourneyRunner, PositionsList, PositionsObjectPage, ContractorRequestEntityObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/requests/contractorrequests') + '/test/flp.html#app-preview',
        pages: {
			onThePositionsList: PositionsList,
			onThePositionsObjectPage: PositionsObjectPage,
			onTheContractorRequestEntityObjectPage: ContractorRequestEntityObjectPage
        },
        async: true
    });

    return runner;
});

