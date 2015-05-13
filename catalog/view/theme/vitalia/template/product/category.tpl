<?php echo $header; ?>
<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_top.tpl'); ?>
<!-- START TOP BLOCK-->
<?php if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/autoprom/') {?>
  <p class="category-header">Автопром</p>

  <p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Современная 3D печать, позволяет создавать высокоточные прототипы и позволяющие выдерживать серьезные нагрузки.&nbsp;</span></span><span style="font-family: arial, helvetica, sans-serif; font-size: 14px; line-height: 1.6;">При самостоятельном создании концептуальных моделей, прототипов, инструментов, а также мелкосерийных конечных деталей большинство инженеров, дизайнеров начинают переходить к серийному производству.</span></p>

  <p style="text-align: justify;"><br />
  <span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">На данном этапе развития, 3D принтеры могут изготавливать прототипы с производительностью, недосягаемой для классических методов производства. Если необходимо снижение расхода топлива, оптимизация соотношения деталей или их веса и габаритов, сокращение расходов на оснастку, 3D-технологии помогут вам улучшить свои показатели в автомобилестроении.</span></span></p>

  <p style="text-align: center;">&nbsp;</p>

  <p style="text-align: center;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Использование современных аддитивных технологий в машиностроении позволяет:</span></span></strong></p>

  <p style="text-align: center;">&nbsp;</p>

  <ul>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">производить сложнопрофильные и экслюзивные детали, не применяя для этого дорогостояще станки и их оснастку</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">повышать рентабельность мелкосерийного производства</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">устранять действие &laquo;человеческого&raquo; фактора при производстве деталей: процесс разработки осуществляется в авто- и полуавтоматическом режиме</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">снижать вес деталей</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">создавать комплексные, интегрированные детали за 1 технологический цикл</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">управлять свойствами получаемого изделия</span></span></li>
  </ul>

  <p style="text-align: justify;"><span style="font-family: arial, helvetica, sans-serif; font-size: 14px; text-align: justify; line-height: 1.6;">Изготовление прототипов происходит в течение нескольких часов, давая при этом возможность быстрого принятия решения о доработке или старте изделия в серию. При этом малое количество времени, затраченное на конструкторские работы, позволяет существенно сократить стоимость производства. В текущих рыночных условиях, быстрая поставка на рынок обеспечит высокий спрос со стороны покупателей.</span></p>

  <p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Применяя функциональное прототипирование при производстве, Вы можете с большей вероятностью обнаруживать ошибки на этапе разработки и конструирования. Исправление и доводка именно на данном этапе, будет стоить во много раз дешевле аналогичного процесса, замеченного позже.</span></span></p>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 

<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>


  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для Автопрома</p>

  <!-- Printers -->


<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/architecture/') {?>
  <p class="category-header">Архитектура</p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Одной из самых популярных сфер применения 3D-печати является архитектура. Применение 3D-принтеров в архитектуре доступно не только крупным компаниям, но и небольшим архитектурным студиям.</span></span></p>

<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Для изготовления архитектурных макетов задействуется внушительное количество деталей, в связи с тем, что макеты представляют собой точную уменьшенную копию, часть деталей, как правило, сливается, теряясь при подробном рассмотрении.</span></span></p>

<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">При помощи 3D печати можно воспроизвести мельчайшие детали с высокой точностью и проанализировать точную архитектурную модель.</span></span></p>

<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">В зависимости от необходимой точности и качества материалов подбирается материал необходимый для создания макета. Если вам необходима высокая детализация, минимальная толщина стенок,&nbsp; долговечность, но изделие будет монохромным &ndash; ваш выбор фотополимер или полноцветный функциональный пластик, так же возможна полноценная печать бумагой или полноцветным гипсом (позволяет сделать более толстыми стенки модели и имеет шероховатую поверхность).</span></span></p>

<p style="text-align: center;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Основные преимущества 3D-печати в области архитектуры:</span></span></strong></p>

<ul>
	<li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">отсутствие ограничений: 3D принтер позволяет воссоздавать различные формы зданий</span></span></li>
	<li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">небольшая стоимость производства</span></span></li>
	<li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">высокая скорость создания макета</span></span></li>
	<li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">глубокая насыщенность цвета: некоторые макеты включают в себя до 400 тыc. оттенков</span></span></li>
	<li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">отличная точность создания до 16 микрон</span></span></li>
</ul>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!-- Слайдер -->
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section> -->
<!-- Конец слайдера -->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для архитектурной промышленности</p>

