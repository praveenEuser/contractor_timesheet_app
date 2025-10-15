sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/suppliers/buyers/test/integration/pages/BuyerEntityList",
	"com/contractor/suppliers/buyers/test/integration/pages/BuyerEntityObjectPage"
], function (JourneyRunner, BuyerEntityList, BuyerEntityObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/suppliers/buyers') + '/test/flp.html#app-preview',
        pages: {
			onTheBuyerEntityList: BuyerEntityList,
			onTheBuyerEntityObjectPage: BuyerEntityObjectPage
        },
        async: true
    });

    return runner;
});

