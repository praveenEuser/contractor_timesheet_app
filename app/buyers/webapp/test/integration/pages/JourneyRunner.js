sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/buyers/buyers/test/integration/pages/BuyersList",
	"com/contractor/buyers/buyers/test/integration/pages/BuyersObjectPage"
], function (JourneyRunner, BuyersList, BuyersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/buyers/buyers') + '/test/flp.html#app-preview',
        pages: {
			onTheBuyersList: BuyersList,
			onTheBuyersObjectPage: BuyersObjectPage
        },
        async: true
    });

    return runner;
});

