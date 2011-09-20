<cfoutput><plugin>
	<name>Tweet This!</name>
	<package>tweet-this</package>
	<directoryFormat>packageOnly</directoryFormat>
	<loadPriority>5</loadPriority>
	<version>1.0</version>
	<provider>Sean Walsh</provider>
	<providerURL>http://www.thehatrack.net</providerURL>
	<category>Application</category>
	<settings>
		<setting>
			<name>contentTypes</name>
			<label>Content Types to Tweet From</label>
			<hint>A caret(^) delimited list of the types of content you would like to be able to Tweet from</hint>
			<type>Text</type>
			<required>true</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue>Page^Link^File^Portal^Calendar^Gallery</defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
	</settings>
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="pluginEventHandler" persist="false" />
		<eventHandler event="onBeforeContentSave" component="pluginEventHandler" persist="false" />
		<eventHandler event="onAfterContentSave" component="pluginEventHandler" persist="false" />
	</eventHandlers>
	<displayobjects location="global">
	</displayobjects>
</plugin></cfoutput>