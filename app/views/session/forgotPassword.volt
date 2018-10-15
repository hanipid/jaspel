{{ content() }}

<div class="text-center well">

	{{ form('class': 'form-inline') }}

	<div class="text-left">
		<h2>Forgot Password?</h2>
	</div>

		{{ form.render('email') }}
		{{ form.render('Send') }}

		<hr>

	</form>

</div>