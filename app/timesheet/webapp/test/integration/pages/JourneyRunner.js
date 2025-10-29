sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/timesheet/timesheet/test/integration/pages/TimeSheetEntityList",
	"com/contractor/timesheet/timesheet/test/integration/pages/TimeSheetEntityObjectPage",
	"com/contractor/timesheet/timesheet/test/integration/pages/TimeEntryEntityObjectPage"
], function (JourneyRunner, TimeSheetEntityList, TimeSheetEntityObjectPage, TimeEntryEntityObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/timesheet/timesheet') + '/test/flp.html#app-preview',
        pages: {
			onTheTimeSheetEntityList: TimeSheetEntityList,
			onTheTimeSheetEntityObjectPage: TimeSheetEntityObjectPage,
			onTheTimeEntryEntityObjectPage: TimeEntryEntityObjectPage
        },
        async: true
    });

    return runner;
});

