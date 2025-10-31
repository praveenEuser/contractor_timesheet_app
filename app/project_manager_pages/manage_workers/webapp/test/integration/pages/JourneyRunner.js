sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/manageworkers/manageworkers/test/integration/pages/WorkersList",
	"com/contractor/manageworkers/manageworkers/test/integration/pages/WorkersObjectPage",
	"com/contractor/manageworkers/manageworkers/test/integration/pages/TimesheetObjectPage"
], function (JourneyRunner, WorkersList, WorkersObjectPage, TimesheetObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/manageworkers/manageworkers') + '/test/flp.html#app-preview',
        pages: {
			onTheWorkersList: WorkersList,
			onTheWorkersObjectPage: WorkersObjectPage,
			onTheTimesheetObjectPage: TimesheetObjectPage
        },
        async: true
    });

    return runner;
});

