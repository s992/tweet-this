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

		Document:	/admin/controllers/main.cfc
		Author:		Steve Withington | www.stephenwithington.com
		Modified:	2011.03.15

--->
<cfcomponent extends="controller" output="false">
	
	<cfscript>
		application.objMonkehTweet = createObject('component',
	        'com.coldfumonkeh.monkehTweet')
			.init(
				consumerKey			=	'TH7oeOR3DcpalsQpYAO4Dg',
				consumerSecret		=	'GAdlfukmYpU5OsSNiq4FiP4bPRNjVHaPPO3mvpbs3b4',
				parseResults		=	true
			);
	</cfscript>

	<!--- ********************************* PAGES ******************************************* --->

	<cffunction name="default" output="false" returntype="any">
		<cfargument name="rc" />
		
	</cffunction>
	
	<cffunction name="authorize" output="false" returntype="any">
		<cfargument name="rc" />
		
		<cfscript>
			callback = 'http://';
			callback &= rc.$.siteConfig().getDomain();
			callback &= variables.fw.buildURL('admin:main.auth');
			
			authStruct = application.objMonkehTweet.getAuthorisation(callbackURL = callback);
			
			if (authStruct.success){
				rc.pc.setSetting('oAuthToken',authStruct.token);
				rc.pc.setSetting('oAuthSecret',authStruct.token_secret);
			}
		</cfscript>
		<cflocation url="#authStruct.authURL#" addtoken="false" />
		
	</cffunction>
	
	<cffunction name="auth" output="false" returntype="any">
		<cfargument name="rc" />
		
		<cfscript>
			returnData	= application.objMonkehTweet.getAccessToken(  
												requestToken	= 	rc.pc.getSetting('oAuthToken'),
												requestSecret	= 	rc.pc.getSetting('oAuthSecret'),
												verifier		=	rc.oauth_verifier
											);
							
			if (returnData.success) {
				rc.pc.setSetting('consumerKey',returnData.token);
				rc.pc.setSetting('consumerSecret',returnData.token_secret);
				rc.pc.setSetting('twitterAccount',returnData.screen_name);
			}
		</cfscript>
		
	</cffunction>

</cfcomponent>