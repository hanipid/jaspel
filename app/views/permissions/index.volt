
{{ content() }}

<form class="form-inline" method="post">

<h2>Manage Permissions</h2>

<div class="well" align="center">

	<div class="form-group">
		<label for="profileId">Profile</label>
		{{ select('profileId', profiles, 'using': ['id', 'name'], 'class': 'form-control', 'useEmpty': true, 'emptyText': '...', 'emptyValue': '') }}
		{{ submit_button('Search', 'class': 'btn btn-primary', 'name' : 'search') }}
	</div>

</div>

{% if request.isPost() and profile %}

{% for resource, actions in acl.getResources() %}

	<h3>{{ resource }}</h3>

	<table class="table table-bordered table-striped" align="center">
		<thead>
			<tr>
				<th width="5%"></th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			{% for action in actions %}
			<tr>
				<td align="center"><input type="checkbox" name="permissions[]" value="{{ resource ~ '.' ~ action }}"  {% if permissions[resource ~ '.' ~ action] is defined %} checked="checked" {% endif %}></td>
				<td>{{ acl.getActionDescription(action) ~ ' ' ~ resource }}</td>
			</tr>
			{% endfor %}
		</tbody>
	</table>
			
{% endfor %}

{{ submit_button('Submit', 'class': 'btn btn-primary', 'name':'submit') }}   

{% endif %}

</form>
