# *************************************
#
#   application.js
#
#
# *************************************
#= require _plugins
#= require _app-base

$(document).ready ->
  $('select').material_select()

mq = window.matchMedia('(min-width: 500px)')

class OddDesign.CanvasController
  constructor: ->
    @canvas = $('[data-behavior="canvas"]')
    @membersBtn = $('[data-behavior="to-members"]')
    @worksBtn = $('[data-behavior="to-works"]')
    @contactBtn = $('[data-behavior="to-contact"]')
    @socialBtn = $('[data-behavior="to-social"]')
    @closeBtn = $('[data-behavior="close-btn"]')
    @setEvent()

  setEvent: ->
    @closeBtn. on 'click', @backToLanding
    @contactBtn.on 'click', @moveToContact
    @worksBtn.on 'click', @moveToWorks
    @membersBtn.on 'click', @moveToMember
    @socialBtn.on 'click', @moveToSocial
    @arrowKeyDown()

  arrowKeyDown: =>
    $(window).on 'keydown', (e)=>
      switch e.which
        when 38
          # up
          @moveToMember()
        when 39
          # right
          @moveToWorks()
        when 40
          # down
          @moveToContact()
        when 37
          # left
          @moveToSocial()
        when 27
          # esc
          @backToLanding()
        else
          return
      e.preventDefault()

  moveToMember: =>
    @resetPosition()
    @showCloseBtn()
    @canvas.addClass 'top'

  moveToWorks: =>
    @resetPosition()
    @showCloseBtn()
    @canvas.addClass 'right'

  moveToContact: =>
    @resetPosition()
    @showCloseBtn()
    @canvas.addClass 'bottom'

  moveToSocial: =>
    @resetPosition()
    @showCloseBtn()
    @canvas.addClass 'left'

  backToLanding: =>
    @resetPosition()
    @closeBtn.fadeOut('slow')

  showCloseBtn: =>
    @closeBtn.fadeIn('slow')

  resetPosition: =>
    @canvas.removeClass 'top right bottom left'