<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/aerospace/') {?>
<p class="category-header">Аэрокосмическая отрасль</p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Применение высоких технологий 3D-печати является одной из отличительных черт аэрокосмической отрасли.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Использование 3D принтеров в аэрокосмической отрасли позволяет разрабатывать геометрически сложные уникальные объекты&nbsp;в течение нескольких часов, что значительно быстрее по сравнению с традиционным процессом создания прототипов.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Внесение изменений в проект происходит достаточно быстро, для этого достаточно внести изменения в 3D-модель распечатать ее и протестировать.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Инженеры, участвующие в разработке прототипов в авиакосмической отрасли активно используют FDM, SLS, SLA, DMLS технологии при производстве прототипов, деталей и других составных частей.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Дизайнеры, участвующие в данной отрасли также применяют эти технологии при моделировании и создании прототипов.&nbsp;</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">При использовании 3D технологий, уже не нужна&nbsp;столь дорогая оснастка для проектирования, что в свою очередь, позволяет дизайнерам разрабатывать прототипы с более легкой конструкцией, высокой эффективностью и более&nbsp;экологически чистыми&nbsp;продуктами.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">При использовании 3D технологий Вы сможете быть уверены в высоком качестве, отличной скорости производства и максимально эффективном использовании ваших ресурсов в аэрокосмической области.</span></span></p>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для аэрокосмической отрасли</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/design/') {?>
<p class="category-header">Дизайн</p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Использование 3D-печати дает большие возможности в сфере дизайна. С помощью 3D-принтеров&nbsp; в области Дизайна вы сможете в кратчайшие сроки приготовить&nbsp; любой дизайн-макет.</span></span></p>

<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Дизайнеры и инженеры, теперь могут не покупать дорогостоящую и трудоемкую технику, а использовать 3D оборудование (3D-принтеры и 3D-сканеры), позволяющее обрабатывать и изменять макеты и прототипы очень быстро. Современные 3D-принтеры помогут вам создать концептуальные модели, осуществлять прототипирование и концепт дизайн и многое другое, используя для этого 3D-модель.</span></span></p>

<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Применение 3D технологий позволит Вам производить прототипы различных цветов, включать в них различные элементы дизайна. Основное преимущество 3D-прототипов&nbsp; в том, что заказчик может посмотреть, подержать модель, произвести оценку текстуры, формы, цветопередачи, эргономику и многое другое.</span></span></p>

<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">3D технологии в дизайне позволят Вам: увеличить скорость производства прототипов, отлично детализировать прототипы на стадии проектирования, позволяя выявлять и устранять недостатки, производить высококачественные и дешевые образцы за короткое время прямо на рабочем столе.</span></span></p>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для дизайна</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/breadboarding/') {?>
<p class="category-header">Макетирование</p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Создание макета по классическим технологиям это длительный, затратный по времени и материальным ресурсам процесс.</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Использование 3D-принтеров в макетировании позволяют сократить сроки и увеличить качество детализации объектов, что положительно будет воспринято заказчиками.</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">С помощью 3D печати Вы можете печатать макеты зданий, различные памятники архитектуры, а также макеты оборудования, для последующей демонстрации вашим заказчикам. В зависимости от желаемого результата Вы можете выбрать из таких материалов, как фотополимер, гипс, бумага,&nbsp;ABS или PLA пластик.</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Если вы печатаете макеты сооружений с использованием фотополимеров, ваш макет будет отлично детализирован, иметь минимальную толщину слоя, не портиться со временем , не терять форму.</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Процесс печати гипсом и бумагой обойдется в несколько раз дешевле, в сравнении с макетом из фотополимера, будет иметь до 400 тыс. всевозможных оттенков, однако такой макет имеет существенные ограничения в толщине слоя и будет иметь шероховатую поверхность.</span></span></p>
<p style="text-align: justify;">&nbsp;</p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Если нужно что- то среднее между применением гипса, бумаги и фотополимера, можете воспользоваться таким материалом, как&nbsp;ABS и PLA пластики. Данный материал имеет более низкую цветопередачу нежели гипс и более высокую прочность.</span></span></p>
<p style="text-align: justify;">&nbsp;</p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Основные достоинства 3D печати:</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">- быстрое изготовление макета (всего за несколько часов вы сможете напечатать свой макет)</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">- низкая стоимость изготовления конечного продукта;</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">- цветная печать: если вы используете гипс или&nbsp;ABS-пластик, можете выбрать различные цвета для вашего макета;</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">- высокая детализация печати и отсутствие погрешностей;</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">- компактность и простота 3D печати: для создания макета вам потребуется лишь небольшое пространство, где будет установлен 3D-принтер;</span></span></p>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для макетирования</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/medicine/') {?>
<p class="category-header">Медицина</p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">В настоящее время применение 3D-принтеров активно используется в медицине для производства различных стоматологических моделей,&nbsp; создания анатомических макетов, слуховых протезов, функциональном и косметическом протезировании.</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="line-height: 1.6;">Широкое применение 3D печать получила в стоматологии</span><span style="line-height: 1.6;">&nbsp;в частности при производстве хирургических шаблонов. Высокоточные хирургические шаблоны позволяют точно позиционировать полученные&nbsp;имплантанты. Значительно сокращается время операции: врач не тратит время, определяя точную позицию для&nbsp;имплантата. Имплантация происходит без разрезов и швов, для точного введения&nbsp;имплантата&nbsp;&nbsp;хирургу требуется лишь осуществить прокол в нужном месте. Отсутствие разрезов в свою очередь ускоряет послеоперационную реабилитацию, предотвращает боль, отеки и воспаления.</span></span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="line-height: 1.6;">В области протезирования 3D печать также занимает лидирующее место.&nbsp; Производство протеза по сравнению с обычными методами изготовления стало занимать намного меньше времени.&nbsp; Среднее время производства составляет 3 дня. Первые сутки уходят на анализ и разработку 3D модели, около 2 дней уходит на производство протеза. Изготовленные таким образом протезы получаются высокого качества и по сравнительно небольшой цене, что вызывает все большее внимание специалистов занимающихся изготовлением протезов.</span></span></span></p>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для медицины</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/military/') {?>
<p class="category-header">Оборонная промышленность</p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Применение 3D-принтеров в оборонной промышленности на сегодняшний день очень востребовано.</span></span></p>

