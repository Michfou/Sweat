/**
 * Created by Alex on 2015-11-15.
 */
Template.addPostPanel.events({
    'click .confirm': function() {
// Save();

        slidePanel.close();
    },
    'click .close': function() {
        slidePanel.close();
    }
});
Template.addPostPanel.rendered = function() {
    var self = this;

// Do some setup in here for when the panel is shown
    Session.set('confirmed', null);

// Setup an on close handler

    slidePanel.onClose(function() {
// Fun stuff
    });
}

Template.addPostPanel.events({
    'click': function(event) {
        slidePanel.showPanel('addPost');


// Setup an on close handler
        slidePanel.onClose(function() {
            temp.confirmedVar = true;
        });
    }
});