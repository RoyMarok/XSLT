<script src="/static/particles/particles.min.js"></script>
<script>
 <xsl:text disable-output-escaping="yes">
      //<![CDATA[
    var mainpage = (function(){
    	var	$target, $pages, currentFilter, currentCount, $progressBar, $currentSection,
    		itemsOnPage = 10,
    		btnMetadata = new ButtonMetadata(buttons.getPageMetadata('PRIVOFFICE_MENU')),
    	 	sendRequest = function(params, callback) {
    			params.app = app; // Пробасываем глобальную переменную, хранящую раздел, в котором открыта родительская карточка. Для правильной работы ссылок в задачах
  				$.ajax({
  					type: 'GET',
  					url: 'getCardHtml.action',
  					data: params,
  					beforeSend: function() {
  						tabInfo.showLoading()
  					},
  					success: function(response) {
  						tabInfo.hideLoading();
  				  		$target.html(response);

                if(callback) callback();
  					},
  					error: function(xhr) {
  					  console.error('Ошибка загрузки карточки: ' + params.cardId);
  					}
  				});
			},
			renderPagination = function(currentPage) {
				var pagesCount = Math.ceil(currentCount / itemsOnPage),
					num = 0,
					currentPage = currentPage || 1,
					row,
					rows = $();

				$pages.empty();

				for (var i = pagesCount - 1; i >= 0; i--) {

					num++;

					row = (num === currentPage)
						? '<li  class="current-page" data-number="' + num + '">' + num + '</li>'
						: '<li data-number="' + num + '">' + num + '</li>';

					rows = rows.add(row);
				}

				if (rows.length > 1) {
					$pages
						.append('<ul></ul>')
						.find('ul')
						.append(rows)
						.find('li')
						.on('click', function(){
							var $this = $(this),
								pageNumber = $this.data('number');

							$this.addClass('current-page').siblings().removeClass('current-page');

							sendRequest({
                cardId: getCurrentCard(),
								filterBy: currentFilter,
								lowerBound: itemsOnPage * pageNumber - itemsOnPage + 1,
				        upperBound: itemsOnPage * pageNumber
							});

						});
				}
			},
      getCurrentCard = function() {
        return $('.mainpage-menu li.active').children('a').data('card');
      }

      return {
        init: function() {
            $target = $('#output');
            $pages = $('#pages');
            $progressBar = $('#deadlineProgressBar');
            currentCount = $('.mainpage-menu li.active').children('a').data('count'),
            cardId = getCurrentCard();

            buttons.processButtonContainer('PRIVOFFICE_MENU', null, btnMetadata);

	          sendRequest({
                cardId: cardId,
	            	filterBy: currentFilter,
	            	lowerBound: 1,
	            	upperBound: itemsOnPage,
	          }, function(){
                console.log('Есть ли тут задачи: '+!!$target.find('.task-item, .request-item').length);
	            	renderPagination();
                if (!$target.find('.task-item, .request-item').length){
                  $target.html($('.wizardWrapper').eq(0).clone().show());
                  $pages.html('');
                }
                $('.deadline[data-card="' + cardId + '"]').show();
                particlesJS("particles", {"particles":{"number":{"value":134,"density":{"enable":true,"value_area":800}},"color":{"value":"#c6ccd4"},"shape":{"type":"circle","stroke":{"width":0,"color":"#000000"},"polygon":{"nb_sides":5},"image":{"src":"img/github.svg","width":100,"height":100}},"opacity":{"value":0.48927153781200905,"random":false,"anim":{"enable":false,"speed":1,"opacity_min":0.1,"sync":false}},"size":{"value":3.7,"random":true,"anim":{"enable":false,"speed":40,"size_min":0.1,"sync":false}},"line_linked":{"enable":true,"distance":150,"color":"#acacac","opacity":0.42613972648142723,"width":1},"move":{"enable":true,"speed":0.9,"direction":"none","random":false,"straight":false,"out_mode":"out","bounce":false,"attract":{"enable":false,"rotateX":600,"rotateY":1200}}},"interactivity":{"detect_on":"canvas","events":{"onhover":{"enable":false,"mode":"repulse"},"onclick":{"enable":false,"mode":"push"},"resize":true},"modes":{"grab":{"distance":400,"line_linked":{"opacity":1}},"bubble":{"distance":400,"size":40,"duration":2,"opacity":8,"speed":3},"repulse":{"distance":200,"duration":0.4},"push":{"particles_nb":4},"remove":{"particles_nb":2}}},"retina_detect":true});var count_particles, stats, update; stats = new Stats; stats.setMode(0); stats.domElement.style.position = 'absolute'; stats.domElement.style.left = '0px'; stats.domElement.style.top = '0px'; document.body.appendChild(stats.domElement); count_particles = document.querySelector('.js-count-particles'); update = function() { stats.begin(); stats.end(); if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) { count_particles.innerText = window.pJSDom[0].pJS.particles.array.length; } requestAnimationFrame(update); }; requestAnimationFrame(update);;
	          });

	        },
	        filterTasks: function(button) {
	        	var $button = $(button);

	        	if ($button.data('count') === 0) return;
            var type = $button.closest('.deadline').data('type');

            $('a[data-type="' + type + '"]').parent().addClass('active').siblings().removeClass('active');

            currentFilter = $button.data('filter');
	        	currentCount = $button.data('count');

    				sendRequest({
              cardId: $button.closest('.deadline').data('card'),
    					filterBy: currentFilter,
    					lowerBound: 1,
    	        upperBound: itemsOnPage,
    				}, function(){
    					renderPagination();
    				});
			},
			addToFavorites: function(button) {
				var $button = $(button),
					title,
					activeClass = 'task-add-favorites__added';

				$button.toggleClass(activeClass);
				title = ($button.hasClass(activeClass)) ? 'Убрать задачу из избранного' : 'Добавить задачу в избранное';
				$button.attr('title', title);
			},
      listData: function(item) {
        var cardId,
        $this = $(item);
        currentCount = $this.data('count');
        currentFilter = null;

        sendRequest({
          cardId: $this.data('card'),
          lowerBound: 1,
          upperBound: itemsOnPage,
        }, function(){
          $this.parent().addClass('active').siblings().removeClass('active');
          console.log('Есть ли тут задачи: '+!!$target.find('.task-item, .request-item').length);

          $('.deadline').hide();
          $('.deadline[data-card="' + $this.data('card') + '"]').show();
          renderPagination();
          if (!$target.find('.task-item, .request-item').length){
            $target.html($('.wizardWrapper').eq(0).clone().show());
            $pages.html('');
          }
        });
			}
	    }
    })();

$(function(){
  	mainpage.init();
});


//]]>
</xsl:text>
</script>
