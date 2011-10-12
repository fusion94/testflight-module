# TestFlight Module## DescriptionTestflightapp.com SDK integrationNote: TestFlight requires that your device be registered with TestFlight. This means that the module will not work in the iOS simulator.## Accessing the testflight ModuleTo access this module from JavaScript, you would do the following:	var testflight = require("ti.testflight");The testflight variable is a reference to the Module object.	## Reference### testflight.token('')#### ArgumentsTakes one argument, a string which is the Team token that will be used for your builds (the team token is NOT the API token)

### testflight.customInfo('', '')#### ArgumentsTakes two arguments, the first being a string for the key, the second a string for the value.
These are environment based details, so it won't track changes in the data.
For example you might use this for a username of the tester within your app.

### testflight.checkpoint('')

#### Arguments

Takes one argument, a string which is the name for your checkpoint

### testflight.feedback()

Show the feedback dialog

## Usage

      var testflight = require('ti.testflight');
   
      testflight.token('YourTeamTokenHere');
   
      testflight.checkpoint('SomeCheckpoint');
   
      testflight.feedback();
   

## Authors

Rick Blalock
Twitter: rblalock

Matt Apperson
Twitter: mattapperson

## License

Apache Public License 2.0