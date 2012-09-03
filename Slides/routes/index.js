
/*
 * GET Home Page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'HTML5 & CSS3' });
};

exports.motion = function(req, res){
  res.render('motion', { title: 'RubyMotion' });
};

exports.scriptjs = function(req, res){
  res.render('scriptjs', { title: '$script.js' });
};
