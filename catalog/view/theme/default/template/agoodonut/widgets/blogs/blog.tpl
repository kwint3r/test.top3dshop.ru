<div class="box">
  <div class="blog-heading"><b><?php echo $heading_title; ?></b></div>
	<div class="box-content">
	  <div class="box-ul">
<?php
if (count($myblogs)>0) {
	foreach ($myblogs as $blogs) {
		for ($i=0; $i<$blogs['flag_start']; $i++) {
?>
		<ul class="padding_<?php  echo $blogs['level'];?>" style="<?php if(!$blogs['display']) echo 'display:none;' ?>">
			<li><a href="<?php if($blogs['active']=='active') echo $blogs['href']."#";  else echo $blogs['href']; ?>" class="<?php if($blogs['active']=='active') echo 'active'; if($blogs['active']=='pass') echo 'pass'; ?>"><?php echo $blogs['name']; if ($blogs['count']>0) echo  " (".$blogs['count'].")"; ?></a>
<?php
			for ($m=0; $m<$blogs['flag_end']; $m++) {
?> 			</li>
		</ul>
<?php
			}
		}
	}
}
?>
		</div>
	</div>
</div>
<style>
.blog-heading {
	margin: 0px;
	padding-top: 10px;
	padding-buttom: 10px;
	font-size: 18px;
	line-height: 28px;
}
.box-ul ul li {
	margin-top: 8px;
}

.box-ul ul li a {
	color: #999;
	text-decoration: none;
}
.box-ul ul li a.active {
	color: #000;
	font-weight: bold;
}
</style>