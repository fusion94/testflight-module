// AVAILABLE METHODS:
// var testflight = require('com.testflight');
// testflight.token('YourTeamTokenHere');
// testflight.checkpoint('SomeCheckpoint');
// testflight.feedback();

Titanium.UI.setBackgroundColor('#eee');

// Pull in the Module
var testflight = require('ti.testflight');
Ti.API.info("module is => " + testflight);


// Set the team token here (REQUIRED)
testflight.token('YourTeamTokenHere');

var tabGroup = Titanium.UI.createTabGroup();

var win = Titanium.UI.createWindow({  
    title: 'TestFlight Module',
    backgroundColor:'#fff'
});
var tab1 = Titanium.UI.createTab({  
    icon: 'KS_nav_views.png',
    title: 'TestFlight',
    window: win
});

var data = [
	{ title: 'Checkpoint 1', uid: 1 },
	{ title: 'Checkpoint 2', uid: 2 },
	{ title: 'Checkpoint 3', uid: 3 },
	{ title: 'Checkpoint 4', uid: 4 }
];

var table = Ti.UI.createTableView({ data: data });

table.addEventListener('click', function(_event) {
	// Set a checkpoint up here
	testflight.checkpoint('Checkpoint' + _event.rowData.uid);

	var newwin = Ti.UI.createWindow({ title: _event.row.title });
	
	var label = Ti.UI.createLabel({ text: 'Checkpoint ' + _event.rowData.uid, textAlign: 'center' });
	var btn = Ti.UI.createButton({ title: 'Feedback' });
	
	btn.addEventListener('click', function() {
		// Open the feedback window
		testflight.feedback();
	});
	
	newwin.add(label);
	newwin.rightNavButton = btn;
	tab1.open(newwin, { animated: true });
});

win.add(table);

tabGroup.addTab(tab1);  
tabGroup.open();