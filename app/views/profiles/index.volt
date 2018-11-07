{{ content() }}

{##}

<div class="col-md-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Profiles</h3>
      <div class="box-tools pull-right">
        <form class="inline-form" method="post" action="{{ url("profiles/search") }}" autocomplete="off">
          <div class="input-group input-group-md">
            {{ form.render("name") }}
            <span class="input-group-btn">
              <button type="submit" class="btn btn-info btn-flat">Search!</button>
              {{ link_to("profiles/create", "<i class='glyphicon glyphicon-plus'></i> Create Profiles", "class": "btn btn-primary") }}
            </span>
          </div>
        </form>        
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      {% for profile in page.items %}
        {% if profile %}
          {% if loop.first %}
          <table class="table table-bordered table-striped" align="center">
            <thead>
              <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Active?</th>
              </tr>
            </thead>
            <tbody>
          {% endif %}
              <tr>
                <td>{{ profile.id }}</td>
                <td>{{ profile.name }}</td>
                <td>{{ profile.active == 'Y' ? 'Yes' : 'No' }}</td>
                <td width="2%">{{ link_to("profiles/edit/" ~ profile.id, '<i class="glyphicon glyphicon-pencil"></i> Edit', "class": "btn btn-primary") }}</td>
                <td width="2%">{{ link_to("profiles/delete/" ~ profile.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-danger", "onclick": "return confirm('Are you sure?')") }}</td>
              </tr>
          {% if loop.last %}
            </tbody>
            <tfoot>
              <tr>
                <td colspan="10" align="right">
                  <ul class="pagination pagination-sm no-margin pull-right">
                    <li>{{ link_to("profiles/search", '<i class="glyphicon glyphicon-fast-backward"></i> First') }}</li>
                    <li>{{ link_to("profiles/search?page=" ~ page.before, '<i class="glyphicon glyphicon-step-backward"></i> Previous') }}</li>
                    <li>{{ link_to("profiles/search?page=" ~ page.next, '<i class="glyphicon glyphicon-step-forward"></i> Next') }}</li>
                    <li>{{ link_to("profiles/search?page=" ~ page.last, '<i class="glyphicon glyphicon-fast-forward"></i> Last') }}</li>
                    <li><span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span></li>
                  </ul>
                </td>
              </tr>
            </tfoot>
          </table>
          {% endif %}
        {% else %}
          No profiles are recorded
        {% endif %}
      {% endfor %}
    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-12 -->