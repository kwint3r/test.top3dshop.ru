<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
	<div class="blog-content">
		<div class="breadcrumb">
		<span xmlns:v="http://rdf.data-vocabulary.org/#">
			<?php $i=0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
			<span typeof="v:Breadcrumb">
			<?php echo $breadcrumb['separator']; ?><?php if (count($breadcrumbs)!= $i) { ?><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title" title="<?php echo $breadcrumb['text']; ?>" alt="<?php echo $breadcrumb['text']; ?>"><?php } ?><?php echo $breadcrumb['text']; ?><?php if (count($breadcrumbs)!=$i) { ?></a><?php } ?>
			</span>
			<?php } ?>
		</span>
		</div>
	<?php echo $content_top; ?>
 </div>
</div>
<?php echo $footer; ?>