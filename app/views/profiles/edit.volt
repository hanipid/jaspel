
<form method="post" autocomplete="off">

  {{ content() }}

  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Edit Profile</h3>
      <div class="box-tools pull-right">

      </div>
    </div>
    <!-- /.box-header -->
    <!-- form start -->
    <form role="form">
      <div class="box-body">
        
        <ul class="nav nav-tabs">
          <li class="active"><a href="#A" data-toggle="tab">Basic</a></li>
          <li><a href="#B" data-toggle="tab">Users</a></li>
        </ul>

        <div class="tabbable">
          <div class="tab-content">
            <div class="tab-pane active" id="A">

              <div class="col-md-4">
                {{ form.render("id") }}

                <div class="form-group">
                  <label for="name">Name</label>
                  {{ form.render("name") }}
                </div>

                <div class="form-group">
                  <label for="active">Active?</label>
                  {{ form.render("active") }}
                </div>
              </div>

            </div>

            <div class="tab-pane" id="B">
              <p>
                <table class="table table-bordered table-striped" align="center">
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Name</th>
                      <th>Banned?</th>
                      <th>Suspended?</th>
                      <th>Active?</th>
                    </tr>
                  </thead>
                  <tbody>
                  {% for user in profile.users %}
                    <tr>
                      <td>{{ user.id }}</td>
                      <td>{{ user.name }}</td>
                      <td>{{ user.banned == 'Y' ? 'Yes' : 'No' }}</td>
                      <td>{{ user.suspended == 'Y' ? 'Yes' : 'No' }}</td>
                      <td>{{ user.active == 'Y' ? 'Yes' : 'No' }}</td>
                      <td width="2%">{{ link_to("users/edit/" ~ user.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
                      <td width="2%">{{ link_to("users/delete/" ~ user.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
                    </tr>
                  {% else %}
                    <tr><td colspan="3" align="center">There are no users assigned to this profile</td></tr>
                  {% endfor %}
                  </tbody>
                </table>
              </p>
            </div>

          </div>
        </div>
      </div>
      <!-- /.box-body -->

      <div class="box-footer">
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
    </form>
  </div>
  <!-- /.box -->

</form>