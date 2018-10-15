{{ content() }}

<div align="right">
    {{ link_to("profiles/create", "<i class='icon-plus-sign'></i> Create Profiles", "class": "btn btn-primary") }}
</div>

<form class="form" method="post" action="{{ url("profiles/search") }}" autocomplete="off">

    <div class="col-md-4 center scaffold">

        <h2>Search profiles</h2>

        <div class="form-group">
            <label for="id">Id</label>
            {{ form.render("id") }}
        </div>

        <div class="form-group">
            <label for="name">Name</label>
            {{ form.render("name") }}
        </div>

        <div class="form-group">
            {{ submit_button("Search", "class": "btn btn-primary") }}
        </div>

    </div>

</form>