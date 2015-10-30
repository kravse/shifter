Shifter = (()->

  shift = ($element, time) ->
    $element.addClass('shift-parent')

    zIndex = 0
    shiftArray = []  
    
    $bgShifter = $('.bg-shifter', $element)

    $bgShifter.wrapAll( "<div class='bg-shifter-inner' />");


    $element.children().not('.bg-shifter').each () ->
      $currentShift = $(this)
      if($currentShift.css('position') == 'absolute' || $currentShift.css('position') == 'relative' || $currentShift.css('position') == 'fixed' )
        if($currentShift.css('z-index') < zIndex) 
          zIndex = $currentShift.css('z-index')
        else if($currentShift.css('z-index') == 'auto')
          if(0 < zIndex)
            zIndex = 0

    $bgShifter.css('z-index', zIndex - 1).each (i) ->
      $(this).addClass('shift-'+i)
      shiftArray.push($(this))

    shifterCount = shiftArray.length
    count = shifterCount-1
    $previousSlide = false
    transitions = 
      opacity: (time/2.5)/300 + 's ease'
      transform: (time*8)/500+'s ease'

    $bgShifter.css(
      '-webkit-transition': 'opacity '+transitions.opacity+', -webkit-transform '+transitions.transform,
      '-moz-transition': 'opacity '+transitions.opacity+', transform '+transitions.transform,
      '-o-transition': 'opacity '+transitions.opacity+', transform '+transitions.transform,
      '-ms-transition': 'opacity '+transitions.opacity+', -ms-transform '+transitions.transform,
      'transition': 'opacity '+transitions.opacity+', transform '+transitions.transform)

    setTimeout (-> 
      shiftArray[count].css('transform': 'scale(1.5) rotate(-5deg)', '-ms-transform': 'scale(1.5) rotate(-5deg)', '-webkit-transform': 'scale(1.5) rotate(-5deg)')
    ), 0
    
    setInterval (->
      if($previousSlide)
        $previousSlide.detach().prependTo($('.bg-shifter-inner', $element)).css(
          'opacity': '1',
          'transform': 'scale(1) rotate(0)',
          '-ms-transform': 'scale(1) rotate(0)',
          '-webkit-transform': 'scale(1) rotate(0)')

      shiftArray[count].css({'opacity': '0'})
      $previousSlide = shiftArray[count]; 

      if(count-1 < 0)
        count = shifterCount - 1
      else
        count--
        
      shiftArray[count].css(
        'transform': 'scale(1.5) rotate(-5deg)',
        '-ms-transform': 'scale(1.5) rotate(-5deg)',
        '-webkit-transform': 'scale(1.5) rotate(-5deg)')


    ), time

  return {
    shift: shift
  }

)()