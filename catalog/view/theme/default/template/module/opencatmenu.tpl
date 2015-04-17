<div class="box num-<?php echo $setting['num']; ?>" id="opencatmenu">
<style type="text/css">
#opencatmenu{
float: left;
}
#opencatmenu *{
text-decoration: none;
list-style: none;
}
<?php if ($setting['entry_title_background']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-heading{
background: #<?php echo $setting['entry_title_background']; ?>;
}
<?php } ?>
<?php if ($setting['entry_title_color']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-heading{
color: #<?php echo $setting['entry_title_color']; ?>;
}
<?php } ?>
<?php if ($setting['entry_title_size']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-heading{
font-size: <?php echo $setting['entry_title_size']; ?>px;
}
<?php } ?>
<?php if ($setting['entry_border_color']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-heading{
border: 1px solid #<?php echo $setting['entry_border_color']; ?>;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-content{
border: 1px solid #<?php echo $setting['entry_border_color']; ?>;
border-top: none;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li{
border-top: 1px solid #<?php echo $setting['entry_border_color']; ?>;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in > div > li{
border-bottom: 1px solid #<?php echo $setting['entry_border_color']; ?>;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in{
border: 1px solid #<?php echo $setting['entry_border_color']; ?>;
}
<?php } ?>
#opencatmenu .box-content{
padding: 0px;
margin: 0;
list-style: none;
float: left;
border-radius: 0px;
-webkit-border-radius: 0px;
-moz-border-radius: 0px;
-khtml-border-radius: 0px;
}
#opencatmenu .box-category,#opencatmenu .box-category > ul,#opencatmenu .box-category > ul > li{
padding: 0px;
margin: 0;
list-style: none;
float: left;
width: 329px;
position: relative;
}
#opencatmenu .box-category > ul > li{
border: 1px solid #EEEEEE;
}
<?php if ($setting['entry_background']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li{
background: #<?php echo $setting['entry_background']; ?>;
}
<?php } else {?>
#opencatmenu .box-category > ul > li {
background: url("image/opencatmenu/bg.png") 0% 100% repeat-x #FFFFFF;
}
<?php } ?>
<?php if ($setting['entry_size']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li > a,#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in > div > li > a{
font-size: <?php echo $setting['entry_size']; ?>px;
}
<?php } else {?>
#opencatmenu .box-category > ul > li > a{
font-size: 12px;
}
<?php } ?>
<?php if ($setting['entry_color']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li > a{
text-decoration: none;
color: #<?php echo $setting['entry_color']; ?>;
padding: 8px 2px 8px 8px;
float: left;
width: 168px;
position: relative;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in > div > li > a{
position: relative;
float: left;
margin: 0;
padding: 5px 0;
width: 100%;
color: #<?php echo $setting['entry_color']; ?>;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in > div > li > ul li a{
color: #<?php echo $setting['entry_color']; ?>;
}
<?php } else {?>
#opencatmenu .box-category > ul > li > a {
text-decoration: none;
color: #333;
padding: 8px 2px 8px 8px;
float: left;
width: 168px;
position: relative;
}
#opencatmenu .box-category-in > div > li > a{
position: relative;
float: left;
margin: 0;
padding: 5px 0;
width: 100%;
color: #333333;
}
#opencatmenu .box-category-in > div > li > ul li a{
color: #333333;
}
.dropdown{
height:75px;
}

