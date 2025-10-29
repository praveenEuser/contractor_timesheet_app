sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/assignworkers/assignworkers/test/integration/pages/ProjectsList",
	"com/contractor/assignworkers/assignworkers/test/integration/pages/ProjectsObjectPage",
	"com/contractor/assignworkers/assignworkers/test/integration/pages/PositionsObjectPage"
], function (JourneyRunner, ProjectsList, ProjectsObjectPage, PositionsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/assignworkers/assignworkers') + '/test/flp.html#app-preview',
        pages: {
			onTheProjectsList: ProjectsList,
			onTheProjectsObjectPage: ProjectsObjectPage,
			onThePositionsObjectPage: PositionsObjectPage
        },
        async: true
    });

    return runner;
});

