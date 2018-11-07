{{ content() }}

<div class="box box-primary">
  <div class="box-header with-border">
    <h3 class="box-title">Users</h3>
    <div class="box-tools pull-right">
      <form class="inline-form" method="post" action="{{ url("users/search") }}" autocomplete="off">
        <div class="input-group input-group-md">
          {{ form.render("name") }}
          <span class="input-group-btn">
            <button type="submit" class="btn btn-info btn-flat">Search!</button>
            {{ link_to("users/create", "<i class='glyphicon glyphicon-plus'></i> Create Users", "class": "btn btn-primary") }}
          </span>
        </div>
      </form>        
    </div>
  </div>
  <!-- /.box-header -->

  <div class="box-body">
    {% for user in page.items %}
      {% if user %}
        {% if loop.first %}
        <table class="table table-bordered table-striped" align="center">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Email</th>
              <th>Profile</th>
              <th>Banned?</th>
              <th>Suspended?</th>
              <th>Confirmed?</th>
            </tr>
          </thead>
          <tbody>
        {% endif %}
            <tr>
              <td>{{ user.id }}</td>
              <td>{{ user.name }}</td>
              <td>{{ user.email }}</td>
              <td>{{ user.profile.name }}</td>
              <td>{{ user.banned == 'Y' ? 'Yes' : 'No' }}</td>
              <td>{{ user.suspended == 'Y' ? 'Yes' : 'No' }}</td>
              <td>{{ user.active == 'Y' ? 'Yes' : 'No' }}</td>
              <td width="2%" class="text-center">{{ link_to("users/edit/" ~ user.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
              <td width="2%" class="text-center">{{ link_to("users/delete/" ~ user.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
            </tr>
        {% if loop.last %}
          </tbody>
          <tfoot>
            <tr>
              <td colspan="10" align="right">
                <ul class="pagination pagination-sm no-margin pull-right">
                  <li>{{ link_to("users/search", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                  <li>{{ link_to("users/search?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                  <li>{{ link_to("users/search?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                  <li>{{ link_to("users/search?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
                  <li><span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span></li>
                </ul>
              </td>
            </tr>
          </tfoot>
        </table>
        {% endif %}
      {% else %}
        No users are recorded
      {% endif %}
    {% endfor %}
  </div>
  <!-- /.box-body -->

</div>
<!-- /.box -->

<div class="box box-primary collapsed-box">
  <div class="box-header with-border">
    <h3 class="box-title">Advanced Search Users</h3>
    <div class="box-tools pull-right">
      <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>   
    </div>
  </div>
  <!-- /.box-header -->

  <div class="box-body">
    <form class="form" method="post" action="{{ url("users/search") }}" autocomplete="off">

      <div class="form-group">
        <label for="id">Id</label>
        {{ form.render("id") }}
      </div>

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

      <div class="form-group">
        <button type="submit" class="btn btn-primary">Search</button>
      </div>

    </form>
  </div>
  <!-- /.box-body -->

</div>
<!-- /.box -->