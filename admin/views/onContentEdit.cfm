<cfsilent>
<cfscript>
	subType = application.classExtensionManager.getSubTypeByName( type='Custom', subtype='Tweet This!', siteID=session.siteID );
	extendSet = subType.getExtendSetByName( 'Default' );
</cfscript>
</cfsilent>
<cfoutput>
<dl class="oneColumn" >
	<span categoryid="" extendsetid="#extendSet.getExtendSetID()#" class="extendset" >
		<input type="hidden" value="#extendSet.getExtendSetID()#" name="extendSetID" >
		<dd>
			<dl>
				<dt>
				
					<a class="tooltip" href="##">Tweet Text: <span>Enter your Tweet here.</span></a>
				</dt>
				<dd>
					<textarea regex="^.{1,140}$" validate="Regex" 
					          message="Please enter no more than 140 characters in the Tweet Box." required="false" 
					          label="Tweet Text:" id="tweetbox" name="tweetbox" ></textarea>
				</dd>
				<dt>
					Tweet this? 
				</dt>
				<dd>
					<input type="radio" value="Yes" name="tweetcheck" id="tweetcheck" >
					Yes 
					<input type="radio" checked="checked" value="No" name="tweetcheck"
					       id="tweetcheck" >
					No 
				</dd>
			</dl>
		</dd>
	</span>
</dl>
</cfoutput>

<script type="text/javascript" >
jQuery(document).ready(function(){
	if(jQuery('input#title').val().length > 0) {
		var data = jQuery('input#title').val();
	    jQuery('textarea#tweetbox').val(data);
	}
	jQuery('input#title').blur(function(){
	    var data = jQuery(this).val();
	    jQuery('textarea#tweetbox').val(data);
	});
});
</script>