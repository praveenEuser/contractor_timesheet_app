sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/contractor/projects/projects/test/integration/pages/ProjectsEntityList",
	"com/contractor/projects/projects/test/integration/pages/ProjectsEntityObjectPage",
	"com/contractor/projects/projects/test/integration/pages/Positions_rolesObjectPage"
], function (JourneyRunner, ProjectsEntityList, ProjectsEntityObjectPage, Positions_rolesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/contractor/projects/projects') + '/test/flp.html#app-preview',
        pages: {
			onTheProjectsEntityList: ProjectsEntityList,
			onTheProjectsEntityObjectPage: ProjectsEntityObjectPage,
			onThePositions_rolesObjectPage: Positions_rolesObjectPage
        },
        async: true
    });

    return runner;
});

