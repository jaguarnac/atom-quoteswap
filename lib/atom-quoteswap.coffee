{CompositeDisposable} = require 'atom'
tq = require 'togglequotes'

module.exports = AtomQuoteswap =
  atomQuoteswapView: null
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-quoteswap:swap': => @swap()

  deactivate: ->
    @subscriptions.dispose()

  swap: ->
      if editor = atom.workspace.getActiveTextEditor()
          selection = editor.getSelectedText()
          editor.insertText(tq.toggleQuotes(selection))
