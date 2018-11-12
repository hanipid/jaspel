{{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/morris.js/morris.css") }}

{{ content() }}

<div class="col-md-6">
  <!-- LINE CHART -->
  <div class="box box-info">
    <div class="box-header with-border">
      <h3 class="box-title">Line Chart</h3>

      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
        </button>
        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
      </div>
    </div>
    <div class="box-body">
      <div id="line-chart" style="height: 300px;"></div>
    </div>
    <!-- /.box-body -->
  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-6 -->

<div class="col-md-6">
	<div class="box box-success">
	  <div class="box-header ui-sortable-handle" style="cursor: move;">
	    <i class="fa fa-comments-o"></i>

	    <h3 class="box-title">Chat</h3>

	    <div class="box-tools pull-right" data-toggle="tooltip" title="" data-original-title="Status">
	      <div class="btn-group" data-toggle="btn-toggle">
	        <button type="button" class="btn btn-default btn-sm active"><i class="fa fa-square text-green"></i>
	        </button>
	        <button type="button" class="btn btn-default btn-sm"><i class="fa fa-square text-red"></i></button>
	      </div>
	    </div>
	  </div>
	  <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 250px;"><div class="box-body chat" id="chat-box" style="overflow: hidden; width: auto; height: 250px;">
	    <!-- chat item -->
	    <div class="item">
	      <img src="{{url('/img/user4-128x128.jpg')}}" alt="user image" class="online">

	      <p class="message">
	        <a href="#" class="name">
	          <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 2:15</small>
	          Mike Doe
	        </a>
	        I would like to meet you to discuss the latest news about
	        the arrival of the new theme. They say it is going to be one the
	        best themes on the market
	      </p>
	      <div class="attachment">
	        <h4>Attachments:</h4>

	        <p class="filename">
	          Theme-thumbnail-image.jpg
	        </p>

	        <div class="pull-right">
	          <button type="button" class="btn btn-primary btn-sm btn-flat">Open</button>
	        </div>
	      </div>
	      <!-- /.attachment -->
	    </div>
	    <!-- /.item -->
	    <!-- chat item -->
	    <div class="item">
	      <img src="{{url('/img/user5-128x128.jpg')}}" alt="user image" class="offline">

	      <p class="message">
	        <a href="#" class="name">
	          <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:15</small>
	          Alexander Pierce
	        </a>
	        I would like to meet you to discuss the latest news about
	        the arrival of the new theme. They say it is going to be one the
	        best themes on the market
	      </p>
	    </div>
	    <!-- /.item -->
	    <!-- chat item -->
	    <div class="item">
	      <img src="{{url('/img/user2-160x160.jpg')}}" alt="user image" class="offline">

	      <p class="message">
	        <a href="#" class="name">
	          <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:30</small>
	          Susan Doe
	        </a>
	        I would like to meet you to discuss the latest news about
	        the arrival of the new theme. They say it is going to be one the
	        best themes on the market
	      </p>
	    </div>
	    <!-- /.item -->
	  </div><div class="slimScrollBar" style="background: rgb(0, 0, 0) none repeat scroll 0% 0%; width: 7px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 187.126px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;"></div></div>
	  <!-- /.chat -->
	  <div class="box-footer">
	    <div class="input-group">
	      <input class="form-control" placeholder="Type message...">

	      <div class="input-group-btn">
	        <button type="button" class="btn btn-success"><i class="fa fa-plus"></i></button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /.box-success -->
</div>

{{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/Flot/jquery.flot.js") }}
<script>
$(function () {
	/*
   * LINE CHART
   * ----------
   */

  var areaData 	= [[2, 88.0], [3, 93.3], [4, 102.0], [5, 108.5], [6, 115.7], [7, 115.6]];
  var areaData2 = [[2, 124.6], [3, 130.3], [4, 134.3], [5, 141.4], [6, 146.5], [7, 151.7]];
  var areaData3 = [[2, 159.9], [3, 165.4], [4, 167.8], [5, 168.7], [6, 169.5], [7, 168.0]];

  $.plot('#line-chart', [areaData, areaData2, areaData3], {
    grid  : {
      hoverable  : true,
      borderColor: '#f3f3f3',
      borderWidth: 1,
      tickColor  : '#f3f3f3'
    },
    series: {
      shadowSize: 0,
      lines     : {
        show: true
      },
      points    : {
        show: true
      }
    },
    lines : {
      fill : false,
      color: ['#3c8dbc', '#f56954']
    },
    yaxis : {
      show: true
    },
    xaxis : {
      show: true
    }
  })
  //Initialize tooltip on hover
  $('<div class="tooltip-inner" id="line-chart-tooltip"></div>').css({
    position: 'absolute',
    display : 'none',
    opacity : 0.8
  }).appendTo('body')
  $('#line-chart').bind('plothover', function (event, pos, item) {

    if (item) {
      var x = item.datapoint[0].toFixed(2),
          y = item.datapoint[1].toFixed(2)

      $('#line-chart-tooltip').html(item.series.label + ' of ' + x + ' = ' + y)
        .css({ top: item.pageY + 5, left: item.pageX + 5 })
        .fadeIn(200)
    } else {
      $('#line-chart-tooltip').hide()
    }

  })
  /* END LINE CHART */
});

</script>