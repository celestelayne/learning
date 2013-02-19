var app = app || {};

app.TodoView = Backbone.View.extend({

  tagName: 'li', // Will create an li tag

  template: _.template( $('#item-template').html() ),

  events: {
    'click .toggle': 'toggleCompleted',
    'click .destroy': 'clear',
    'dblclick label': 'edit',
    'keypress .edit': 'updateOnEnter',
    'blur .edit': 'close'
  },

  initialize: function () {
    // There's a one-to-one relationship between a todo Model and a TodoView
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    this.listenTo(this.model, 'visible', this.toggleVisible);
  },

  render: function () {
    this.$el.html( this.template( this.model.toJSON() ) );

    this.$el.toggleClass('completed', this.model.get('completed'));
    this.toggleVisible();

    this.$input = this.$('.edit');
    return this;
  },

  toggleVisible: function () {
    this.$el.toggleClass('hidden', this.isHidden());
  },

  isHidden: function () {
    var isCompleted = this.model.get('completed');
    return (!isCompleted && app.TodoFilter === 'completed'
            || isCompleted && app.TodoFilter === 'active');
  },

  toggleCompleted: function () {
    this.model.toggle();
  },

  edit: function () {
    this.$el.addClass('editing');
    this.$input.focus();
  },

  // close editing mode and save changes
  close: function () {
    var value = this.$input.val().trim();
    if ( value ) {
      this.model.save({ title: value }); 
    } else {
      this.clear();
    }
    this.$el.removeClass('editing');
  },

  updateOnEnter: function () {
    if ( e.which === ENTER_KEY ) {
      this.close();
    }
  },

  clear: function () {
    this.model.destroy();
  }
});
