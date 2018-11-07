{{ content() }}

<div id="menus">

  <div class="loading text-center">Loading</div>

  <div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Menus</h3>
      <div class="box-tools pull-right">
        {{ link_to("menus/create", "<i class='icon-plus-sign'></i> Create a menu", "class": "btn btn-primary") }}
      </div>
    </div>
    <!-- /.box-header -->
    <!-- form start -->
    <form role="form">
      <div class="box-body">
        {%- macro print_menu_level(menu_level_items) %}

          {%- for menu_item in menu_level_items %}

            {% set next_menu_level_items = menu_item.getChilds() %}
            {% set isParents = menu_item.isParents() %}
            {% if loop.first %}
              {% if menu_item.parent == 0 %}
                <ol class="nav_menu_list">
              {% else %}
                <ol>
              {% endif %}
            {% endif %}

            <li data-id="{{ menu_item.id }}">


              <div class="row">
                <div class="col-md-8">
                  {% if menu_item.parent == 0 %}
                    <i class="fa fa-arrows"></i>
                  {% endif %}
                  {{ menu_item.nama }} {#- {{ menu_item.sort }}#}
                </div>

                <div class="col-md-4">
                  {% if !next_menu_level_items %}
                    <a href="{{url('menus/delete/'~menu_item.id)}}" onclick="return confirm('Are you sure?')" class="btn btn-danger cek" id="{{menu_item.id}}" cek="0">Delete</a>
                  {% endif %}
                  <a href="{{ url('menus/edit/'~menu_item.id) }}" class="btn btn-warning">Edit</a>
                </div>
              </div>

              {% if next_menu_level_items %}
                  {{ print_menu_level(next_menu_level_items) }}
              {% endif %}

            </li>

            {% if loop.last %}
              </ol>
            {% endif %}

          {%- endfor %}

        {%- endmacro %}

        {{ print_menu_level(root_menu_items) }}
      </div>
      <!-- /.box-body -->
    </form>
  </div>
  <!-- /.box -->
</div>

{{ javascript_include("js/jquery-sortable.js") }}
<script>
/**
* JQUERY SORTABLE
**/
$(function  () {
  $('.loading').hide();
  // nav_menu_list
  var group = $("ol.nav_menu_list").sortable({
    group: 'nav_menu_list',
    delay: 500,
    onDrop: function ($item, container, _super) {
      var data = group.sortable("serialize").get();
      var sorted = [];

      $('.nav_menu_list li').each(function(){
        sorted.push($(this).data('id'));
      });

      var jsonString = JSON.stringify(sorted, null, ' ');
      // alert(jsonString);

      $.ajax({
        data: {id:sorted},
        type: 'POST',
        url: "{{url('menus/order')}}",
        success : function(response){
          console.log("saved");
          $('.loading').show();
          // $("#menus").html(response);
          $('.loading').hide();
        },
        fail : function(){
          alert("Gagal");
        }
      });
      _super($item, container);
    }
  });
});
</script>