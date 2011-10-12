![TestFlight](https://s3.amazonaws.com/github-ds/TestFlight.png)

### Appcelerator Titanium TestFlight Module for iOS 

This is a TestFlight module for iOS originally developed by Rick Blalock and Matt Apperson. Also needing to be thanked is
the core TestFlight development team who assisted in the making of this module. Without their help this wouldn't have been
possible.

[TestFlight](http://www.testflightapp.com/) makes it easy to upload and distribute iOS builds over-the-air to your 
teams of testers and developers.

- - -

### Features

* Sessions - Discover how testers are using your application. Watch as they progress and take unexpected turns.
* In-App Questions - The most effective way to get tester feedback. Get the answers you need by asking questions the moment a checkpoint is passed.
* Remote Logging - NSLog(@"All your logs are belong to us"); //No extra work: NSLogs are instantly attached to your session and crash reports.
* Crash Reports - Reported in realtime, with environment snapshots and full session activity.
* Checkpoints - Place checkpoints throughout your app to see how far testers are getting, confirm which areas are popular and reveal ones that need more testing.
* In-App Updates - Prompt testers to install the latest version of your app. This is the easiest way for your testers to take advantage of installing on the fly.

- - - 

### Basic Usage:
~~~
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
~~~

- - - 

### TODO

* Need to write more examples to better show off features.

- - -

### HOW TO HELP
1. Go to github and click the “fork” button.
1. git clone git@github.com:DamageStudios/testflight-module.git
1. cd testflight-module
1. Make your changes/edits
1. git status
1. git commit -a
1. git push
1. go back to github and click the “pull request” button.

- - - 

### LICENSE

Apache Public License version 2

- - -

### COPYRIGHT

Copyright (c) 2011 by Damage Studios LLC. All Rights Reserved.

Appcelerator is a registered trademark of Appcelerator, Inc. Appcelerator Titanium is a trademark of Appcelerator, Inc.

TestFlight is a registered trademark of TestFlight