<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">В ситуации, когда требуется создать уникальное оборудование в короткие сроки, 3D печать позволит представителям государственного сектора, военно-промышленного комплекса, оборонной промышленности вести разработку и производство единичных деталей, мелкосерийных инструментов, а также сложных прототипов.</span></span></p>

<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">При необходимости 3D печать позволяет обеспечить высочайшую детализацию, гладкую поверхность, а также огромный выбор материалов. У инженеров появляется возможность точно подбирать свойства, получаемого изделия. Кроме того, применение современных 3D-принтеров позволит достичь высоких прочностных характеристик, выдерживать воздействие химических веществ, больших перепадов температур и других внешние воздействий.</span></span></p>

<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">В&nbsp; процессе разработки 3D печать позволяет делать доработки 3D модели вашего изделия на начальных этапах прототипирования, что существенно снижает затраты на производство.</span></span></p>

<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Для процесса 3D печати возможно использование практически любых материалов, металла, пластика, а также высококачественных композитов, полимеров и многих других материалов.</span></span></p>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для оборонной промышленности</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/education/') {?>
<p class="category-header">Образование</p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Применение 3D печати и 3D принтеров в образовании позволяет прямо в процессе обучения применять инновационные технологии, с которыми студенты будут работать в будущем.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Будущие врачи, дизайнеры, инженеры в процессе образования достойны всех современных методов построения процесса обучения. 3D печать открывает двери к неограниченным возможностям для визуализации своих идей.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Учащиеся школ, техникумов и ВУЗов смогут увидеть как собственные проекты можно воплотить в жизнь прямо на рабочем столе, просто создав 3D модель.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Учителя и преподаватели, в свою очередь могут печатать модели таких для таких предметов как биология, химия, физика, инженерное и художественное 3d-моделирование и др. для проведения своих занятий.</span></span></p>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для образования</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/manufacturing/') {?>
<p class="category-header">Производство</p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Применение 3D принтеров в производстве на сегодняшний день развито как в мелком, среднем, так и самом крупном бизнесе.</span></span></p>
<p style="text-align: center;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><strong>Литьевое производство</strong></span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Процесс 3D печати открывает возможность изготовления мастер-моделей для литейных форм для серийного производства, на основании модели, разработанной в CAD. Использование 3D технологий значительно сокращает время, требуемое на производство литьевой формы.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Изготовление мастер-модели с применением фотополимеров или попоенных пластиков является самым эффективным применением технологии - сам процесс&nbsp; занимается считанные часы. Использование 3D-печати также гарантирует получение изделия, соответствующего оригинальной модели на 100%.</span></span></p>
<p style="text-align: center;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><strong>Прототипирование</strong></span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Для конструкторов, занимающихся прототипированием, 3D-технологии помогают открыть невероятные возможности производства прототипов, требующих больших денежных и временных затрат классическими способами производства.</span></span></p>
<p style="text-align: center;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><strong>Функциональное тестирование</strong></span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Использование 3D-принтеров для функционального и эргономического тестирования &ndash; разумное применение современных технологий, поскольку изготовление отдельных элементов в единичном экземпляре может оказаться достаточно дорогим.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Процесс создания 3D-модели позволит Вам произвести оценку ее характеристик, обнаружить и исправить все возможные дефекты, возникшие на этапе тестирования и проверить на нагрузки. Для этого достаточно произвести обработку 3D-модели в САПР и модель можно печатать на 3D-принтере.</span></span></p>
<p style="text-align: center;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Использование 3D-технологий в производстве позволит:</span></span></strong></p>
<ul>
	<li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">быстро изготавливать прототипы деталей, на основании чертежей и CAD</span></span></li>
	<li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">осуществлять 3D-печать литейных форм любой сложности</span></span></li>
	<li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Увеличить производительность и сократить материальные затраты на производство прототипов</span></span></li>
