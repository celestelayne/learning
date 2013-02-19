var app = app || {};

app.AppView = Backbone.View.extend({

  // Find an existing tag with #todoapp and bind to it
  el: '#todoapp',

  // Cachs the template
  statsTemplate: _.template( $('#stats-template').html() ),

  events: {
    'keypress #new-todo': 'createOnEnter',
    'click #clear-completed': 'clearCompleted',
    'click #toggle-all': 'toggleAllComplete'
  },

  initialize: function () {
    this.allCheckbox = this.$('#toggle-all')[0];
    this.$input = this.$('#new-todo');
    this.$footer = this.$('#footer');
    this.$main = this.$('main');

    this.listenTo(app.Todos, 'add', this.addOne);
    this.listenTo(app.Todos, 'reset', this.addAll);
    this.listenTo(app.Todos, 'change:completed', this.filterOne);
    this.listenTo(app.Todos, 'filter', this.filterAll);
    this.listenTo(app.Todos, 'all', this.render);

    app.Todos.fetch();
  },

  // Render just refreshes the statistics here
  render: function () {
    var completed = app.Todos.completed().length;
    var remaining = app.Todos.remaining().length;

    if ( app.Todos.length ) {
      this.$main.show();
      this.$footer.show();

      this.$footer.html(this.statsTemplate({
        completed: completed,
        remaining: remaining
      }));

      this.$('#filters li a')
        .removeClass('selected')
        .filter('[href="#/' + ( app.TodoFilter || '' ) + '"]')
        .addClass('selected')
    } else {
      this.$main.hide();
      this.$footer.hide();
    }

    this.allCheckbox.checked = !remaining;
  },

  addOne: function ( todo ) {
    var todoView = new app.TodoView({ model: todo  });
    $('#todo-list').append( todoView.render().el );
  },

  addAll: function () {
    this.$('#todo-list').html('');
    app.Todos.each(this.addOne, this);
  },

  filterOne: function ( todo ) {
    todo.trigger('visible');
  },

  filterAll: function () {
    app.Todos.each(this.filterOne, this);
  },

  // Generate new attributes for a todo item
  newAttributes: function () {
    return {
      title: this.$input.val().trim(),
      order: app.Todos.nextOrder(),
      completed: false
    };
  },

  // Save it if you hit ender
  createOnEnter: function ( event ) {
    if ( event.which !== ENTER_KEY || !this.$input.val().trim() ) {
      return;
    }
    app.Todos.create( this.newAttributes() );
    this.$input.val('');
  },

  // remove items in the todo list marked as completed
  clearCompleted: function () {
    _.invoke(app.Todos.completed(), 'destroy');
    return false;
  },

  toggleAllComplete: function () {
    var completed = this.allCheckbox.checked;

    app.Todos.each(function ( todo ) {
      todo.save({
        'completed': completed
      });
    });
  }
});


