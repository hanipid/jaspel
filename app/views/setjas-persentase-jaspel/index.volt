<style type="text/css">
.info-box-icon {
  height: 158px; 
  width: 158px;
  line-height: 1.42857143;
}
</style>
{{ content() }}

<form>
  <div class="col-md-4 col-sm-6 col-xs-12">
    <div class="info-box">
      <span class="info-box-icon bg-red">
        <small><strong>Direksi & Jasa</strong></small>
        <p><strong>0%</strong></p>
      </span>

      <div class="info-box-content" style="margin-left: 160px;">
        <div class="form-group">
          <label for="direksi">Persentase Direksi</label>
          <div class="input-group">
            {{ form.render("direksi") }}
            <span class="input-group-addon">%</span>
          </div>
        </div>

        <div class="form-group">
          <label for="jasa">Persentase Jasa</label>
          <div class="input-group">
            {{ form.render("jasa") }}
            <span class="input-group-addon">%</span>
          </div>
        </div>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col-md-4 -->

  <div class="col-md-4 col-sm-6 col-xs-12">
    <div class="info-box">
      <span class="info-box-icon bg-yellow">
        <small><strong>Jasa</strong></small>
        <p><strong>80%</strong></p>
      </span>

      <div class="info-box-content" style="margin-left: 160px;">
        <div class="form-group">
          <label for="jpu">Persentase JPU</label>
          <div class="input-group">
            {{ form.render("jpu") }}
            <span class="input-group-addon">%</span>
          </div>
        </div>

        <div class="form-group">
          <label for="jpl">Persentase JPL</label>
          <div class="input-group">
            {{ form.render("jpl") }}
            <span class="input-group-addon">%</span>
          </div>
        </div>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col-md-4 -->

  <div class="col-md-4 col-sm-6 col-xs-12">
    <div class="info-box">
      <span class="info-box-icon bg-green">
        <small><strong>JPL</strong></small>
        <p><strong>100%</strong></p>
      </span>

      <div class="info-box-content" style="margin-left: 160px;">
        <div class="form-group">
          <label for="admin">Persentase Admin</label>
          <div class="input-group">
            {{ form.render("admin") }}
            <span class="input-group-addon">%</span>
          </div>
        </div>

        <div class="form-group">
          <label for="jplFix">Persentase JPL Fix</label>
          <div class="input-group">
            {{ form.render("jplFix") }}
            <span class="input-group-addon">%</span>
          </div>
        </div>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <!-- /.col-md-4 -->

  <div class="col-md-12">
    {{ submit_button("Save", "class": "btn btn-primary") }}
  </div>
</form>