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
			<name>dsn</name>
			<label>Datasource Name</label>
			<type>text</type>
			<required>true</required>
			<defaultvalue></defaultvalue>
		</setting>
		<setting>
			<name>dbUser</name>
			<label>DSN Username:</label>
			<type>text</type>
			<required>true</required>
			<defaultvalue></defaultvalue>
		</setting>
		<setting>
			<name>dbPass</name>
			<label>DSN Password:</label>
			<type>text</type>
			<required>true</required>
			<defaultvalue></defaultvalue>
		</setting>
		<setting>
			<name>dbPrefix</name>
			<label>DSN Table Prefix:</label>
			<type>text</type>
			<required>false</required>
			<defaultvalue></defaultvalue>
		</setting>
		<setting>
			<name>consumerKey</name>
			<label>Consumer Key:</label>
			<hint>You can leave this blank if you wish to use the default Twitter application.</hint>
			<type>text</type>
			<required>false</required>
			<defaultvalue></defaultvalue>
		</setting>
		<setting>
			<name>consumerSecret</name>
			<label>Consumer Secret Key:</label>
			<hint>You can leave this blank if you wish to use the default Twitter application.</hint>
			<type>text</type>
			<required>false</required>
			<defaultvalue></defaultvalue>
		</setting>
		<setting>
			<name>oauthToken</name>
			<type>hidden</type>
			<required>false</required>
		</setting>
		<setting>
			<name>oauthSecret</name>
			<type>hidden</type>
			<required>false</required>
			<defaultvalue></defaultvalue>
		</setting>
		<setting>
			<name>twitterAccount</name>
			<type>hidden</type>
			<required>false</required>
			<defaultvalue></defaultvalue>
		</setting>
	</settings>
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="pluginEventHandler" persist="false" />
		<eventHandler event="onApplicationStart" component="pluginEventHandler" persist="false" />
		<eventHandler event="onAfterContentSave" component="pluginEventHandler" persist="false" />
	</eventHandlers>
	<displayobjects location="global">
	</displayobjects>
</plugin></cfoutput>