var Workspace = Backbone.Router.extend({

  // the (*) splat operator sets a default route
  routes: {
    '*filter': 'setFilter'
  },

  setFilter: function ( param ) {
    app.TodoFilter = param.trim() || '';

    app.Todos.trigger('filter');
  }
});

app.TodoRouter = new Workspace();
Backbone.history.start();
