
			jQuery(document).ready(function($) {
				// We only want these styles applied when javascript is enabled
				$('div.content').css('display', 'block');

				
				// Initially set opacity on thumbs and add
				// additional styling for hover effect on thumbs
				var onMouseOutOpacity = 0.67;
				$('#thumbs ul.thumbs li, div.navigation a.pageLink').opacityrollover({
					mouseOutOpacity:   onMouseOutOpacity,
					mouseOverOpacity:  1.0,
					fadeSpeed:         'fast',
					exemptionSelector: '.selected'
				});
				
				
				var gallery = $('#thumbs').galleriffic({
					delay:                  3000,
					preloadAhead:           10,
					
						numThumbs:         8,
						enableTopPager:         true,
						enableBottomPager:      false,
					
					imageContainerSel:      '#slideshow',
					controlsContainerSel:   '#controls',
					captionContainerSel:    '#caption',
					loadingContainerSel:    '#loading',
					renderSSControls:       true,
					playLinkText:           'Slide Show',
					pauseLinkText:          'Gallery',
					prevLinkText:           'Previous',
					nextLinkText:           'Next',
					nextPageLinkText:       'Next &rsaquo;',
					prevPageLinkText:       '&lsaquo; Prev',
					enableHistory:          false,
					autoStart:              true,
					syncTransitions:           true,
					defaultTransitionDuration: 900,
					onSlideChange:               function(prevIndex, nextIndex) {
						this.find('ul.thumbs').children()
							.eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
							.eq(nextIndex).fadeTo('fast', 1.0);
						
						this.$captionContainer.find('div.photo-index').html('Photo '+ (nextIndex+1) +' of '+ this.data.length);
					},
					onPageTransitionOut:       function(callback) {
						this.fadeTo('fast', 0.0, callback);
					},
					onPageTransitionIn:        function() {
						

						this.fadeTo('fast', 1.0);
					}
				});

				

				
			});
