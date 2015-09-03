Shifter = (()->

  shift = ($element, time) ->
    $element.addClass('shift-parent')

    zIndex = 0
    shiftArray = []  
     
    $bgShifter = $('.bg-shifter', $element)

    $element.children().not('.bg-shifter').each () ->
      $currentShift = $(this)
      if($currentShift.css('position') == 'absolute' || $currentShift.css('position') == 'relative' || $currentShift.css('position') == 'fixed' )
        if($currentShift.css('z-index') < zIndex) 
          zIndex = $currentShift.css('z-index')
        else if($currentShift.css('z-index') == 'auto')
          if(0 < zIndex)
            zIndex = 0

    $bgShifter.css('z-index', zIndex - 1).each (i) ->
      console.log('yooo dude')
      $(this).addClass('shift-'+i)
      shiftArray.push($(this))

    shifterCount = shiftArray.length
    count = shifterCount-1

    setInterval (->
      shiftArray[count].css({'opacity': '0'})
      if(count-1 < 0)
        count = shifterCount - 1
        $bgShifter.css({'opacity': '1'})
      else
         count--
    ), time

  return {
    shift: shift
  }

)()