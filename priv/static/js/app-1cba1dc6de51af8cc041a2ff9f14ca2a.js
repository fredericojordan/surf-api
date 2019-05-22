!function(t){var e={};function n(a){if(e[a])return e[a].exports;var r=e[a]={i:a,l:!1,exports:{}};return t[a].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=t,n.c=e,n.d=function(t,e,a){n.o(t,e)||Object.defineProperty(t,e,{configurable:!1,enumerable:!0,get:a})},n.r=function(t){Object.defineProperty(t,"__esModule",{value:!0})},n.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(e,"a",e),e},n.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},n.p="",n(n.s=4)}([function(t,e){function n(t){return(n="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t})(t)}!function(t){"use strict";var e,a,r,i=t.Chartkick||{},o=[];function c(t){return"[object Array]"===Object.prototype.toString.call(t)}function u(t){return t instanceof Function}function s(t){return!u(t)&&t instanceof Object}function d(t,e){var n;for(n in e)s(e[n])||c(e[n])?(s(e[n])&&!s(t[n])&&(t[n]={}),c(e[n])&&!c(t[n])&&(t[n]=[]),d(t[n],e[n])):void 0!==e[n]&&(t[n]=e[n])}function l(t,e){var n={};return d(n,t),d(n,e),n}function f(t,e,n,a,r,i,o){return function(c,u,s){var d=l({},t);return d=l(d,s||{}),u.hideLegend&&e(d),"min"in u?n(d,u.min):function(t){var e,n,a;for(e=0;e<t.length;e++)for(a=t[e].data,n=0;n<a.length;n++)if(a[n][1]<0)return!0;return!1}(c)||n(d,0),u.max&&a(d,u.max),u.stacked&&r(d),u.colors&&(d.colors=u.colors),u.xtitle&&i(d,u.xtitle),u.ytitle&&o(d,u.ytitle),d=l(d,u.library||{})}}function h(t,e){!function(t,e){document.body.innerText?t.innerText=e:t.textContent=e}(t,"Error Loading Chart: "+e),t.style.color="#ff0000"}function p(t,e){try{e(t)}catch(e){throw h(t.element,e.message),e}}function m(e,n){"string"==typeof e.dataSource?function(e,n,a){(t.jQuery||t.Zepto||t.$).ajax({dataType:"json",url:n,success:a,error:function(t,n,a){var r="string"==typeof a?a:a.message;h(e,r)}})}(e.element,e.dataSource,function(t,a,r){e.data=t,p(e,n)}):(e.data=e.dataSource,p(e,n))}function v(t){return""+t}function g(t){return parseFloat(t)}function y(t){"object"!==n(t)&&(t="number"==typeof t?new Date(1e3*t):function(t){var e,n,i,o,c,u,s,d,l,f,h;return"[object Date]"===(f=Object.prototype.toString.call(t))?t:"[object String]"===f&&(i=t.match(a))?(h=parseInt(i[1],10),u=parseInt(i[3],10)-1,e=parseInt(i[5],10),n=parseInt(i[7],10),c=i[9]?parseInt(i[9],10):0,l=i[11]?parseInt(i[11],10):0,o=i[12]?1e3*parseFloat(r+i[12].slice(1)):0,d=Date.UTC(h,u,e,n,c,l,o),i[13]&&i[14]&&(s=60*i[15],i[17]&&(s+=parseInt(i[17],10)),d-=60*(s*="-"===i[14]?-1:1)*1e3),new Date(d)):void 0}(t.replace(/ /,"T").replace(" ","").replace("UTC","Z"))||new Date(t));return t}function b(t){if(!c(t)){var e,n=[];for(e in t)t.hasOwnProperty(e)&&n.push([e,t[e]]);t=n}return t}function C(t,e){return t[0].getTime()-e[0].getTime()}if(a=/(\d\d\d\d)(\-)?(\d\d)(\-)?(\d\d)(T)?(\d\d)(:)?(\d\d)?(:)?(\d\d)?([\.,]\d+)?($|Z|([\+\-])(\d\d)(:)?(\d\d)?)/i,r=String(1.5).charAt(1),"Highcharts"in t){var w=new function(){var e=t.Highcharts;this.name="highcharts";var n={chart:{},xAxis:{title:{text:null},labels:{style:{fontSize:"12px"}}},yAxis:{title:{text:null},labels:{style:{fontSize:"12px"}}},title:{text:null},credits:{enabled:!1},legend:{borderWidth:0},tooltip:{style:{fontSize:"12px"}},plotOptions:{areaspline:{},series:{marker:{}}}},a=f(n,function(t){t.legend.enabled=!1},function(t,e){t.yAxis.min=e},function(t,e){t.yAxis.max=e},function(t){t.plotOptions.series.stacking="normal"},function(t,e){t.xAxis.title.text=e},function(t,e){t.yAxis.title.text=e});this.renderLineChart=function(t,n){var r={};"areaspline"===(n=n||"spline")&&(r={plotOptions:{areaspline:{stacking:"normal"},series:{marker:{enabled:!1}}}});var i,o,c,u=a(t.data,t.options,r);u.xAxis.type=t.options.discrete?"category":"datetime",u.chart.type=n,u.chart.renderTo=t.element.id;var s=t.data;for(o=0;o<s.length;o++){if(i=s[o].data,!t.options.discrete)for(c=0;c<i.length;c++)i[c][0]=i[c][0].getTime();s[o].marker={symbol:"circle"}}u.series=s,new e.Chart(u)},this.renderScatterChart=function(t){var n=a(t.data,t.options,{});n.chart.type="scatter",n.chart.renderTo=t.element.id,n.series=t.data,new e.Chart(n)},this.renderPieChart=function(t){var a={};t.options.colors&&(a.colors=t.options.colors);var r=l(l(n,a),t.options.library||{});r.chart.renderTo=t.element.id,r.series=[{type:"pie",name:"Value",data:t.data}],new e.Chart(r)},this.renderColumnChart=function(t,n){n=n||"column";var r,i,o,c,u=t.data,s=a(u,t.options),d=[];for(s.chart.type=n,s.chart.renderTo=t.element.id,r=0;r<u.length;r++)for(o=u[r],i=0;i<o.data.length;i++)d[(c=o.data[i])[0]]||(d[c[0]]=new Array(u.length)),d[c[0]][r]=c[1];var l=[];for(r in d)d.hasOwnProperty(r)&&l.push(r);s.xAxis.categories=l;var f=[];for(r=0;r<u.length;r++){for(c=[],i=0;i<l.length;i++)c.push(d[l[i]][r]||0);f.push({name:u[r].name,data:c})}s.series=f,new e.Chart(s)};var r=this;this.renderBarChart=function(t){r.renderColumnChart(t,"bar")},this.renderAreaChart=function(t){r.renderLineChart(t,"areaspline")}};o.push(w)}if(t.google&&t.google.setOnLoadCallback){var x=new function(){var e=t.google;this.name="google";var n={},a=[],r=function(){for(var t,n=0;n<a.length;n++)t=a[n],e.visualization&&("corechart"===t.pack&&e.visualization.LineChart||"timeline"===t.pack&&e.visualization.Timeline)&&(t.callback(),a.splice(n,1),n--)},o=function(t,o){if(o||(o=t,t="corechart"),a.push({pack:t,callback:o}),n[t])r();else{n[t]=!0;var c={packages:[t],callback:r};i.language&&(c.language=i.language),e.load("visualization","1",c)}},c={chartArea:{},fontName:"'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helvetica, sans-serif",pointSize:6,legend:{textStyle:{fontSize:12,color:"#444"},alignment:"center",position:"right"},curveType:"function",hAxis:{textStyle:{color:"#666",fontSize:12},titleTextStyle:{},gridlines:{color:"transparent"},baselineColor:"#ccc",viewWindow:{}},vAxis:{textStyle:{color:"#666",fontSize:12},titleTextStyle:{},baselineColor:"#ccc",viewWindow:{}},tooltip:{textStyle:{color:"#666",fontSize:12}}},u=function(t){t.legend.position="none"},s=function(t,e){t.hAxis.viewWindow.min=e},d=function(t,e){t.hAxis.viewWindow.max=e},h=function(t){t.isStacked=!0},p=f(c,u,function(t,e){t.vAxis.viewWindow.min=e},function(t,e){t.vAxis.viewWindow.max=e},h,function(t,e){t.hAxis.title=e,t.hAxis.titleTextStyle.italic=!1},function(t,e){t.vAxis.title=e,t.vAxis.titleTextStyle.italic=!1}),m=function(t,n){var a=new e.visualization.DataTable;a.addColumn(n,"");var r,i,o,c,u,s=[];for(r=0;r<t.length;r++)for(o=t[r],a.addColumn("number",o.name),i=0;i<o.data.length;i++)c=o.data[i],s[u="datetime"===n?c[0].getTime():c[0]]||(s[u]=new Array(t.length)),s[u][r]=g(c[1]);var d,l=[];for(r in s)s.hasOwnProperty(r)&&(d="datetime"===n?new Date(g(r)):"number"===n?g(r):r,l.push([d].concat(s[r])));return"datetime"===n&&l.sort(C),a.addRows(l),a},v=function(e){t.attachEvent?t.attachEvent("onresize",e):t.addEventListener&&t.addEventListener("resize",e,!0),e()};this.renderLineChart=function(t){o(function(){var n=p(t.data,t.options),a=m(t.data,t.options.discrete?"string":"datetime");t.chart=new e.visualization.LineChart(t.element),v(function(){t.chart.draw(a,n)})})},this.renderPieChart=function(t){o(function(){var n={chartArea:{top:"10%",height:"80%"}};t.options.colors&&(n.colors=t.options.colors);var a=l(l(c,n),t.options.library||{}),r=new e.visualization.DataTable;r.addColumn("string",""),r.addColumn("number","Value"),r.addRows(t.data),t.chart=new e.visualization.PieChart(t.element),v(function(){t.chart.draw(r,a)})})},this.renderColumnChart=function(t){o(function(){var n=p(t.data,t.options),a=m(t.data,"string");t.chart=new e.visualization.ColumnChart(t.element),v(function(){t.chart.draw(a,n)})})},this.renderBarChart=function(t){o(function(){var n=f(c,u,s,d,h)(t.data,t.options,{hAxis:{gridlines:{color:"#ccc"}}}),a=m(t.data,"string");t.chart=new e.visualization.BarChart(t.element),v(function(){t.chart.draw(a,n)})})},this.renderAreaChart=function(t){o(function(){var n=p(t.data,t.options,{isStacked:!0,pointSize:0,areaOpacity:.5}),a=m(t.data,t.options.discrete?"string":"datetime");t.chart=new e.visualization.AreaChart(t.element),v(function(){t.chart.draw(a,n)})})},this.renderGeoChart=function(t){o(function(){var n={legend:"none",colorAxis:{colors:t.options.colors||["#f6c7b6","#ce502d"]}},a=l(l(c,n),t.options.library||{}),r=new e.visualization.DataTable;r.addColumn("string",""),r.addColumn("number","Value"),r.addRows(t.data),t.chart=new e.visualization.GeoChart(t.element),v(function(){t.chart.draw(r,a)})})},this.renderScatterChart=function(t){o(function(){var n=p(t.data,t.options,{}),a=m(t.data,"number");t.chart=new e.visualization.ScatterChart(t.element),v(function(){t.chart.draw(a,n)})})},this.renderTimeline=function(t){o("timeline",function(){var n={legend:"none"};t.options.colors&&(n.colors=t.options.colors);var a=l(l(c,n),t.options.library||{}),r=new e.visualization.DataTable;r.addColumn({type:"string",id:"Name"}),r.addColumn({type:"date",id:"Start"}),r.addColumn({type:"date",id:"End"}),r.addRows(t.data),t.chart=new e.visualization.Timeline(t.element),v(function(){t.chart.draw(r,a)})})}};o.push(x)}function A(t,e){var n,a,r,i;for(r="render"+t,i=e.options.adapter,n=0;n<o.length;n++)if(a=o[n],(!i||i===a.name)&&u(a[r]))return a[r](e);throw new Error("No adapter found")}var S=function(t,e){return t="number"===e?g(t):"datetime"===e?y(t):v(t)},T=function(t,e){var n,a,r=[];for(a=0;a<t.length;a++)n=S(t[a][0],e),r.push([n,g(t[a][1])]);return"datetime"===e&&r.sort(C),r};function z(t,e,a){var r;for(!c(t)||"object"!==n(t[0])||c(t[0])?(t=[{name:"Value",data:t}],e.hideLegend=!0):e.hideLegend=!1,e.discrete&&(a="string"),r=0;r<t.length;r++)t[r].data=T(b(t[r].data),a);return t}function k(t){var e,n=b(t);for(e=0;e<n.length;e++)n[e]=[v(n[e][0]),g(n[e][1])];return n}function E(t){t.data=z(t.data,t.options,"datetime"),A("LineChart",t)}function L(t){t.data=z(t.data,t.options,"string"),A("ColumnChart",t)}function O(t){t.data=k(t.data),A("PieChart",t)}function j(t){t.data=z(t.data,t.options,"string"),A("BarChart",t)}function D(t){t.data=z(t.data,t.options,"datetime"),A("AreaChart",t)}function P(t){t.data=k(t.data),A("GeoChart",t)}function I(t){t.data=z(t.data,t.options,"number"),A("ScatterChart",t)}function W(t){t.data=function(t){var e;for(e=0;e<t.length;e++)t[e][1]=y(t[e][1]),t[e][2]=y(t[e][2]);return t}(t.data),A("Timeline",t)}function _(t,n,a,r,i){"string"==typeof n&&(n=document.getElementById(n)),t.element=n,t.options=r||{},t.dataSource=a,e.charts[n.id]=t,m(t,i)}e={LineChart:function(t,e,n){_(this,t,e,n,E)},PieChart:function(t,e,n){_(this,t,e,n,O)},ColumnChart:function(t,e,n){_(this,t,e,n,L)},BarChart:function(t,e,n){_(this,t,e,n,j)},AreaChart:function(t,e,n){_(this,t,e,n,D)},GeoChart:function(t,e,n){_(this,t,e,n,P)},ScatterChart:function(t,e,n){_(this,t,e,n,I)},Timeline:function(t,e,n){_(this,t,e,n,W)},charts:{}},t.Chartkick=e}(window)},function(t,e,n){"use strict";!function(){var t=function(){if("function"==typeof window.CustomEvent)return window.CustomEvent;function t(t,e){e=e||{bubbles:!1,cancelable:!1,detail:void 0};var n=document.createEvent("CustomEvent");return n.initCustomEvent(t,e.bubbles,e.cancelable,e.detail),n}return t.prototype=window.Event.prototype,t}();function e(t,e){var n=document.createElement("input");return n.type="hidden",n.name=t,n.value=e,n}function n(t){var n=t.getAttribute("data-to"),a=e("_method",t.getAttribute("data-method")),r=e("_csrf_token",t.getAttribute("data-csrf")),i=document.createElement("form"),o=t.getAttribute("target");i.method="get"===t.getAttribute("data-method")?"get":"post",i.action=n,i.style.display="hidden",o&&(i.target=o),i.appendChild(r),i.appendChild(a),document.body.appendChild(i),i.submit()}window.addEventListener("click",function(e){for(var a=e.target;a&&a.getAttribute;){var r=new t("phoenix.link.click",{bubbles:!0,cancelable:!0});if(!a.dispatchEvent(r))return e.preventDefault(),e.stopImmediatePropagation(),!1;if(a.getAttribute("data-method"))return n(a),e.preventDefault(),!1;a=a.parentNode}},!1),window.addEventListener("phoenix.link.click",function(t){var e=t.target.getAttribute("data-confirm");e&&!window.confirm(e)&&t.preventDefault()},!1)}()},function(t,e,n){},function(t,e,n){"use strict";n.r(e);n(2),n(1),n(0)},function(t,e,n){t.exports=n(3)}]);