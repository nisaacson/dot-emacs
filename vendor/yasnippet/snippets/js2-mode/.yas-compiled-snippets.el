;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("README.md" "This is a collection of JavaScript and Node.js snippets for the\nYASnippet template system for Emacs.\n\nInstallation\n============\n\nSimply copy the `js-mode` directory into the `yas/root-directory` which should be something like `~/.emacs.d/yasnippet-*.*.*/snippets`. If you want to place the folder inside of the `text-mode` folder instead, you must first remove the `.yas-parents` file from the `js-mode` directory.\n" "README.md" nil nil nil nil nil nil)
                       ("elif" "else if (${1:condition}) {\n   $0\n} " "else if (condition) { ... }" nil nil nil nil nil nil)
                       ("else" "else {\n   $0\n} " "else { ... }" nil nil nil nil nil nil)
                       ("for.1" "for (var ${1:variable} in ${2:object}) {\n    $0\n}\n" "foreach" nil nil nil nil nil nil)
                       ("for.2" "for (var ${1:i}=0, len=${2:array}.length; $1 < len; ++$1) {\n    var ${3:variable} = $2[i];\n    $0\n}\n" "for" nil nil nil nil nil nil)
                       ("for.3" "for (var ${1:i}=${2:array}.length-1; $1 >= 0; --$1) {\n    var ${3:variable} = $2[i];\n    $0\n}\n" "for (reversed)" nil nil nil nil nil nil)
                       ("fun.1" "function(${2:args}) { \n    $0 \n}" "function(args) { ... }" nil nil nil nil nil nil)
                       ("fun.2" "function ${1:name}(${2:args}) {\n  $0\n}" "function name(args) { ... }" nil nil nil nil nil nil)
                       ("if.1" "if (${1:condition}) $2;$0" "if (condition) ..." nil nil nil nil nil nil)
                       ("if.2" "if (${1:condition}) {\n   $0\n}" "if (condition) { ... }" nil nil nil nil nil nil)
                       ("if.3" "if (${1:condition}) {\n   $2\n} else {\n   $0\n} " "if (condition) { ... } else { ... }" nil nil nil nil nil nil)
                       ("log" "console.log($0);" "console.log(...)" nil nil nil nil nil nil)
                       ("req" "var $1 = require('${1:file}');" "var name = require(file);" nil nil nil nil nil nil)
                       ("var" "var ${1:name} = ${2:value};$0" "var name = value;" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("err" "if (err) { return cb(err); }" "if (err) { return cb(err); });" nil
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
                       ("rk" "var rk = require('required-keys');" "var rk = require('required-keys');" nil
                        ("noah")
                        nil nil nil nil)
                       ("sh" "var should = require('should');\n" "var should = require('should');" nil
                        ("noah")
                        nil nil nil nil)
                       ("truthy" "var inspect = require('eyespect').inspector();" "var inspect = require('eyespect'); });" nil
                        ("noah")
                        nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("app" "if (module.id == require.main.id) {\n	$0\n}\n" "app" nil
                        ("node")
                        nil nil nil nil)
                       ("cat" "posix.cat(${1:'${2:path}'}${3:, '${4:utf8}'})${5:.addCallback(function(content) {\n	${10:sys.puts(content);}$0\n\\})};\n" "cat" nil
                        ("node")
                        nil nil nil nil)
                       ("deb" "sys.debug(${1:'${2:hello world}'});" "deb" nil
                        ("node")
                        nil nil nil nil)
                       ("exec" "sys.exec(${1:'${2:ls -al}'})${5:.addCallback(function (stdout, stderr) {\n  $0\n\\})};" "exec" nil
                        ("node")
                        nil nil nil nil)
                       ("exp" "`#!/usr/bin/env ruby\n  if File.read(ENV['TM_FILEPATH']) =~ /^var ([\\w_]*?) = exports;/m\n    print $1\n  else\n    print \"exports\"\n  end\n`.${2:name} = function(${3:arguments}) {\n	$0\n};" "exp" nil
                        ("node")
                        nil nil nil nil)
                       ("mixin" "process.mixin(${1:exports}, {\n	$0\n});" "mixin" nil
                        ("node")
                        nil nil nil nil)
                       ("p" "sys.${1:p}(${2:'${3:hello world}'});" "p" nil
                        ("node")
                        nil nil nil nil)
                       ("puts" "sys.puts(${1:'${2:hello world}'});" "puts" nil
                        ("node")
                        nil nil nil nil)
                       ("readdir" "posix.readdir(${1:'${2:path}'})${5:.addCallback(function(files) {\n	${10:sys.p(files);}$0\n\\})};\n" "readdir" nil
                        ("node")
                        nil nil nil nil)
                       ("ren" "posix.rename(${1:'${2:from}'}, ${3:'${4:to}'})${5:.addCallback(function() {\n	$0\n\\})};\n" "ren" nil
                        ("node")
                        nil nil nil nil)
                       ("rmdir" "posix.mkdir(${1:'${2:path}'}, ${3:'${4:mode}'})${5:.addCallback(function() {\n	$0\n\\})};\n" "rmdir" nil
                        ("node")
                        nil nil nil nil)
                       ("rmdir.1" "posix.rmdir(${1:'${2:path}'})${5:.addCallback(function() {\n	$0\n\\})};\n" "rmdir.1" nil
                        ("node")
                        nil nil nil nil)
                       ("stat" "posix.stat(${1:'${2:path}'}).addCallback(function(stats) {\n	${10:sys.puts(\"stats: \" + JSON.stringify(stats));}$0\n});\n" "stat" nil
                        ("node")
                        nil nil nil nil)))


;;; Do not edit! File generated at Mon Feb 11 02:15:44 2013