</ul>
  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для производства</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/advertising/') {?>
<p class="category-header">Реклама</p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="line-height: 1.6;">Применение 3D-принтеров в рекламе находит свое применение на начальном этапе согласования концепта бренда или товара и его последующем маркетинговом продвижении.</span></span></span></p>

<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">В процессе разработки и дальнейшего тестирования модель может претерпеть изменения, что ведет к дополнительным расходам. 3D печать позволяет быстро и эффективно вносить изменения в текущий макет проекта. Материалы, используемые для изготовления прототипа это гипс, различные фотополимеры, ABS и PLA пластики. Выбор материала, зависит от вашей конечной цели и мы рады проконсультировать Вас!</span></span></p>

<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">С использованием 3D-печати вы можете не только придавать нужную форму для вашей модели, но и осуществлять детализацию его выгодных сторон. Использование цветной печати, высокое качество поверхности и тонкие стенки позволят вам получить желаемый результат.</span></span></p>

<p style="text-align: center;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><strong>Достоинства 3D-</strong><strong>печати:</strong></span></span></p>

<ul>
	<li style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">получение макета любой сложности в кратчайшие сроки</span></span></li>
	<li style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">отличная детализация прототипов, позволяющая на стадии проектирования выявлять и исправлять все недостатки</span></span></li>
	<li style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">поддержка полноцветной печати позволит вам преподнести вашу идею с лучшей стороны</span></span></li>
	<li style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">высокое качество и низкая стоимость получаемых объектов</span></span></li>
</ul>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для рекламы</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/stomatology/') {?>
<p class="category-header">Стоматология</p>
<div>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><span style="line-height: 1.6;">3D-принтеры находят все большее применение в стоматологической промышленности. Процесс 3D-печати позволяет экономить значительные средства, а также значительно повышать качество операций.</span></span></span></p>
</div>
<p style="text-align: center;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><strong>Протезирование</strong></span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Процесс 3D-печати занимает значительное место в протезировании. Производство зубных протезов позволяет существенно сократить трудоемкость и стоимость материалов, а использование передовых 3D-технологий организовать производственный процесс изготовления протезов на более высоком уровне, тем самым повысив вес стоматологической лаборатории на рынке.</span></span></p>
<p style="text-align: center;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><strong>Хирургические </strong><strong>шаблоны</strong></span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Современные 3D принтеры дают возможность получения 3D-моделей зубов, челюстей, на основании данных, полученных в результате сканирования слепка или ротовой полости для изготовления хирургических шаблонов, активно применяющихся в стоматологии при протезировании и челюстно-лицевых операциях.</span></span></p>
<p style="text-align: center;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;"><strong>Элайнеры</strong></span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Помимо изготовления протезов, коронок, мостов с помощью 3D печати есть возможность изготовления элайнеров для выравнивания зубов и прикуса. Для этого производится сканирование зубов, а на основании него происходит 3D-моделирование и последующая печать элайнеров. 3D-печать позволяет более точно, быстро и качественно осуществить производство нужного компонента и начать лечение пациента. Современные материалы позволят Вам производить как оттиски челюствей, так и сами элайнеры высочайшего качества и срока службы.</span></span></p>
<p style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">Использование передовых 3D-технологий помогут вывести ваш стоматологический бизнес на новый уровень, обратитесь за подробной консультацией в Top 3D Shop!</span></span></p>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для стоматологии</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/souvenirs/') {?>
<p class="category-header">Сувенирная промышленность</p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Применение 3D-принтеров для производства игрушек и сувенирной продукции стало достаточно повседневным.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">С помощью современных 3D-технологий вы с легкостью получите цветной прототип до запуска изделия в серийное производство.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Последующий анализ полученного прототипа позволит скорректировать при необходимости текстуру, размеры, цвета и форму данного изделия. Современные материалы позволят обеспечить высокую детализацию, сохраняя при этом жесткость, гибкость и долговечность модели.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Производство сувенирной продукции обычно происходит из гипса, обработанного для улучшения прочности конечного изделия. Печать сувениров осуществляется с использованием большой гаммы цветов (до 390&nbsp;000 оттенков) или полноцветного функционального пластика.</span></span></p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">В полиграфической компании, вы также можете использовать 3D-печать, например, для печати чехла для телефона или других полезных в быту вещей.</span></span></p>
<p style="text-align: center;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;"><strong><span style="line-height: 1.6;">Преимущества применения 3D-печати:</span></strong></span></span></p>
<ul>
	<li style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">создание прототипов и готовых изделий происходит за несколько часов</span></span></li>
	<li style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">сокращается стоимость итогового продукта</span></span></li>
	<li style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">использование полноцветной модели изделий из гипса или прочного пластика</span></span></li>
	<li style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">превосходная точность готовой продукции</span></span></li>
	<li style="text-align: justify;"><span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:14px;">простота и удобство использования 3D-принтеров</span></span></li>
