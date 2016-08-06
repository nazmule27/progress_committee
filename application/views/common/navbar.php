<?php
$CI = &get_instance();
$role = $CI->session->userdata('role');
$username = $CI->session->userdata('username');
?>
<div class="col-md-3 col-sm-4 col-xs-12">
    <div class="nav-block">
        <div id="nav-container">
            <nav>
                <ul>
                    <?php if(($role == 'Admin')){?>
                    <li>
                        <a href="<?=base_url();?>"><i class="glyphicon glyphicon-home"></i> Home</a>
                    </li>
                    <li>
                        <a href="<?=base_url();?>committee"><i class="glyphicon glyphicon-pencil"></i> Create Committee</a>
                    </li>
                    <li>
                        <a href="<?=base_url();?>committee/committee_list"><i class="glyphicon glyphicon-list"></i> Committee List</a>
                    </li>
                    <li>
                        <a href="<?=base_url();?>committee/external_list"><i class="glyphicon glyphicon-list"></i> External List</a>
                        <ul>
                            <li><a href="<?=base_url();?>committee/add"> Add External</a></li>
                        </ul>
                    </li>
                    <?php } ?>
                    <?php if(($role == 'Supervisor')){?>
                    <li>
                        <a href="<?=base_url();?>"><i class="glyphicon glyphicon-home"></i> Home</a>
                    </li>
                    <li>
                        <a href="<?=base_url();?>supervisor"><i class="glyphicon glyphicon-education"></i> Upcoming Meeting</a>
                    </li>
                    <li>
                        <a href="<?=base_url();?>supervisor/home"><i class="glyphicon glyphicon-pencil"></i> Supervisor Dashboard</a>
                    </li>
                    <?php } ?>
                    <?php if(($role == 'Student')){?>
                    <li>
                        <a href="<?=base_url();?>"><i class="glyphicon glyphicon-home"></i> Home</a>
                    </li>
                    <li>
                        <a href="<?=base_url();?>student"><i class="glyphicon glyphicon-search"></i> Dashboard</a>
                    </li>
                    <?php } ?>
                </ul>
            </nav>
        </div>
        <!--nav end-->
    </div>
</div>
