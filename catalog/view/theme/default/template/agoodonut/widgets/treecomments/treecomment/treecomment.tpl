<div class="container_comments" id="container_comments_<?php echo $mark;?>_<?php echo $mark_id;?>">
	<noindex>
		<div class="container_comments_vars" id="container_comments_vars_<?php echo $mark;?>_<?php echo $mark_id;?>" style="display: none">
			<div class="mark"><?php echo $mark; ?></div>
			<div class="mark_id"><?php echo $mark_id; ?></div>
			<div class="text_rollup_down"><?php echo $text_rollup_down; ?></div>
			<div class="text_rollup"><?php echo $text_rollup; ?></div>
			<div class="visual_editor"><?php echo $visual_editor; ?></div>
			<div class="sorting"><?php echo $sorting; ?></div>
			<div class="page"><?php echo $page; ?></div>
			<div class="mylist_position"><?php echo $mylist_position; ?></div>
			<div class="text_voted_blog_plus"><?php echo  $this->language->get('text_voted_blog_plus'); ?></div>
			<div class="text_voted_blog_minus"><?php echo  $this->language->get('text_voted_blog_minus'); ?></div>
			<div class="text_all"><?php echo  $this->language->get('text_all'); ?></div>
			<div class="prefix"><?php echo $prefix;?></div>
		</div>
	</noindex>

	<?php  if (isset($mycomments) && $mycomments) {			  if (isset($record_comment['admin_name']) && $record_comment['admin_name']) {
				$admin_name =  array_flip(explode(";",trim($record_comment['admin_name'])));
			  }
	?>

	<?php
	$opendiv=0;
	foreach ($mycomments as $number => $comment) {
	$opendiv++;
	if (isset($admin_name[$comment['author']])) {	 $back_color = $record_comment['admin_color'];
	} else {	 $back_color ='#FFFFFF';
	}


	?>

	<div id="comment_link_<?php  echo $comment['comment_id']; ?>" class="<?php echo $prefix;?>form_customer_pointer comment_content level_<?php  echo $comment['level']; ?>" style="overflow: hidden;  ">

		<div class="container_comment_vars" id="container_comment_<?php echo $mark;?>_<?php echo $mark_id;?>_<?php echo  $comment['comment_id']; ?>" style="display: none">
			<div class="comment_id"><?php echo  $comment['comment_id']; ?></div>
		</div>

		<div class="padding10" style="background-color: <?php echo $back_color; ?>;">
			<b><?php  echo $comment['author']; ?></b>
			<?php if (isset($settings_widget['rating']) && $settings_widget['rating'] && $comment['rating_mark']==0 ) { ?>
			<br>

			<?php
			$themeFile = $this->getThemeFile('image/blogstars-'.$comment['rating'].'.png');
			if ($themeFile) {
			?>
			<img style="border: 0px;"  title="<?php echo $comment['rating']; ?>" alt="<?php echo $comment['rating']; ?>" src="catalog/view/theme/<?php echo $themeFile; ?>">
			<?php } ?>


			<?php } ?>

			<?php  if (isset($record_comment['karma']) && $record_comment['karma']) { ?>
			<div class="voting  <?php  if ($comment['customer_delta'] < 0) echo 'voted_blog_minus';  if ($comment['customer_delta'] > 0) echo 'voted_blog_plus';?> floatright"  id="voting_<?php  echo $comment['comment_id']; ?>">
				<?php
				if (!$comment['customer'] && (isset($thislist['karma_reg']) && $thislist['karma_reg']==1) ){ ?>
				<a href="#" class="textdecoration_none">
					<ins  class="hrefajax customer_enter">
						<span class="blog_minus" title="<?php echo  $this->language->get('text_vote_will_reg'); ?>"></span>
						<span class="blog_plus" title="<?php echo  $this->language->get('text_vote_will_reg'); ?>"></span>
					</ins>
				</a>
				<?php } else { ?>


				<a href="#blog_minus"  title="<?php echo  $this->language->get('text_vote_blog_minus'); ?>"  class="karma_minus blog_minus comments_vote" ></a>
				<a href="#blog_plus"  title="<?php echo  $this->language->get('text_vote_blog_plus'); ?>"  class="karma_plus blog_plus comments_vote" ></a>
				<?php } ?>
				<div class="mark <?php  if($comment['delta']>=0) {  echo 'positive'; } else {  echo 'negative'; } ?> " >
					<span title="Всего <?php  echo $comment['rate_count']; ?>: ↑<?php  echo $comment['rate_count_blog_plus']; ?> и ↓<?php  echo $comment['rate_count_blog_minus']; ?>" class="score"><?php  if($comment['delta']>0) {  echo '+'; } ?><?php  echo sprintf("%d", $comment['delta']); ?></span>
				</div>
			</div>
			<?php } ?>
			<br>
			<div class="com_date_added"><?php echo $comment['date_added']; ?>&nbsp;&nbsp;<a href="<?php echo $url;?>#comment_link_<?php  echo $comment['comment_id']; ?>">#</a>
	<?php
	 if ($userLogged)  {	 	if ($mark == 'product_id') {
	?>
	   &nbsp;&nbsp;&nbsp;<a class="zametki" target="_blank" href="<?php echo $admin_path; ?>index.php?route=catalog/review/update&token=<?php echo $this->session->data['token']; ?>&review_id=<?php echo $comment['comment_id']; ?>">*</a>
	<?php
	  }
	  	if ($mark == 'record_id') {
	?>
	   &nbsp;&nbsp;&nbsp;<a class="zametki" target="_blank" href="<?php echo $admin_path; ?>index.php?route=catalog/comment/update&token=<?php echo $this->session->data['token']; ?>&comment_id=<?php echo $comment['comment_id']; ?>">*</a>
	<?php
	  }

	 }
	?>
			</div>
			<div class="com_text  color_<?php  if($comment['delta']>=0) {  echo '000'; } else {  echo 'AAA'; } ?>;">
				<div class="width100">
					<?php
					foreach ($comment['fields'] as $af_name =>$field) {
   					if($field['value']!="") {					?>
                     <div style="margin-bottom:5px;">
                     <?php
                       if ($field['field'][$this->config->get('config_language_id')]['field_template_out']!='') {
                       $field_html = $field['field'][$this->config->get('config_language_id')]['field_template_out'];



                       if ($field['field_type']=='rating') {
                             if ($field['value']!= "0") {
								$themeFile = $this->getThemeFile('image/blogstars-'.$field['value'].'.png');
								if ($themeFile) {								$field_html = str_replace('{FIELD}', '<img style="border: 0px;"  title="'.$field['value'].'" alt="'.$field['value'].'" src="catalog/view/theme/'.$themeFile.'">', $field_html);
							  }
							 }
						} else {
                       		$field_html = str_replace('{FIELD}', $field['value'], $field_html);
                       }

                       if ($field['field_image']!='') {
                        $field_html = str_replace('{IMAGE}', '<img src="'.$this->getHttpImage().$field['field_image'].'" title="'.$field['field_description'][$this->config->get('config_language_id')].'" alt="'.$field['field_description'][$this->config->get('config_language_id')].'">', $field_html);
                       } else {                        $field_html = str_replace('{IMAGE}', '',$field_html);
                       }

                       if ($field['field_description'][$this->config->get('config_language_id')]!='') {
                        $field_html = str_replace('{DESCRIPTION}',$field['field_description'][$this->config->get('config_language_id')], $field_html);
                       } else {
                        $field_html = str_replace('{DESCRIPTION}', '',$field_html);
                       }
                       ?>
                       <?php echo html_entity_decode($field_html, ENT_QUOTES, 'UTF-8') ; ?>
                      <?php
                      } else {
                     ?>
						<div style="width: 24px; float:left;">
							<?php


                            if ($field['value']!= "0") {

							if ($field['field_image']!='') {                             ?>
							<img src="<?php echo $this->getHttpImage().$field['field_image']; ?>" title="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>" alt="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>">
							<?php
							 } else {
							 $themeFile = $this->getThemeFile('image/'.$field['field_name'].'.png');
							if ($themeFile) {
							?>
							<img src="catalog/view/theme/<?php echo $themeFile; ?>" title="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>" alt="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>">
							<?php } } } ?>

						</div>
						<div>
							<?php
							if ($field['field_type']=='rating') {                             if ($field['value']!= "0") {
								$themeFile = $this->getThemeFile('image/blogstars-'.$field['value'].'.png');
								if ($themeFile) {
								?>
								<ins class="field_title"><?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>:&nbsp;</ins><img style="border: 0px;"  title="<?php echo $field['value']; ?>" alt="<?php echo $field['value']; ?>" src="catalog/view/theme/<?php echo $themeFile; ?>">
								<?php } }
							} else {
							?>
							<ins class="field_title"><?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>:&nbsp;</ins><ins class="field_text"><?php echo $field['value']; ?></ins>
							<?php } ?>
						</div>
                     <?php } ?>


                   </div>
				<?php

					}
				   }
				?>
				</div>

				<div class="bbcode-text" id="bbcode-text-<?php echo  $comment['comment_id']; ?>">
					<?php echo $comment['text']; ?>
				</div>

			</div>

			<div class="margintop10">
				<a href="#" id="comment_id_reply_<?php echo $comment['comment_id']; ?>" class="comment_reply comment_buttons hrefajax"><?php
					echo $text_reply_button;
					?></a>
			</div>

			<?php
			// determine the actual setting the mark rollup
			if (isset($mycomments[$number + 1]['parent_id']) && ($mycomments[$number + 1]['parent_id'] == $comment['comment_id']))
			{
			?>
			<div class="floatright" >

				<a href="#" id="rollup<?php echo $comment['comment_id']; ?>" class="hrefajax comments_rollup"><?php echo $text_rollup; ?></a>

			</div>
			<?php

			}
			// reply form the way we steal from record.tpl :)  through comment_reply js function, of course
			?>
			<!-- for reply form -->
			<div class="overflowhidden width100 lineheight1 height1">&nbsp;</div>
			<div id="<?php echo $prefix;?>comment_work_<?php echo $comment['comment_id']; ?>" class="<?php echo $prefix;?>comment_work width100 margintop5">
			</div>
		</div>
		<div id="parent<?php echo $comment['comment_id']; ?>" class="comments_parent">
			<?php
			if ($comment['flag_end']>0) {

			if ($comment['flag_end']>$opendiv) {
			$comment['flag_end']=$opendiv;
			}
			//echo " Close div: ".$opendiv;
			for ($i=0; $i<$comment['flag_end']; $i++)
			{
			$opendiv--;

			?>
		</div>
	</div>
	<?php

	}
	}
	}
	// for not close div
	if ($opendiv>0 ) {
	for ($i=0; $i<$opendiv; $i++)
	{
	?>
</div>
</div>
<?php
}
}
?>


<div class="floatright displayinline"><?php  echo $entry_sorting; ?>
	<!-- <select name="sorting" class="comments_sorting" onchange="$('#comment').comments(this[this.selectedIndex].value);"> -->
	<select name="sorting" class="comments_sorting" onchange="$('#comment').comments(this[this.selectedIndex].value);">
		<option <?php if ($sorting == 'desc')  echo 'selected="selected"'; ?> value="desc"><?php echo $text_sorting_desc; ?></option>
		<option <?php if ($sorting == 'asc')   echo 'selected="selected"'; ?> value="asc"><?php  echo $text_sorting_asc;  ?></option>
	</select>

</div>

<div class="pagination"><?php echo $pagination; ?></div>

<?php  }  else { ?>
<div class="content"><?php echo $text_no_comments; ?></div>
<?php
}
?>
</div>