</ul>
  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для сувенирной промышленности</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/packs/') {?>
<p class="category-header">Упаковка</p>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">3D печать в упаковке и других высокотехнологичных потребительских товарах стала достаточно распространенным инструментом. Для усовершенствования этапов проектирования, а также процессов производства и тестирования, широко применяется технология прототипирования и аддитивное производство, облегчающее создание конечного продукта и облегчающая коммуникацию и сотрудничество между отделами компании и заказчиком.</span></span></p>

<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">3D-принтеры также помогут вам в печати тестовых макетов упаковок, изготовлении бутылок, флаконов различной формы и размеров. 3D-печать может осуществляться на цветном 3D-принтере с применением всевозможных современных материалов. Готовые прототипы упаковки вы можете продемонстрировать заказчику до запуска в серийное производство.&nbsp; В таком случае, заказчик сможет внимательно осмотреть упаковку , оценить ее дизайн, цвета, фактуру и другие свойства полученного прототипа.</span></span></p>

<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Современные 3D принтеры позволяют обеспечить высокую точность, качество и низкую стоимость изготовления конечного продукта. При высокой конкуренции на рынке, где товары широкого потребления пользуются большим спросом, 3D печать позволит сделать качественный рывок, сократив время выхода продукта, снизив затраты на производство и, в итоге, принеся успех вашей компании.</span></span></p>

<p style="text-align: center;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Преимущества использования 3D-принтеров:</span></span></strong></p>

<ul>
	<li><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">быстрое изготовление прототипов любой сложности</span></span></li>
	<li><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">превосходная&nbsp; детализация</span></span></li>
	<li><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">возможность выявления недостатков на стадии тестирования</span></span></li>
	<li><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">низкая цена и отличное качество получаемой продукции</span></span></li>
</ul>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для производства упаковки и потребительских товаров</p>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/jewelery/') {?>
<p class="category-header">Ювелирная промышленность</p>
<div>
<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Применение 3D-принтеров в ювелирном деле стало следствием результата их возможностей: в высокой точности, превосходной поверхности, не требующая постобработки и корректировки и сложности ювелирных объектов .</span></span></p>

<p style="text-align: justify;"><span style="font-family: arial, helvetica, sans-serif; font-size: 14px; line-height: 1.6;">Кроме того скорость печати таких 3D-принтеров позволяет значительно ускорить рабочий процесс производства конечной продукции. 3D-печать позволит вам создавать мастер-модели превосходного качества из выжигаемого полимера и выплавляемого воска.</span></p>

<p style="text-align: justify;"><span style="font-family: arial, helvetica, sans-serif; font-size: 14px; line-height: 1.6;">Ювелирный 3D-принтер открывает безграничные возможности производства изделий по сравнению с ЧПУ станком. Ювелирное дело было всегда ориентировано на создание уникальных предметов, поэтому быстрое прототипирование великолепно подходит для данного процесса.</span></p>

<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">3D-печать изделий под заказ теперь возможно даже не большим ювелирным мастерским. Кроме того стоимость изготовления готовой продукции существенно сократилась, а скорость заметно выросла.</span></span></p>

