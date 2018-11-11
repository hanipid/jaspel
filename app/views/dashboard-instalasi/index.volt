{{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/morris.js/morris.css") }}

{{ content() }}

<div class="col-md-12">
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
<!-- /.col-md-12 -->

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