<?php if ($records) { ?>
	<span  id="cmswidget-<?php echo $cmswidget; ?>">
		<div class="box">
			<div class="box-heading"><?php echo $heading_title; ?></div>
			<div class="box-content">
				<div class="fich">
					<div class="gallery_fich">
						<?php foreach ($records as $record) { ?>
						<div class="section">
							<a class="width_img" href="<?php echo $record['href']; ?>">
								<img src="<?php echo $record['thumb']; ?>" alt="<?php echo $record['name']; ?>" title="<?php echo $record['name']; ?>"/>
								<div class="hid hid_small"><div><?php echo $record['name']; ?></div></div>
							</a>
							<span class="comments-count small_g">
							<span class="com-text"><?php echo $text_comments; ?></span>
							<span class="bubble">
							<a href="<?php echo $record['href']; ?>#tab-comment"><?php echo $record['comments']; ?></a>
							</span>
							<span class="mbubble">
							</span>
							</span>
						</div>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
	</span>
	<div class="overflowhidden width100 lineheight1 bordernone">&nbsp;</div>
	<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>
	<script>
		$(document).ready(function(){
		    var prefix = '<?php echo $prefix;?>';
		    var cmswidget = '<?php echo $cmswidget; ?>';
			var data = $('#cmswidget-<?php echo $cmswidget; ?>').html();
			<?php echo $settings_widget['anchor']; ?>;
			delete data;
			delete prefix;
			delete cmswidget;
			$('#cmswidget-<?php echo $cmswidget; ?>').remove();
		});
	</script>
	<?php  } ?>
<?php  } ?>