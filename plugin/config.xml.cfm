<cfoutput><plugin>
	<name>Tweet This!</name>
	<package>tweet-this</package>
	<directoryFormat>packageOnly</directoryFormat>
	<loadPriority>5</loadPriority>
	<version>1.1</version>
	<provider>Sean Walsh</provider>
	<providerURL>http://www.thehatrack.net</providerURL>
	<category>Application</category>
	<settings>
	</settings>
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="pluginEventHandler" persist="false" />
		<eventHandler event="onBeforeContentSave" component="pluginEventHandler" persist="false" />
		<eventHandler event="onAfterContentSave" component="pluginEventHandler" persist="false" />
		<eventHandler event="onContentEdit" component="pluginEventHandler" persist="false" />
	</eventHandlers>
	<displayobjects location="global">
	</displayobjects>
</plugin></cfoutput>