<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Применение 3D-принтеров высокого разрешения это недорогое, надежное и удобное в эксплуатации средство для производства высококачественных шаблонов и ювелирных изделий, которое оставит больше времени для развития вашего бизнеса.</span></span></p>

<p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Мы знаем как важна точность и выживаемость примера или воска для ювелиров, и&nbsp; готовы распечатать тестовую модель, чтобы вы убедились в качестве этих материалов!</span></span></p>
</div>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 
<!--
<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>
-->

  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для ювелирной промышленности</p>
<?php } else {?>
  <? if(isset($manufacturers)): ?>

	<div class="manufacturers-list clearfix">
		<h3>Популярные производители</h3>
		<ul style="text-align:center;">
			<?
			foreach($manufacturers as $manufacturer){
				?>
				<li>
					<a href="<?php echo $manufacturer['link']; ?>"><?= $manufacturer['title'] ?></a>
				</li>
				<?
			}
			?>
		</ul>
	</div>
	<? endif; ?>
<?php } ?>

<!-- END TOP BLOCK-->


  <?php if ($thumb || $description) { ?>
  <div class="category-info clearfix">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($categories && $this->theme_options->get('refine_search_style') != '2') { ?>
  <? /*
  <h2 class="refine_search"><?php echo $text_refine; ?></h2> */ ?>
  <div class="refine_search"><?php echo $text_refine; ?></div>
  <div class="category-list<?php if ($this->theme_options->get('refine_search_style') == '1') { echo ' category-list-text-only'; } ?>">
  	<div class="row">
  	  <?php 
  	  $class = 3; 
  	  $row = 4; 
  	  
  	  if($this->theme_options->get( 'refine_search_number' ) == 2) { $class = 62; }
  	  if($this->theme_options->get( 'refine_search_number' ) == 5) { $class = 25; }
  	  if($this->theme_options->get( 'refine_search_number' ) == 3) { $class = 4; }
  	  if($this->theme_options->get( 'refine_search_number' ) == 6) { $class = 2; }
  	  
  	  if($this->theme_options->get( 'refine_search_number' ) > 1) { $row = $this->theme_options->get( 'refine_search_number' ); } 
  	  ?>
	  <?php $row_fluid = 0; foreach ($this->theme_options->refineSearch() as $category) { $row_fluid++; ?>
	  	<?php 
	  	if ($this->theme_options->get('refine_search_style') != '1') {
	  		$width = 250;
	  		$height = 250;
	  		if($this->theme_options->get( 'refine_image_width' ) > 20) { $width = $this->theme_options->get( 'refine_image_width' ); }
	  		if($this->theme_options->get( 'refine_image_height' ) > 20) { $height = $this->theme_options->get( 'refine_image_height' ); }
		  	if($category['thumb'] != '') { 
		  		$image = $this->model_tool_image->resize($category['thumb'], $width, $height); 
		  	} else { 
		  		$image = $this->model_tool_image->resize('no_image.jpg', $width, $height); 
		  	} 
	  	}
	  	?>
	  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
	  	<div class="col-sm-<?php echo $class; ?> col-xs-6">
	  		<?php if ($this->theme_options->get('refine_search_style') != '1') { ?>
		  	<a href="<?php echo $category['href']; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $category['name']; ?>" /></a>
		  	<?php } ?>
		  	<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
	  	</div>
	  <?php } ?>
	</div>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <!-- Filter -->
  <div class="product-filter clearfix">
  	<div class="options">
  		 <!--<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>-->
  		
  		<div class="button-group display" data-toggle="buttons-radio">
  			<button id="grid" <?php if($this->theme_options->get('default_list_grid') == '1') { echo 'class="active"'; } ?> rel="tooltip" title="Grid" onclick="display('grid');"><i class="icon-th-large"></i></button>
  			<button id="list" <?php if($this->theme_options->get('default_list_grid') != '1') { echo 'class="active"'; } ?> rel="tooltip" title="List" onclick="display('list');"><i class="icon-th-list"></i></button>
  		</div>
  	</div>
  	
  	<div class="list-options">
  		<div class="sort">
  			<?php echo $text_sort; ?>
  			<select onchange="location = this.value;">
  			  <?php foreach ($sorts as $sorts) { ?>
  			  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
  			  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
  			  <?php } else { ?>
  			  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
  			  <?php } ?>
  			  <?php } ?>
  			</select>
  		</div>
  		
  		<div class="limit">
  			<?php echo $text_limit; ?>
  			<select onchange="location = this.value;">
  			  <?php foreach ($limits as $limit_val) {  ?>
    			  <?php if ($limit_val['value'] == $limit) {  ?>
    			    <option value="<?php echo $limit_val['href']; ?>" selected="selected"><?php echo $limit_val['text']; ?></option>
    			  <?php } else { ?>
    			    <option value="<?php echo $limit_val['href']; ?>"><?php echo $limit_val['text']; ?></option>
    			  <?php } ?>
  			  <?php } ?>
  			</select>
  		</div>
  	</div>
  </div>
  <script type="text/javascript">
  jQuery(function(){
    setTimeout(function() {
      if (window.location.pathname == '/materiali/casting-silicon/') {
        jQuery(".product-grid .product").each(function( product ) {
          var price = jQuery(this).find( ".price" ).text();
          if (price.replace(/[^0-9]/g,"").length > 0) {
            jQuery(this).find( ".price" ).html("от "+price);
          }
        });
        jQuery(".product-list > div").each(function( product ) {
          var price = jQuery(this).find( ".price" ).text();
          if (price.replace(/[^0-9]/g,"").length > 0) {
            jQuery(this).find( ".price" ).html("от "+price);
          }
        });
      }
    }, 3000);
  })
  </script>
  <!-- Products list -->
  <div class="product-list"<?php if($this->theme_options->get('default_list_grid') == '1') { echo ' style="display:none;"'; } ?>>
  	<?php foreach ($products as $product) { ?>
  	<!-- Product -->
  	<div>
  		<div class="row">
  			<div class="image col-sm-3">
  				<?php if($product['special'] && $this->theme_options->get( 'display_text_sale' ) != '0') { ?>
  					<?php $text_sale = 'Sale';
  					if($this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) ) != '') {
  						$text_sale = $this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) );
  					} ?>
  					<?php if($this->theme_options->get( 'type_sale' ) == '1') { ?>
  					<?php $product_detail = $this->theme_options->getDataProduct( $product['product_id'] );
  					$roznica_ceny = $product_detail['price']-$product_detail['special'];
  					$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
  					<div class="sale">-<?php echo round($procent); ?>%</div>
  					<?php } else { ?>
  					<div class="sale"><?php echo $text_sale; ?></div>
  					<?php } ?>
  				<?php } ?>
  				<?php if($product['thumb']) { ?>
  				<a href="<?php echo $product['href']; ?>"><img id="image_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
  				<?php } else { ?>
  				<a href="<?php echo $product['href']; ?>"><img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" /></a>
  				<?php } ?>
  			</div>
  			
  			<div class="name-desc col-sm-6">
  				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
  				<div class="description"><?php echo $product['description']; ?></div>
  				<?php if ($product['rating']) { ?>
  				<div class="rating-reviews clearfix">
  					<div class="rating"><i class="icon-star<?php if($product['rating'] >= 1) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 2) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 3) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 4) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 5) { echo ' active'; } ?>"></i></div>
  				</div>
  				<?php } ?>
  			</div>
  			<div class="actions col-sm-3">
  				<div style='text-align: center;'>
				<?php if ($product['price']>0) { ?>
  					<div class="price">
  						<?php if (!$product['special']) { ?>
  						  <?php echo $product['price']; ?>
  						<?php } else { ?>
  						<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
  						<?php } ?>
  					</div>
					
					<div class="add-to-cart">
					<a onclick="addToCart('<?php echo $product['product_id']; ?>', 1, 'image_<?php echo $product['product_id']; ?>');" class="button" id="ay" style="margin-bottom: 5px"><?php echo $button_cart; ?></a>
					</div>
					<a class="button" id="ay" onclick="instockrequest('<?php echo $product['product_id']; ?>');" style="margin-left:2px;margin-top: 5px;">Запросить КП</a>

			<?php /* ADD OCDESIGN.RU VKREDIT PAYMENT */ ?>
				<div class="add-to-vkredit" style="text-align: center">
				<?php if ($product['link_id'] == 0) { ?>
						<input type="button" class="button-vkredit" onclick="addToVkredit('<?php echo $product['product_id']; ?>', 1, 'image_<?php echo $product['product_id']; ?>');" value="Купить в кредит" />
					<?php } else { ?>
						<input type="button" class="button-vkredit" onclick="window.location.href = '<?php echo $product['link']; ?>';" value="Купить в лизинг" />
					<?php } ?>
					</div>
			<?php /* END OCDESIGN.RU VKREDIT PAYMENT */ ?>

					<ul>
  						<li>+ <a onclick="addToCompare('<?php echo $product['product_id']; ?>');">Сравнить</a></li>
  						<!--li>+ <a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php if($this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ) != '') { echo $this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?></a></li-->
					</ul>
										
					<?php } else { ?>
					    <a class="button" id="ay" onclick="instockrequest('<?php echo $product['product_id']; ?>');" style="margin-left: 0px;margin-top: 5px;">Запросить КП</a>
			<?php /* ADD OCDESIGN.RU VKREDIT PAYMENT */ ?>
					<div class="add-to-vkredit" style="padding-left: 0px; text-align: center;">
					<?php if (!$product['link_id'] == 0) { ?>
							<input type="button" class="button-vkredit" onclick="window.location.href = '<?php echo $product['link']; ?>';" value="Купить в лизинг" />
					<?php } ?>
					</div>
			<?php /* END OCDESIGN.RU VKREDIT PAYMENT */ ?>

					<ul>
  						<li>+ <a onclick="addToCompare('<?php echo $product['product_id']; ?>');">Сравнить</a></li>
  						<!--li>+ <a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php if($this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ) != '') { echo $this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?></a></li-->
					</ul>
					<?php } ?>
  				</div>
  			</div>
  		</div>
  	</div>
  	<?php } ?>
	
  </div>
  
  <!-- Products grid -->
  <?php 
  $class = 3; 
  $row = 4; 
  
  if($this->theme_options->get( 'product_per_pow2' ) == 6) { $class = 2; }
  if($this->theme_options->get( 'product_per_pow2' ) == 5) { $class = 25; }
  if($this->theme_options->get( 'product_per_pow2' ) == 3) { $class = 4; }
  
  if($this->theme_options->get( 'product_per_pow2' ) > 1) { $row = $this->theme_options->get( 'product_per_pow2' ); } 
  ?>
  <div class="product-grid"<?php if(!($this->theme_options->get('default_list_grid') == '1')) { echo ' style="display:none;"'; } ?>>
  	<div class="row">
	  	<?php $row_fluid = 0; foreach ($products as $product) { $row_fluid++; ?>
		  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
		  	<div class="col-sm-<?php echo $class; ?> col-xs-6">
		  	    <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product.tpl'); ?>
		  	</div>
	    <?php } ?>
    </div>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>

