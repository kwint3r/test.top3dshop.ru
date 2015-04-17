<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($description) { ?>
  <div class="articles-info">
    <?php if ($image) { ?>
    <div class="image"><img src="<?php echo $image; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($articles) { ?>
    
      <?php foreach ($articles as $article) { ?>
      <?php if ($article['children']) { ?>
<div class="art_category">
<div>
         <?php if ($article['thumb_category']) { ?>
      <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb_category']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
      <?php } ?>
	<div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
</div></div>
<?php } ?><?php } ?>
<?php foreach ($articles as $article) { ?>
      <?php if (!$article['children'] && $article['description']) { ?>
<div class="articles-list">
<div>
      <?php if ($article['thumb']) { ?>
      <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
<div class="description"><?php echo $article['description']; ?></div>
</div></div>

<?php } ?>
      <?php } ?>

    
  
  <?php } ?>
  
  <div class="buttons">
   <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?>
  </div>

<?php echo $footer; ?>