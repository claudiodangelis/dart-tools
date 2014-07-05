{View} = require 'atom'

module.exports =
class AnalysisView extends View
  @content: ->
    @div class: 'tool-panel panel-bottom padded', =>
      @div class: 'pull-right', =>
        @a href: '#', class: 'icon icon-x', rel: 'dismiss'
      @div class: 'lenny', =>
        @text "( ͡° ͜ʖ ͡°) doesn't see any problems. Relax, man."

  initialize: =>
    @subscribe atom.workspaceView, 'dart-tools:problems:show', =>
      @attach()

    @subscribe this.find("a[rel='dismiss']"), 'click', =>
      @detach()
      false
    this

  attach: ->
    atom.workspaceView.appendToBottom(this)
    @show()

  detach: ->
    @hide()

  addProblem: (text) ->
    this.find('.lenny').hide()

    row = new ErrorRow()
    row.text(text)
    this.append(row)

class ErrorRow extends View
  @content: ->
    @div class: 'text-warning'