<?php if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/autoprom/') {?>

<!-- Video -->
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/CD7yB9gZDIk?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/CD7yB9gZDIk?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/CD7yB9gZDIk?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>

<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/architecture/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/cOaqRkLP4lI?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/jl2EVSFNY1A?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/87GDPxDvOo8?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/aerospace/') {?>
<ul class="category-video-bottom">
  <li>  
   <iframe width="800" height="450" src="https://www.youtube.com/embed/8mc8exECgN8?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
   <iframe width="800" height="600" src="https://www.youtube.com/embed/ALA2Gp59_IM?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/design/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/aGdWV1HWte8?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/7t4fgeVs1SI?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/breadboarding/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/87GDPxDvOo8?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/xao8rR8PkJE?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/dbjDuZSmxuw?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/medicine/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/tvgZJkSNz0w?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/qTrldo_tGT8?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/-i1OS6ZU_-k?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/military/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/uNBfLOypMxg?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/education/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/_KBxG1_WO8k?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/qeGB46muhlc?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/manufacturing/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/v3oS9vDQAtw?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/l0SXlkrmzyw?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/advertising/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/aGdWV1HWte8?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/stomatology/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/p2fTN9tVLLs?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/Os6R4BlvhGs?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/LRU0dk0KBJQ?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/souvenirs/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/e5__vYeT-3M?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/packs/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/CG8h3aAuZAA?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } else if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/jewelery/') {?>
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/WgW90_8zEK8?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/zkpyddsiZZ0?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
   <iframe width="800" height="600" src="https://www.youtube.com/embed/5voxz39QjcQ?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>
<?php } ?>
  <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/module/simple_form.tpl'); ?>



<script type="text/javascript"><!--
$('#button-vkredit').bind('click', function() {
	$('#vkredit_input')
	 addToCart();
});

function display(view) {

	if (view == 'list') {
		$('.product-grid').css("display", "none");
		$('.product-list').css("display", "block");

		$('.display').html('<button id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="icon-th-large"></i></button> <button class="active" id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="icon-th-list"></i></button>');
		
		$.cookie('display', 'list'); 
	} else {
	
		$('.product-grid').css("display", "block");
		$('.product-list').css("display", "none");
					
		$('.display').html('<button class="active" id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="icon-th-large"></i></button> <button id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="icon-th-list"></i></button>');
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
display(view);
} else {
display('list');
}
//--></script> 
<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_bottom.tpl'); ?>
<?php echo $footer; ?>