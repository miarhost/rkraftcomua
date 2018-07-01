App.products = App.cable.subscriptions.create "ProductsChannel", connected: ->

disconnected: ->

received: (data) -> 
$(".store #main").html(data.html)