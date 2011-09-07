<cfcomponent name="extendedConfig" output="false">

	<cffunction name="setData" access="public" output="false">
		<cfargument name="oauthToken" required="true" />
		<cfargument name="oauthSecret" required="true" />
		<cfargument name="accessKey" required="true" />
		<cfargument name="secretKey" required="true" />
		<cfargument name="twitterAccount" required="true" />
		
		<cfscript>
			var extendConfig = createObject("component","mura.extend.extendObject").init(type="Custom",subtype="Tweet This Config",siteID=session.siteID);
			extendConfig.setName( "Default" );
			extendConfig.setID( "TWEETCONFIG" );
			extendConfig.setValue( 'oauthtoken', arguments.oauthToken );
			extendConfig.setValue( 'oauthsecret', arguments.oauthSecret );
			extendConfig.setValue( 'accesskey', arguments.accessKey );
			extendConfig.setValue( 'secretkey', arguments.secretKey );
			extendConfig.setValue( 'twitteraccount', arguments.twitterAccount );
			extendConfig.save();
		</cfscript>
		
		<cfreturn extendConfig />
		
	</cffunction>
	
	<cffunction name="getValue" access="public" output="false">
		<cfargument name="key" required="true">
		
		<cfscript>
			var extendConfig = createObject("component","mura.extend.extendObject").init(type="Custom",subtype="Tweet This Config",siteID=session.siteID);
			extendConfig.setID( "TWEETCONFIG" );
			configValue = extendConfig.getValue( key );
		</cfscript>
		
		<cfreturn configValue />
	
	</cffunction>

</cfcomponent>