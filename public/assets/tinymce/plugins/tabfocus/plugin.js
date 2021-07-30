/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.5.1 (2020-10-01)
 */

!function(){"use strict";var e=tinymce.util.Tools.resolve("tinymce.PluginManager"),t=tinymce.util.Tools.resolve("tinymce.dom.DOMUtils"),c=tinymce.util.Tools.resolve("tinymce.EditorManager"),a=tinymce.util.Tools.resolve("tinymce.Env"),y=tinymce.util.Tools.resolve("tinymce.util.Delay"),d=tinymce.util.Tools.resolve("tinymce.util.Tools"),f=tinymce.util.Tools.resolve("tinymce.util.VK"),m=t.DOM,n=function(e){e.keyCode!==f.TAB||e.ctrlKey||e.altKey||e.metaKey||e.preventDefault()},i=function(s){function e(i){var o,l,e,t,n,u;function r(e){var t=m.select(":input:enabled,*[tabindex]:not(iframe)");function n(e){return/INPUT|TEXTAREA|BUTTON/.test(e.tagName)&&c.get(i.id)&&-1!==e.tabIndex&&function t(e){return"BODY"===e.nodeName||"hidden"!==e.type&&"none"!==e.style.display&&"hidden"!==e.style.visibility&&t(e.parentNode)}(e)}if(d.each(t,function(e,t){if(e.id===s.id)return o=t,!1}),0<e){for(l=o+1;l<t.length;l++)if(n(t[l]))return t[l]}else for(l=o-1;0<=l;l--)if(n(t[l]))return t[l];return null}i.keyCode!==f.TAB||i.ctrlKey||i.altKey||i.metaKey||i.isDefaultPrevented()||(1===(e=d.explode((t=s).getParam("tab_focus",t.getParam("tabfocus_elements",":prev,:next")))).length&&(e[1]=e[0],e[0]=":prev"),(n=i.shiftKey?":prev"===e[0]?r(-1):m.get(e[0]):":next"===e[1]?r(1):m.get(e[1]))&&(u=c.get(n.id||n.name),n.id&&u?u.focus():y.setTimeout(function(){a.webkit||window.focus(),n.focus()},10),i.preventDefault()))}s.on("init",function(){s.inline&&m.setAttrib(s.getBody(),"tabIndex",null),s.on("keyup",n),a.gecko?s.on("keypress keydown",e):s.on("keydown",e)})};e.add("tabfocus",function(e){i(e)})}();
