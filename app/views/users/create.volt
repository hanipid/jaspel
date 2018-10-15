
<form class="form" method="post" autocomplete="off">

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("users", "&larr; Go Back") }}
    </li>
    <li class="pull-right">
        {{ submit_button("Save", "class": "btn btn-success") }}
    </li>
</ul>

{{ content() }}

<div class="col-md-4">
    <h2>Create a User</h2>

    <div class="form-group">
        <label for="name">Name</label>
        {{ form.render("name") }}
    </div>

    <div class="form-group">
        <label for="email">E-Mail</label>
        {{ form.render("email") }}
    </div>

    <div class="form-group">
        <label for="profilesId">Profile</label>
        {{ form.render("profilesId") }}
    </div>

</div>

</form>