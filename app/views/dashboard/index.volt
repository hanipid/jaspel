{{ stylesheet_link("vendor/almasaeed2010/adminlte/bower_components/morris.js/morris.css") }}

{{ content() }}

<div class="col-md-6">
  <!-- LINE CHART -->
  <div class="box box-info">
    <div class="box-header with-border">
      <h3 class="box-title">BPJS Sebelum Klaim</h3>

      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
        </button>
        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
      </div>
    </div>
    <div class="box-body chart-responsive">
      <div class="chart" id="line-chart1" style="height: 300px;"></div>
    </div>
    <!-- /.box-body -->
  </div>
  <!-- /.box -->
</div>
<!-- /.col-md-6 -->

<div class="col-md-6">
	<!-- LINE CHART -->
  <div class="box box-info">
    <div class="box-header with-border">
      <h3 class="box-title">BPJS Setelah Klaim</h3>

      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
        </button>
        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
      </div>
    </div>
    <div class="box-body chart-responsive">
      <div class="chart" id="line-chart2" style="height: 300px;"></div>
    </div>
    <!-- /.box-body -->
  </div>
  <!-- /.box -->
</div>

{{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/raphael/raphael.min.js") }}
{{ javascript_include("vendor/almasaeed2010/adminlte/bower_components/morris.js/morris.min.js") }}
<script>
$(function () {

    // LINE CHART
    var line = new Morris.Line({
      element: 'line-chart1',
      resize: true,
      // data: {{arrPengajuan}},
      data: [
        {y: '2011 Q1', item1: 2666},
        {y: '2011 Q2', item1: 2778},
        {y: '2011 Q3', item1: 4912},
        {y: '2011 Q4', item1: 3767},
        {y: '2012 Q1', item1: 6810},
        {y: '2012 Q2', item1: 5670},
        {y: '2012 Q3', item1: 4820},
        {y: '2012 Q4', item1: 15073},
        {y: '2013 Q1', item1: 10687},
        {y: '2013 Q2', item1: 8432}
      ],
      xkey: 'y',
      ykeys: ['item1'],
      labels: ['BPJS'],
      lineColors: ['#3c8dbc'],
      hideHover: 'auto'
    });

    // LINE CHART
    var line = new Morris.Line({
      element: 'line-chart2',
      resize: true,
      // data: {{arrPengajuan}},
      data: [
        {y: '2011 Q1', item1: 2666},
        {y: '2011 Q2', item1: 2778},
        {y: '2011 Q3', item1: 4912},
        {y: '2011 Q4', item1: 3767},
        {y: '2012 Q1', item1: 6810},
        {y: '2012 Q2', item1: 5670},
        {y: '2012 Q3', item1: 4820},
        {y: '2012 Q4', item1: 15073},
        {y: '2013 Q1', item1: 10687},
        {y: '2013 Q2', item1: 8432}
      ],
      xkey: 'y',
      ykeys: ['item1'],
      labels: ['BPJS'],
      lineColors: ['#3cbc8d'],
      hideHover: 'auto'
    });

});

</script>