<?php } ?>
<?php if ($setting['image_active'] == 1 ) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li > a{
min-height: <?php echo $setting['config_image_opencatmenu_height']; ?>px; 
height:65px;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li > a > span.description{
margin: 0 0 0 <?php echo $setting['config_image_opencatmenu_width']; ?>px;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li > a > span.name{
margin: 0 0 0 <?php echo $setting['config_image_opencatmenu_width']; ?>px;
margin: -13px 0 0 50px;
min-height: <?php echo $setting['config_image_opencatmenu_height']; ?>px; 
}
<?php } ?>  
#opencatmenu .box-category > ul > li > a img{
position: absolute;
left: 8px;
}
#opencatmenu .box-category-in > div > li > a img{
position: absolute;
left: 0;
top: 5px;
}
#opencatmenu .box-category > ul > li > a span{
float: left;
margin: 0;
padding: 2px 0 0 5px;
margin-top:50px;
text-align: center;
min-width: 130px;
line-height: 5;
font-size:16px;
font-weight:bold;
width:300px;
}
#opencatmenu li.dropdown:hover{
border-top: 1px solid #DEDEDE;
-webkit-box-shadow: 0px 0px 7px 2px #DDDDDD;
-moz-box-shadow: 0px 0px 7px 2px #DDDDDD;
box-shadow: 0px 2px 5px 2px #DDDDDD;
z-index: 10;
}
#opencatmenu .box-category > ul > li a.active {
font-weight: bold;
}
<?php if ($setting['entry_background_hover']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li > a:hover,#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li a.active,#opencatmenu.num-<?php echo $setting['num']; ?> li.dropdown:hover > a {
background: #<?php echo $setting['entry_background_hover']; ?>;
}
<?php } else {?>
#opencatmenu .box-category > ul > li > a:hover,#opencatmenu .box-category > ul > li a.active,#opencatmenu li.dropdown:hover > a {
background: #F3F3F3;
}
<?php } ?>
<?php if ($setting['popup_background_hover']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in{
display: none;
position: absolute;
top: -1px;
background: #<?php echo $setting['popup_background_hover']; ?>;
z-index: 10;
width: 211px;
margin: 0;
padding: 5px 10px;
}
<?php } else {?>
#opencatmenu .box-category-in{
display: none;
position: absolute;
top: -1px;
background: #F3F3F3;
z-index: 10;
border: 1px solid #DEDEDE;
width: 180px;
margin: 0;
padding: 5px 10px;
}
<?php } ?>
#opencatmenu .box-category-in{
border: 1px solid #DEDEDE;
}
#opencatmenu .box-category-in.column_1 > div{
width: 98%;
float: left;
}
#opencatmenu .box-category-in.column_2{
width: 360px;
}
#opencatmenu .box-category-in.column_2 > div{
width: 48%;
float: left;
}
#opencatmenu .box-category-in.column_3{
width: 540px;
}
#opencatmenu .box-category-in.column_3 > div{
width: 31%;
float: left;
}
#opencatmenu .box-category-in.column_4{
width: 720px;
}
#opencatmenu .box-category-in.column_4 > div{
width: 23%;
float: left;
}
#opencatmenu .box-category-in > div > li{
position: relative;
float: left;
margin: 0;
padding: 0;
width: 100%;
border-bottom: 1px solid #E5E5E5;
border-top:none;
}
#opencatmenu .box-category-in > div > li:last-child{
border:none;
}
#opencatmenu .box-category-in > div > li > a:hover{
font-weight: bold;
}
#opencatmenu .box-category-in > div > li > a.active,#opencatmenu a.active-link,#opencatmenu a:hover{
font-weight: bold;
}
#opencatmenu .box-category-in > div > li > a + span{
float: left;
padding: 0;
margin: 0;
}
<?php if ($setting['imagesub_active'] == 1 ) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in > div > li > a > span.name{
margin: 0 0 0 <?php echo $setting['config_subimage_opencatmenu_width']; ?>px;
min-height: <?php echo $setting['config_subimage_opencatmenu_height']; ?>px; 
padding: 0 0 0 5px;
float: left;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in > div > li > ul li a{
margin: 0 0 0 <?php echo $setting['config_subimage_opencatmenu_width']; ?>px;
}
<?php } ?>  
#opencatmenu .box-category-in.column_right{
right: 178px;
border-right: none;
-webkit-border-radius: 3px 0px 0px 3px;
-moz-border-radius: 3px 0px 0px 3px;
-khtml-border-radius: 3px 0px 0px 3px;
border-radius: 3px 0px 0px 3px;
}
#opencatmenu .box-category-in.column_left{
left:329px;
/*border-left: none;*/
-webkit-border-radius: 0px 3px 3px 0px;
-moz-border-radius: 0px 3px 3px 0px;
-khtml-border-radius: 0px 3px 3px 0px;
border-radius: 0px 3px 3px 0px;
}
#opencatmenu .description{
float: none;
font-size: 10px;
font-weight: normal;
color: #929292;
margin: 0 !important;
padding: 0 !important;
text-align: left;
}
<?php if ($setting['entry_desc_color']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .description{
color: #<?php echo $setting['entry_desc_color']; ?>;
}
<?php } else {?>
#opencatmenu .description{
font-size: 10px;
color: #929292;
}
<?php } ?>
<?php if ($setting['entry_desc_size']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .description{
font-size: <?php echo $setting['entry_desc_size']; ?>px;
}
<?php } else {?>
#opencatmenu .description{
font-size: 10px;
}
<?php } ?>
#opencatmenu .box-category-in > div > li > ul{
position: relative;
float: left;
margin: 0;
padding: 0;
width: 100%;
display: block;
}
#opencatmenu .box-category-in > div > li > ul li{
position: relative;
float: left;
margin: 0;
padding: 0 0 5px 0;
width: 100%;
width:329px;
}
#opencatmenu > div > li > ul li a{
font-size: 10px;
}
<?php if ($setting['entry_sister_size']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in > div > li > ul li a{
font-size: <?php echo $setting['entry_sister_size']; ?>px;
}
<?php } ?>
<?php if ($setting['link_color_hover']) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> span.name:hover{
color: #<?php echo $setting['link_color_hover']; ?>; 
}
<?php } ?>
<?php if ($setting['entry_popup_level'] == 1) { ?>
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in > div > li{
padding: 0 0 0 15px;
}
.ocm_subs-<?php echo $setting['num']; ?>{
width: 12px;
height: 12px;
background-image: url("image/opencatmenu/plus_minus.png");
background-position: 0 0;
cursor: pointer;
position: absolute;
left: 0;
top: 5px;
display: block !important;
}
.ocm_min-<?php echo $setting['num']; ?>{
width: 12px;
height: 12px;
background-image: url("image/opencatmenu/plus_minus.png");
background-position: 0 -12px;
cursor: pointer;
position: absolute;
left: 0;
top: 5px;
display: block !important;
}
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in > div > li .name{
margin: 0 15px 0 0;
}
<?php } ?>
</style>
  <?php if ($opencatmenu_title) { ?>
  <div class="box-heading"><?php echo $opencatmenu_title; ?></div>
  <?php } ?>  
  <div class="box-content">
    <div class="box-category <?php echo $setting['position']; ?>">
      <ul>
        <?php foreach ($categories as $category) { ?>
        <li class="dropdown">
          <?php if ($category['category_id'] == $category_id) { ?>		
          <a class="active-link" href="<?php echo $category['href']; ?>">
		  <?php } else { ?>
		  <a href="<?php echo $category['href']; ?>">
		  <?php } ?>
		    <?php if ($setting['image_active'] == 1 ) { ?>
		      <?php if ($category['thumb']) { ?>
		        <img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" />
		      <?php } ?>
		    <?php } ?>
          <span class="name"><?php echo $category['name']; ?></span>
		  <?php if ($setting['description_active'] == 1) { ?>
		    <?php if ($category['description']) { ?>
		      </br></br><span class="description"><?php echo $category['description']; ?>...</span>
		    <?php } ?>
		  <?php } ?>
		  </a>
            <?php if ($category['children']) { ?>
	          <ul class="box-category-in <?php echo $setting['position']; ?> column_<?php echo $category['column']; ?>">
                <?php for ($i = 0; $i < count($category['children']);) { ?>
                  <div>
                    <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                      <?php for (; $i < $j; $i++) { ?>
                         <?php if (isset($category['children'][$i])) { ?>
                           <li>
			            	<?php if ($setting['entry_sister_category'] == 1) { ?>
                              <?php if($category['children'][$i]['sister_id']) { ?>
								<i class="ocm_subs-<?php echo $setting['num']; ?>" style="display:none;"></i>
							  <?php } ?>
						    <?php } ?>
						    <a href="<?php echo $category['children'][$i]['href']; ?>">
			                  <?php if ($setting['imagesub_active'] == 1) { ?>
			                    <?php if ($category['children'][$i]['thumb']) { ?>
		                          <img src="<?php echo $category['children'][$i]['thumb']; ?>" alt="<?php echo $category['children'][$i]['name']; ?>" />
		                        <?php } ?>
				              <?php } ?>
		                      <span class="name"><?php echo $category['children'][$i]['name']; ?></span>
		                      <?php if ($setting['description_sub_active'] == 1) { ?>
		              	        <?php if ($category['children'][$i]['description']) { ?>
								  <div style="clear:both;"></div>
		                          <span class="description"><?php echo $category['children'][$i]['description']; ?>...</span>
		                        <?php } ?>
		                      <?php } ?>
		                    </a>
			            	<?php if ($setting['entry_sister_category'] == 1) { ?>
                              <?php if($category['children'][$i]['sister_id']) { ?>
								<ul class="ocm_popup" <?php if ($setting['entry_popup_level'] == 1) { ?>style="display: none;"<?php } ?>>
                                  <?php foreach($category['children'][$i]['sister_id'] as $sisters) { ?>
                                    <li><a href="<?php echo $sisters['href']; ?>">- <?php echo $sisters['name']; ?></a></li>
                                  <?php } ?>
                                </ul>
							  <?php } ?>
						    <?php } ?>
				           </li>
                         <?php } ?>
                      <?php } ?>
                  </div>
                <?php } ?>
	          </ul>
            <?php } ?>
			
        </li>

        <?php } ?>
