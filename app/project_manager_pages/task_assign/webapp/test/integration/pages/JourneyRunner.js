sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/taskassign/taskassign/test/integration/pages/TasksList",
	"com/contractor/taskassign/taskassign/test/integration/pages/TasksObjectPage",
	"com/contractor/taskassign/taskassign/test/integration/pages/TaskAssignmentObjectPage"
], function (JourneyRunner, TasksList, TasksObjectPage, TaskAssignmentObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/taskassign/taskassign') + '/test/flp.html#app-preview',
        pages: {
			onTheTasksList: TasksList,
			onTheTasksObjectPage: TasksObjectPage,
			onTheTaskAssignmentObjectPage: TaskAssignmentObjectPage
        },
        async: true
    });

    return runner;
});

