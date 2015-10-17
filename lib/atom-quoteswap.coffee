{CompositeDisposable} = require 'atom'
tq = require 'togglequotes'

module.exports = AtomQuoteswap =
  atomQuoteswapView: null
  subscriptions: null

  activate: (state) ->
    atom.commands.add 'atom-workspace', 'atom-quoteswap:swap': => @swap()

  deactivate: ->
    @subscriptions.dispose()

  swap: ->
    if editor = atom.workspace.getActiveTextEditor()
      selection = editor.getSelectedText()
      editor.insertText(tq.toggleQuotes(selection))
