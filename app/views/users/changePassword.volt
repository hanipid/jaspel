{{ content() }}

<form class="form" method="post" autocomplete="off" action="{{ url("users/changePassword") }}">

    <div class="col-md-3 center scaffold">

        <h2>Change Password</h2>

        <div class="form-group">
            <label for="password">Password</label>
            {{ form.render("password") }}
        </div>

        <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            {{ form.render("confirmPassword") }}
        </div>

        <div class="form-group">
            {{ submit_button("Change Password", "class": "btn btn-primary") }}
        </div>

    </div>

</form>