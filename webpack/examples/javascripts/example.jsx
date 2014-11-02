/** @jsx React.DOM */

module React from 'react';
import { CommentBox } from './CommentBox';

var $ = require('jquery');

var render = () => {
  if ($("#content").length > 0) {
    React.renderComponent(
      <div>
        <CommentBox url="comments.json" pollInterval={2000} />
        <div>Test T Testssz s23s4 T444 sT T sT Tx </div>
        <div className="twitter-image container"/>
      </div>,
      document.getElementById('content')
    );
  }
}

$(function() {
  console.log('hi');
  render();
  // Next part is to make this work with turbo-links
  $(document).on("page:change", () => {
    render();
  });
});
