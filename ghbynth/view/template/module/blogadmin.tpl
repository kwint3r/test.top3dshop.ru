<div id="blog-menu_admin" style="display: none;">
      <li id="seocms-menu"><a href="<?php echo $url_module; ?>" class="top"><?php echo $url_module_text; ?></a>
        <ul>
        <li><a href="<?php echo HTTP_SERVER.$this->language->get('url_schemes').$token; ?>"><?php echo $this->language->get('tab_general'); ?></a></li>
        <li><a href="<?php echo HTTP_SERVER.$this->language->get('url_widgets').$token; ?>"><?php echo $this->language->get('tab_list'); ?></a></li>

        <li><a href="<?php echo HTTP_SERVER.$this->language->get('url_fields').$token; ?>"><?php echo $this->language->get('entry_fields_editor'); ?></a></li>



          <li><a href="<?php echo $url_blog; ?>"><?php echo $url_blog_text; ?></a></li>
          <li><a href="<?php echo $url_record; ?>"><?php echo $url_record_text; ?></a></li>
          <li><a href="<?php echo $url_comment; ?>"><?php echo $url_comment_text; ?></a></li>

          <li><a href="<?php echo $url_forum; ?>" style="word-wrap: normal; "><?php echo $url_forum_text; ?></a></li>

          <li><a href="<?php echo $url_forum_buy; ?>" style="word-wrap: normal; "><?php echo $url_forum_buy_text; ?></a></li>
          <li><a href="<?php echo $url_forum; ?>" style="word-wrap: normal; "><?php echo $url_forum_site_text; ?></a></li>

          <li><a href="<?php echo $this->language->get('url_buy'); ?>" style="word-wrap: normal; " class="parent"><?php echo $this->language->get('url_buy_text'); ?></a>

          <ul>
           <li style="height: 40px; width: 199px;"><a href="<?php echo $this->language->get('url_buy'); ?>" target="_blank" style="word-wrap: normal;"><?php echo $this->language->get('url_dev_oa_text'); ?></a></li>
           <li style="height: 40px; width: 199px;"><a href="<?php echo $this->language->get('url_diler_of'); ?>" target="_blank" style="word-wrap: normal;"><?php echo $this->language->get('url_diler_of_text'); ?></a></li>
           <li style="height: 40px; width: 199px;"><a href="<?php echo $this->language->get('url_diler_lo'); ?>" target="_blank" style="word-wrap: normal;"><?php echo $this->language->get('url_diler_lo_text'); ?></a></li>
          </ul>


          </li>


          <li><a href="<?php echo $url_forum_buy; ?>" style="word-wrap: normal; " class="parent"><?php echo $url_forum_update_text; ?></a>

          <ul>
           <li style="height: 40px; width: 199px;"><a href="<?php echo $this->language->get('url_dev_oa'); ?>" target="_blank" style="word-wrap: normal;"><?php echo $this->language->get('url_dev_oa_text'); ?></a></li>
           <li style="height: 40px; width: 199px;"><a href="<?php echo $this->language->get('url_diler_of'); ?>" target="_blank" style="word-wrap: normal;"><?php echo $this->language->get('url_diler_of_text'); ?></a></li>
           <li style="height: 40px; width: 199px;"><a href="<?php echo $this->language->get('url_diler_lo'); ?>" target="_blank" style="word-wrap: normal;"><?php echo $this->language->get('url_diler_lo_text'); ?></a></li>
          </ul>


          </li>


          <li><a href="<?php echo $url_opencartadmin; ?>" style="word-wrap: normal; "><?php echo $url_opencartadmin_text; ?></a></li>

        </ul>
      </li>
    </ul>


</div>
<!-- <a href="http://opencartadmin.com">SEO CMS <?php echo $blog_version;?></a> -->

<script>
$(document).ready(function(){
var blog_menu_admin = $('#blog-menu_admin').html();
$('#menu ul:first').append(blog_menu_admin);

	if (typeof $('#menu > ul').superfish == 'function') {
		$('#menu > ul').superfish({
			hoverClass	 : 'sfHover',
			pathClass	 : 'overideThisToUse',
			delay		 : 0,
			animation	 : {height: 'show'},
			speed		 : 'normal',
			autoArrows   : false,
			dropShadows  : false,
			disableHI	 : false, /* set to true to disable hoverIntent detection */
			onInit		 : function(){},
			onBeforeShow : function(){},
			onShow		 : function(){},
			onHide		 : function(){}
		});
	}

	$('#menu > ul').css('display', 'block');



$('#blog-menu_admin').remove();
});
</script>