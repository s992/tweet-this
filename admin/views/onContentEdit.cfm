<dl class="oneColumn" >

	<span categoryid="" extendsetid="748CBAF4-B711-6C6C-60DA557364B7C46A" class="extendset" >
		<input type="hidden" value="748CBAF4-B711-6C6C-60DA557364B7C46A" name="extendSetID" >
		
		<dd>
			<dl>
				<dt>
				
					<a class="tooltip" href="#">Tweet Text: <span>Enter your Tweet here.</span></a>
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