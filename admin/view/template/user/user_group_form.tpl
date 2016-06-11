<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" onclick="save('save')" form="form-user-group" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-success"><i class="fa fa-check"></i></button>
                <button type="submit" form="form-user-group" data-toggle="tooltip" title="<?php echo $button_saveclose; ?>" class="btn btn-default" data-original-title="Save & Close"><i class="fa fa-save text-success"></i></button>
                <button type="submit" onclick="save('new')" form="form-user-group" data-toggle="tooltip" title="<?php echo $button_savenew; ?>" class="btn btn-default" data-original-title="Save & New"><i class="fa fa-plus text-success"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-times-circle text-danger"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-user-group" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-access" data-toggle="tab"><?php echo $entry_access; ?></a></li>
                        <li><a href="#tab-modify" data-toggle="tab"><?php echo $entry_modify; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active in" id="tab-general">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                                    <?php if ($error_name) { ?>
                                    <div class="text-danger"><?php echo $error_name; ?></div>
                                    <?php  } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $entry_dashboard; ?></label>
                                <div class="col-sm-10">
                                    <div class="well well-sm">
                                        <?php foreach ($dashboards as $module_key => $module_value) { ?>
                                        <div class="checkbox">
                                            <label>
                                                <?php if (in_array($module_key, $dashboard)) { ?>
                                                <input type="checkbox" name="permission[dashboard][]" value="<?php echo $module_key; ?>" checked="checked" />
                                                <?php echo $module_value; ?>
                                                <?php } else { ?>
                                                <input type="checkbox" name="permission[dashboard][]" value="<?php echo $module_key; ?>" />
                                                <?php echo $module_value; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                        <?php } ?>
                                    </div>
                                    <a class="user-group-select-button" onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a class="user-group-select-button" onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-access">
                            <div class="form-group">
                                <div class="well user-group">
                                    <div class="user-group-button-group">
                                        <a class="user-group-select-button" onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a class="user-group-select-button" onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                    </div>
                                    <?php foreach ($permissions as $permission) {  ?>
                                    <div class="col-sm-3">
                                        <?php foreach ($permission as $permission_key => $permission_value) { ?>
                                        <div class="file-group">
                                            <label class="control-label"><?php echo ucwords($permission_key); ?></label>
                                            <?php foreach ($permission_value as $layout_key => $layout_value) { ?>
                                            <div class="checkbox">
                                                <label>
                                                    <?php if (in_array($layout_key, $access)) { ?>
                                                    <input type="checkbox" name="permission[access][]" value="<?php echo $layout_key; ?>" checked="checked" />
                                                    <?php echo $layout_value; ?>
                                                    <?php } else { ?>
                                                    <input type="checkbox" name="permission[access][]" value="<?php echo $layout_key; ?>" />
                                                    <?php echo $layout_value; ?>
                                                    <?php } ?>
                                                </label>
                                            </div>
                                            <?php } ?>
                                            <div class="user-group-button-group">
                                                <a class="user-group-select-button" onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a class="user-group-select-button" onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                            </div>
                                        </div>
                                        <?php } ?>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-modify">
                            <div class="form-group">
                                <div class="well user-group">
                                    <div class="user-group-button-group">
                                        <a class="user-group-select-button" onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a class="user-group-select-button" onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                    </div>
                                    <?php foreach ($permissions as $permission) {  ?>
                                    <div class="col-sm-3">
                                        <?php foreach ($permission as $permission_key => $permission_value) { ?>
                                        <div class="file-group">
                                            <label class="control-label"><?php echo ucwords($permission_key); ?></label>
                                            <?php foreach ($permission_value as $layout_key => $layout_value) { ?>
                                            <div class="checkbox">
                                                <label>
                                                    <?php if (in_array($layout_key, $modify)) { ?>
                                                    <input type="checkbox" name="permission[modify][]" value="<?php echo $layout_key; ?>" checked="checked" />
                                                    <?php echo $layout_value; ?>
                                                    <?php } else { ?>
                                                    <input type="checkbox" name="permission[modify][]" value="<?php echo $layout_key; ?>" />
                                                    <?php echo $layout_value; ?>
                                                    <?php } ?>
                                                </label>
                                            </div>
                                            <?php } ?>
                                            <div class="user-group-button-group">
                                                <a class="user-group-select-button" onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a class="user-group-select-button" onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                            </div>
                                        </div>
                                        <?php } ?>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
function save(type){
    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'button';
    input.value = type;
    form = $("form[id^='form-']").append(input);
    form.submit();
}
//--></script>
<?php echo $footer; ?> 
