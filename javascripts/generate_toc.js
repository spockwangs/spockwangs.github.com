// -*- coding: utf-8-unix; -*-
//
// @file generate_toc.js
// @brief Generate a table of contents at the side bar from elements <h2> and
// <h3>.
//
// Require jquery.

$(function () {
    var article_id = "article-content";
    var toc_id = "toc";
    var children = $("#" + article_id).children();

    // Generate TOC from all <h2> and <h3> elements.
    var html = '';
    var level = 0;
    for (var i = 0; i < children.length; i++) {
        var e = $(children[i]);
        var tag_name = e.prop('tagName').toUpperCase();
        switch (level) {
        case 0:
            if (tag_name == "H2") {
                // Open the first section.
                html += '<ul><li><a href="#sec' + i + '">' + e.text() + '</a>';
                e.attr('id', 'sec' + i);
                level = 1;
            }
            break;
        case 1:
            if (tag_name == 'H2') {
                // End the previous section and open a new section.
                html += '</li><li><a href="#sec' + i + '">' + e.text() + '</a>';
                e.attr('id', 'sec' + i);
            } else if (tag_name == 'H3') {
                // Down to the first subsection of this section.
                html += '<ul><li><a href="#sec' + i + '">' + e.text() + '</a>';
                e.attr('id', 'sec' + i);
                level = 2;
            }
            break;
        case 2:
            if (tag_name == 'H2') {
                // End the previous subsection and its parent, and open a new section.
                html += '</li></ul></li><li><a href="#sec' + i + '">' + e.text() + '</a>';
                e.attr('id', 'sec' + i);
                level = 1;
            } else if (tag_name == 'H3') {
                // End the previous subsection, and open a new subsection.
                html += '</li><li><a href="#sec' + i + '">' + e.text() + '</a>';
                e.attr('id', 'sec' + i);
            }
            break;
        }
    }
    
    $('#' + toc_id).html(html);

    // Only show TOC if there is at least one section
    if (html.length > 0)
        $('#toc-wrapper').removeClass('invisible');
});
