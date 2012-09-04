
/*
 * GET Home Page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'HTML5 & CSS3' });
};

exports.motion = function(req, res){
  res.render('motion', { title: 'RubyMotion' });
};

exports.objectivec = function(req, res){
  res.render('objectivec', { title: 'Objective-C' });
};

exports.macruby = function(req, res){
  res.render('macruby', { title: 'MacRuby' });
};

exports.scriptjs = function(req, res){
  res.render('scriptjs', { title: '$script.js' });
};
