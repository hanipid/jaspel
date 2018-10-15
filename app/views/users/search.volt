{{ content() }}

<ul class="pager">
    <li class="previous">
        {{ link_to("users/index", "&larr; Go Back") }}
    </li>
    <li class="next">
        {{ link_to("users/create", "Create users") }}
    </li>
</ul>

{% for user in page.items %}
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
{% endfor %}
