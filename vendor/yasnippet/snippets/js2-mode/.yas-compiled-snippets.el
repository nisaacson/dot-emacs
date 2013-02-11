;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("elif" "else if (${1:condition}) {\n   $0\n} " "else if (condition) { ... }" nil nil nil nil nil nil)
                       ("else" "else {\n   $0\n} " "else { ... }" nil nil nil nil nil nil)
                       ("if" "if (${1:condition}) $2;$0" "if (condition) ..." nil nil nil nil nil nil)
                       ("requ" "var $1 = require('${1:file}');" "var name = require(file);" nil nil nil nil nil nil)
                       ("var" "var ${1:name} = ${2:value};$0" "var name = value;" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("as" "async.series([\n  function (cb) {\n   $0\n   cb();\n  },\n  function (cb) {\n    cb();\n  },\n  function (cb) {\n    cb();\n  },\n  ], function(err) {\n  });" "async.series([function(cb) { ... });" nil
                        ("noah")
                        nil nil nil nil)
                       ("err" "if (err) { return cb(err); }" "if (err) { return cb(err); });" nil
                        ("noah")
                        nil nil nil nil)
                       ("eyes" "var inspect = require('eyespect').inspector();" "var inspect = require('eyespect'); });" nil
                        ("noah")
                        nil nil nil nil)
                       ("fn" "function (${1:err}, ${2:reply}) {\n   $0\n});" "function(error, reply) { ... });" nil
                        ("noah")
                        nil nil nil nil)
                       ("js" "JSON.stringify($0, null, ' ')\n" "JSON.stringify({ ... }, null, ' ');" nil
                        ("noah")
                        nil nil nil nil)
                       ("mongofind" "$1.find({$2}, function(error, result) {\n  $0;\n});" "<model>.find({params}, function(error, result) {...});" nil
                        ("noah")
                        nil nil nil nil)
                       ("rk" "var rk = require('required-keys');" "var inspect = require('eyespect'); });" nil
                        ("noah")
                        nil nil nil nil)
                       ("sh" "var should = require('should');\n" "var should = require('should');" nil
                        ("noah")
                        nil nil nil nil)))


;;; Do not edit! File generated at Mon Feb 11 02:46:41 2013
