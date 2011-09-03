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
			<hint></hint>
			<type>text</type>
			<required>true</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
		<setting>
			<name>dbUser</name>
			<label>DSN Username:</label>
			<hint></hint>
			<type>text</type>
			<required>true</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
		<setting>
			<name>dbPass</name>
			<label>DSN Password:</label>
			<hint></hint>
			<type>text</type>
			<required>true</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
		<setting>
			<name>dbPrefix</name>
			<label>DSN Table Prefix:</label>
			<hint></hint>
			<type>text</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
		<setting>
			<name>consumerKey</name>
			<label>Consumer Key:</label>
			<hint>You can leave this blank if you wish to use the default Twitter application.</hint>
			<type>text</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
		<setting>
			<name>consumerSecret</name>
			<label>Consumer Secret Key:</label>
			<hint>You can leave this blank if you wish to use the default Twitter application.</hint>
			<type>text</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
		<setting>
			<name>oauthToken</name>
			<label></label>
			<hint></hint>
			<type>text</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
		<setting>
			<name>oauthSecret</name>
			<label></label>
			<hint></hint>
			<type>text</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
		</setting>
		<setting>
			<name>twitterAccount</name>
			<label></label>
			<hint></hint>
			<type>text</type>
			<required>false</required>
			<validation></validation>
			<regex></regex>
			<message></message>
			<defaultvalue></defaultvalue>
			<optionlist></optionlist>
			<optionlabellist></optionlabellist>
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