var app = app || {};

app.TodoView = Backbone.View.extend({
  tagName: 'li',

  template: _.template($('#item-template').html()),

  events: {
    'click .toggle': 'toggleCompleted',
    'dblclick label': 'edit',
    'keypress .edit': 'updateOnEnter',
    'click .destroy': 'clear',
    'blur .edit': 'close'
  },

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    this.listenTo(this.model, 'visible', this.toggleVisiblity)
  },

  render: function() {
    console.log('render')
    console.log(this.template(this.model.attributes))
    console.log(this.$el)
    this.$el.html(this.template(this.model.attributes));
    this.$input = this.$('.edit');
    return this;
  },

  edit: function() {
    this.$el.addClass('editing');
    this.$input.focus();
  },

  close: function() {
    var value = this.$input.val().trim();
    if (value) {
      this.model.save({ title: value });
    };
    this.$el.removeClass('editing');
  },

  updateOnEnter: function(e) {
    if (e.which == ENTER_KEY) {
      this.close();
    };
  },

  toggleCompleted: function() {
    this.model.toggle();
  },

  toggleVisiblity: function() {
    this.$el.toggleClass('hidden', this.isHidden());
  },

  isHidden: function() {
    var isCompleted = this.model.get('completed');
    (!isCompleted && app.TodoFilter === 'completed') || (isCompleted && app.TodoFilter === 'active')
  }
});