<li class="dropdown">
          		  <a href="/uslugi.html">
		  		    		      		        <img alt="Услуги" src="/image/data/main/megamenu/3dprint.png" width="60" height="60">
		      		              <span class="name">Услуги</span>
		  		  </a>
         	          <ul class="box-category-in column_left column_1">
                                  <div>
<li>
<a href="/3d-pechat-ob-ektov.html">
			                  		                      <span class="name">3D печать</span>
		                      		                    </a>
			            					           </li>
                                                                                                   <li>
			            							    <a href="/3d-skanirovanie.html">
			                  		                      <span class="name">3D сканирование</span>
		                      		                    </a>
			            					           </li>
                                                                                                   <li>
			            							    <a href="http://my3dgift.ru">
			                  		                      <span class="name">Изготовление 3D фигурок</span>
		                      		                    </a>
			            					           </li>
                                                                                                   <li>
			            							    <a href="/contact-us/">
			                  		                      <span class="name">Техподдержка</span>
		                      		                    </a>
			            					           </li>
                                                                                                   <li>
			            							    <a href="/servisnoe-obsluzhivanie-i-remont.html">
			                  		                      <span class="name">Ремонт и сервис</span>
		                      		                    </a>
			            					           </li>
                                                                                                   <li>
			            							    <a href="/obuchenie.html">
			                  		                      <span class="name">Обучение</span>
		                      		                    </a>
			            					           </li>
													   </div>
													   	</ul>
														
