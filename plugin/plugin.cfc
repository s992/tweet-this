<!---

This file is part of muraFW1
(c) Stephen J. Withington, Jr. | www.stephenwithington.com

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

		Document:	plugin/plugin.cfc
		Author:		Steve Withington | www.stephenwithington.com
		Modified:	2011.02.04

--->
<cfcomponent output="false" extends="mura.plugin.plugincfc">

	<cfset variables.config = '' />

	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="config"  type="any" default="" />
		<cfscript>
			variables.config = arguments.config;
		</cfscript>
	</cffunction>
	
	<cffunction name="install" access="public" returntype="void" output="false">
		<cfscript>
			var local = StructNew();

			// need to check and see if this is already installed ... if so, then abort!
			local.moduleid = variables.config.getModuleID();
			
			createConfigExtendSet();
			createTweetExtendSet();

			application.appInitialized = false;
		</cfscript>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false">
		<cfscript>
			// this will be executed by the pluginManager when the plugin is updated.
			application.appInitialized = false;
			install();
		</cfscript>
	</cffunction>
	
	<cffunction name="delete" access="public" returntype="void" output="false">
		<cfscript>
			// this will be executed by the pluginManager when the plugin is deleted.
			var local = StructNew();
			// don't delete the subTypes if this is being invoked by the deletePlugin() from install()
			if ( val(getInstallationCount()) eq 1 ) {
				//deleteSomethingAppSpecificIfNeeded();
			};
			application.appInitialized = false;
		</cfscript>
	</cffunction>

	<!--- tweet-this specific --->
	<cffunction name="createConfigExtendSet" access="public" returntype="void" output="false">
		<cfscript>
			var configSet = '';
			var configType = application.classExtensionManager.getSubTypeBean();
			
			configType.setType( "Custom" );
			configType.setSubType( "Tweet This Config" );
			configType.setSiteID( session.siteID );
			configType.load();
			configType.setBaseTable( "tcontent" );
			configType.setBaseKeyField( "contentHistID" );
			configType.save();
			
			configSet = configType.getExtendSetByName( "Default" );
			configSet.setSiteID( session.siteID );
			configSet.save();
			
			createConfigAttributes( configType );
		</cfscript>
		
	</cffunction>
	
	<cffunction name="createConfigAttributes" access="public" returntype="void" output="false">
		<cfargument name="configType" required="true" />
		<cfscript>
			//Tweet This Config set
			configSet = arguments.configType.getExtendSetByName( "Default" );
			
			accessKey = configSet.getAttributeByName( "accesskey" );
			accessKey.setLabel( "Consumer Access Key" );
			accessKey.setType( "text" );
			accessKey.setDefaultValue( "" );
			accessKey.save();
			
			secretKey = configSet.getAttributeByName( "secretkey" );
			secretKey.setLabel( "Consumer Secret Key" );
			secretKey.setType( "text" );
			secretKey.setDefaultValue( "" );
			secretKey.save();
			
			oauthToken = configSet.getAttributeByName( "oauthtoken" );
			oauthToken.setLabel( "oAuth Token" );
			oauthToken.setType( "text" );
			oauthToken.setDefaultValue( "" );
			oauthToken.save();
			
			oauthSecret = configSet.getAttributeByName( "oauthsecret" );
			oauthSecret.setLabel( "oAuth Secret Token" );
			oauthSecret.setType( "text" );
			oauthSecret.setDefaultValue( "" );
			oauthSecret.save();
			
			twitterAccount = configSet.getAttributeByName( "twitteraccount" );
			twitterAccount.setLabel( "Twitter Account Name" );
			twitterAccount.setType( "text" );
			twitterAccount.setDefaultValue( "" );
			twitterAccount.save();
		</cfscript>
	</cffunction>
	
	<cffunction name="createTweetExtendSet" access="public" returntype="void" output="false">
		<cfscript>
			var tweetSet = '';
			var tweetType = application.classExtensionManager.getSubTypeBean();
			
			tweetType.setType( "Custom" );
			tweetType.setSubType( "Tweet This" );
			tweetType.setSiteID( session.siteID );
			tweetType.load();
			tweetType.setBaseTable( "tcontent" );
			tweetType.setBaseKeyField( "contentHistID" );
			tweetType.save();
			
			tweetSet = tweetType.getExtendSetByName( "Default" );
			tweetSet.setSiteID( session.siteID );
			tweetSet.save();
			
			createTweetAttributes( tweetType );
		</cfscript>
		
	</cffunction>
	
	<cffunction name="createTweetAttributes" access="public" returntype="void" output="false">
		<cfargument name="tweetType" required="true" />
		<cfscript>
			var tweetSet = arguments.tweetType.getExtendSetByName( "Default" );
			var tweetCheck = '';
			var tweetBox = '';
			
			tweetSet.setSiteID( session.siteID );
			tweetSet.setName( "Tweet This!" );
			tweetSet.setContainer( "Custom" );
			tweetSet.save();
			
			tweetCheck = tweetSet.getAttributeByName( "tweetcheck" );
			tweetCheck.setLabel( "Tweet this?" );
			tweetCheck.setType( "RadioGroup" );
			tweetCheck.setOptionList( "Yes^No" );
			tweetCheck.setOptionLabelList( "Yes^No" );
			tweetCheck.setDefaultValue( "No" );
			tweetCheck.save();
			
			tweetBox = tweetSet.getAttributeByName( "tweetbox" );
			tweetBox.setLabel( "Tweet Text:" );
			tweetBox.setType( "TextArea" );
			tweetBox.setHint( "Enter your Tweet here." );
			tweetBox.setValidation( "Regex" );
			tweetBox.setRegex( "^.{1,140}$" );
			tweetBox.setMessage( "Please enter no more than 140 characters in the Tweet Box." );
			tweetBox.save();
		</cfscript>
	</cffunction>
	
	<!--- *******************************    private    ******************************** --->
	<cffunction name="getInstallationCount" access="private" returntype="any" output="false">
		<cfscript>
			var qoq = '';
			var rs = variables.config.getConfigBean().getPluginManager().getAllPlugins();
		</cfscript>
		<cfquery name="qoq" dbtype="query">
			SELECT *
			FROM rs
			WHERE package = <cfqueryparam value="#variables.config.getPackage()#" cfsqltype="cf_sql_varchar" maxlength="100" />
		</cfquery>
		<cfreturn val(qoq.recordcount) />
	</cffunction>

</cfcomponent>