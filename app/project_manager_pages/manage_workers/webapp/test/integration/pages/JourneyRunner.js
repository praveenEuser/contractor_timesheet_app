sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/managerworkers/manageworkers/test/integration/pages/WorkersList",
	"com/contractor/managerworkers/manageworkers/test/integration/pages/WorkersObjectPage"
], function (JourneyRunner, WorkersList, WorkersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/managerworkers/manageworkers') + '/test/flp.html#app-preview',
        pages: {
			onTheWorkersList: WorkersList,
			onTheWorkersObjectPage: WorkersObjectPage
        },
        async: true
    });

    return runner;
});