</li>
													   
													   
<li class="dropdown">
          		  <a href="/franchise.html">
		  		    		      		        <img alt="Франшиза" src="/image/data/main/other/top3dshop_logo.png" width="60" height="60">
		      		              <span class="name">Франшиза</span>
		  		  </a>
         	          <ul class="box-category-in column_left column_1">
                                  <div>
<li>
<a href="/franchise-top3dshop.html">
			                  		                      <span class="name">Магазин 3D техники</span>
		                      		                    </a>
			            					           </li>
                                                                                                   <li>
			            							    <a href="/franchise-my3dgift.html">
			                  		                      <span class="name">Создание 3D фигурок</span>
		                      		                    </a>
			            					           </li>
			</div>
                	          </ul>
				  </li>
	
    </div>
  </div>
<?php if ($setting['delay_category'] == 1) { ?>
<script type="text/javascript"><!--
    $('#opencatmenu.num-<?php echo $setting['num']; ?> li.dropdown').on({
        mouseover: function() {
            $(this).find('.box-category-in').stop(1,1).delay(<?php echo $setting['size_delay_category']; ?>).slideDown(100);
        },
        mouseleave: function() {
            $(this).find('.box-category-in').stop(1,1).slideUp(100);
        }
    });
--></script>
<?php } else { ?>
<style type="text/css">
#opencatmenu.num-<?php echo $setting['num']; ?> .box-category > ul > li a:hover + .box-category-in,#opencatmenu.num-<?php echo $setting['num']; ?> .box-category-in:hover{
display: block;
}
</style>
<?php } ?>
<script type="text/javascript"><!--
    $(document).ready(function () {
        var url = document.location.toString();
        $("a").filter(function () {
            return url.indexOf(this.href) != -1;
        }).addClass("active-link");
    }); 
--></script>
<?php if ($setting['entry_popup_level'] == 1) { ?>
<script type="text/javascript"><!--
    $(".ocm_subs-<?php echo $setting['num']; ?>").live("click", function() {
	    $("+ a + ul", this).slideToggle(<?php echo $setting['entry_popup_level_speed']; ?>);
		$(this).addClass("ocm_min-<?php echo $setting['num']; ?>");
		$(this).removeClass("ocm_subs-<?php echo $setting['num']; ?>");
    });
    $(".ocm_min-<?php echo $setting['num']; ?>").live("click", function() {
	    $("+ a + ul", this).slideToggle(<?php echo $setting['entry_popup_level_speed']; ?>);
		$(this).addClass("ocm_subs-<?php echo $setting['num']; ?>");
		$(this).removeClass("ocm_min-<?php echo $setting['num']; ?>");
    });
--></script>
<?php } ?>
</div>
<div style="clear:both;"></div>