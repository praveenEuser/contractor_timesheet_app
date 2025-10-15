sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/managers/managers/test/integration/pages/ManagerEntityList",
	"com/contractor/managers/managers/test/integration/pages/ManagerEntityObjectPage"
], function (JourneyRunner, ManagerEntityList, ManagerEntityObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/managers/managers') + '/test/flp.html#app-preview',
        pages: {
			onTheManagerEntityList: ManagerEntityList,
			onTheManagerEntityObjectPage: ManagerEntityObjectPage
        },
        async: true
    });

    return runner;
});

