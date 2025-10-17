sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/worker/worker/test/integration/pages/TimesheetEntriesList",
	"com/contractor/worker/worker/test/integration/pages/TimesheetEntriesObjectPage"
], function (JourneyRunner, TimesheetEntriesList, TimesheetEntriesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/worker/worker') + '/test/flp.html#app-preview',
        pages: {
			onTheTimesheetEntriesList: TimesheetEntriesList,
			onTheTimesheetEntriesObjectPage: TimesheetEntriesObjectPage
        },
        async: true
    });

    return runner;
});

