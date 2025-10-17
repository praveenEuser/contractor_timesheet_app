sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/workers/workers/test/integration/pages/WorkerEntityList",
	"com/contractor/workers/workers/test/integration/pages/WorkerEntityObjectPage"
], function (JourneyRunner, WorkerEntityList, WorkerEntityObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/workers/workers') + '/test/flp.html#app-preview',
        pages: {
			onTheWorkerEntityList: WorkerEntityList,
			onTheWorkerEntityObjectPage: WorkerEntityObjectPage
        },
        async: true
    });

    return runner;
});

