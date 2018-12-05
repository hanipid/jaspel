
{{ content() }}

{{stylesheet_link("codemirror/lib/codemirror.css")}}
{{stylesheet_link("codemirror/theme/monokai.css")}}
{{stylesheet_link("codemirror/addon/dialog/dialog.css")}}
{{stylesheet_link("codemirror/addon/fold/foldgutter.css")}}
<style type="text/css">
.CodeMirror {
    font-family: "Consolas", "Lucida Console", monospace;
    border: 1px solid black;
    font-size:13px;
    height: 400px;
}

.CodeMirror-scroll {
    height: 400px;
    overflow-y: auto;
    overflow-x: auto;
	width: 100%;
}
</style>
{{javascript_include("codemirror/lib/codemirror.js")}}
{{javascript_include("codemirror/addon/edit/matchbrackets.js")}}
{{javascript_include("codemirror/addon/selection/active-line.js")}}
{{javascript_include("codemirror/addon/comment/comment.js")}}
{{javascript_include("codemirror/addon/search/search.js")}}
{{javascript_include("codemirror/addon/search/searchcursor.js")}}
{{javascript_include("codemirror/addon/dialog/dialog.js")}}
{{javascript_include("codemirror/keymap/sublime.js")}}
{{javascript_include("codemirror/mode/htmlmixed/htmlmixed.js")}}
{{javascript_include("codemirror/mode/xml/xml.js")}}
{{javascript_include("codemirror/mode/javascript/javascript.js")}}
{{javascript_include("codemirror/mode/css/css.js")}}
{{javascript_include("codemirror/mode/clike/clike.js")}}
{{javascript_include("codemirror/mode/php/php.js")}}

<form class="form-inline" method="post">

	<div class="box box-primary">
    <div class="box-header with-border">
      <h3 class="box-title">Manage Permissions</h3>
      <div class="box-tools pull-right">
      	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
      </div>
    </div>
    <!-- /.box-header -->

    <div class="box-body">
      <div class="well" align="center">

				<div class="form-group">
					<label for="profileId">Profile</label>
					{{ select('profileId', profiles, 'using': ['id', 'name'], 'class': 'form-control', 'useEmpty': true, 'emptyText': '...', 'emptyValue': '0') }}
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

    </div>
    <!-- /.box-body -->

  </div>
  <!-- /.box -->

</form>

<div class="box box-primary">
  <div class="box-header with-border">
    <h3 class="box-title">Private Resources</h3>
    <div class="box-tools pull-right">
     	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
    </div>
  </div>
  <!-- /.box-header -->

  <div class="box-body">
    
    <form id="formEditor" method="post" action="{{url('permissions/edit')}}">
    	<div class="alert alert-info notif" style="position:fixed; z-index:9999; width:81%;"></div>

  		<div class="form-group">
        <textarea name="fileContent" id="fileContent" class="form-control">{{fileContent}}</textarea>
      </div>

      <div class="form-group">
        <input type="submit" name="Save" class="btn btn-primary">
      </div>
    </form>

  </div>
  <!-- /.box-body -->

</div>
<!-- /.box -->

<script>
  var value = "// The bindings defined specifically in the Sublime Text mode\nvar bindings = {\n";
  var map = CodeMirror.keyMap.sublime;
  for (var key in map) {
    var val = map[key];
    if (key != "fallthrough" && val != "..." && (!/find/.test(val) || /findUnder/.test(val)))
      value += "  \"" + key + "\": \"" + val + "\",\n";
  }
  value += "}\n\n// The implementation of joinLines\n";
  value += CodeMirror.commands.joinLines.toString().replace(/^function\s*\(/, "function joinLines(").replace(/\n  /g, "\n") + "\n";

	var myCodeMirror, currentHandle = null, currentLine;
	$(".notif").hide();

	window.onload = function () {
	  try {
      myCodeMirror = CodeMirror.fromTextArea(document.getElementById("fileContent"), {
        lineNumbers: true,
        matchBrackets: true,
        mode: "application/x-httpd-php",
        indentWithTabs: false,
        enterMode: "keep",
        theme: "monokai",
        styleActiveLine: true,
        keyMap: "sublime",
        height: "100px",
        onCursorActivity: function () {
          var line = myCodeMirror.getCursor().line, handle = myCodeMirror.getLineHandle(line);
          if (handle == currentHandle && line == currentLine) return;
          if (currentHandle) {
            myCodeMirror.setLineClass(currentHandle, null, null);
            myCodeMirror.clearMarker(currentHandle);
          }
          currentHandle = handle;
          currentLine = line;
          myCodeMirror.setLineClass(currentHandle, null, "activeline");
          myCodeMirror.setMarker(currentHandle, String(line + 1));
        }
      });

      function save() {
        let content = myCodeMirror.getValue();
        $(".notif").show().text("Wait...");
        $.ajax({
          url: '{{url("permissions/edit/")}}',
          type: 'post',
          data: "content="+content,
          success: function(result) {
            $(".notif").hide();
            if (result.saved == false) {
              $(".notif").fadeIn("slow").text("Not saved! Something wrong!");
            } else {
              $(".notif").fadeIn("slow").text("File saved!");
            }
            setTimeout(function() {
              $(".notif").fadeOut("slow");
            }, 3000);
            myCodeMirror.setValue(result.saved);
          }
        });
      }

      jQuery(document).keydown(function(event) {
        if((event.ctrlKey || event.metaKey) && event.which == 83) {
          // Save Function
			  	save();
          event.preventDefault();
          return false;
        }
      });  

      $("#formEditor").on("submit", function(e) {
        save();
        e.preventDefault();
      });
    }
    catch (e) {
      alert(e.stack);
    }
	};

	  
</script>