@ECHO OFF
set lnp=C:\windows\system32\notepad.exe
set leoCfg=C:\users\jbooth\cms30\nodeServer\batch\leoconfig.txt

set rootPath=C:\users\jbooth\cms30\nodeServer\clients
set coreOps=C:\users\jbooth\cms30\nodeServer\cms-core-ops\plugins_extended
set client=\bastroptx

:: Setup base client paths

set expRepl=%rootPath%\base\repl_scripts
set expTrnsltns=%expRepl%\install-translation-namespaces.js
set expSitePlgns=%rootPath%\base\sites\primary\node_modules\plugins_extended
set expClientPlgns=%rootPath%\base\node_modules\plugins_extended
set expCmnVirts=\common\virtuals
set expClcVirts=\collections\virtuals

set impSiteCmnVirts=\sites\primary\node_modules\plugins_extended\common\virtuals

set expLayoutFldr=%expSitePlgns%%expCmnVirts%\templates\custom_layoutjs
set expT360Fldr=%expSitePlgns%%expCmnVirts%\templates\custom_components\threshold360
set expDetFldr=%expSitePlgns%%expCmnVirts%\templates\custom_detail
set expQvFldr=%expSitePlgns%%expCmnVirts%\templates\custom_quickview

:: Base client JS files
set expT360JsFldr=%expSitePlgns%%expCmnVirts%\js\custom_components\threshold360
set expDetJsFldr=%expSitePlgns%%expCmnVirts%\js\custom_detail
set expLayoutJsFldr=%expSitePlgns%%expCmnVirts%\js\custom_layoutjs
set expQvJsFldr=%expSitePlgns%%expCmnVirts%\js\custom_quickview
set expLayoutJs=\js\custom_layoutjs.js
set expUtlsJs=\js\custom_utils.js
set expCalUtlsJs=\js\custom_calendar_utils.js
set expUIW=\js\custom_ui_watcher.js
set expDetJs=\js\custom_detail.js
set expAirJs=\js\custom_vue_airbnb_style_datepicker.js
set expLazyJs=\js\custom_lazyload.js

set expAllJs=%expLayoutJs% %expUtlsJs% %expCalUtlsJs% %expUIW% %expDetJs% %expAirJs% %expLazyJs%

:: Base client CSS files
set expLayoutCss=\css\custom_layoutjs.css
set expVarsCss=\css\variables.css
set expAirCss=\css\custom_vue_airbnb_style_datepicker.css
set expQvCss=\css\custom_quickview.css

set expAllCss=%expLayoutCss% %expVarsCss% %expAirCss% %expQvCss%

:: Base client HTML files
set expYelpSnpt=\templates\custom_yelp_snippet_template.html
set expT360col=\templates\widget_threshold_collection_map.html
set expT360vwr=\templates\widget_threshold_viewer.html

set expCmnHtml=%expYelpSnpt% %expT360col% %expT360vwr%

set expYelpCmpJs=%coreOps%\common\js\custom_yelp_component.js

:: Setup base client paths

:: Setup client paths
set impClientPlgnsFldr=\node_modules\plugins_extended
set impSitePlgnsFldr=\sites\primary\node_modules\plugins_extended
set impCmnVirts=\common\virtuals
set impClcVirts=\collections\virtuals

set impRepls=%rootPath%%client%\repl_scripts
set impLayoutFldr=%rootPath%%client%%impSitePlgnsFldr%%impCmnVirts%\templates\custom_layoutjs
set impLayoutJsFldr=%rootPath%%client%%impSitePlgnsFldr%%impCmnVirts%\js\custom_layoutjs
set impT360Fldr=%rootPath%%client%%impSitePlgnsFldr%%impCmnVirts%\templates\custom_components\threshold360
set impT360JsFldr=%rootPath%%client%%impSitePlgnsFldr%%impCmnVirts%\js\custom_components\threshold360
set impDetFldr=%rootPath%%client%%impSitePlgnsFldr%%impCmnVirts%\templates\custom_detail
set impDetJsFldr=%rootPath%%client%%impSitePlgnsFldr%%impCmnVirts%\js\custom_detail
set impQvFldr=%rootPath%%client%%impSitePlgnsFldr%%impCmnVirts%\templates\custom_quickview
set impQvJsFldr=%rootPath%%client%%impSitePlgnsFldr%%impCmnVirts%\js\custom_quickview
:: Setup client paths

ECHO Variables set...

if not exist %rootPath%%client%\repl_scripts (
    mkdir %rootPath%%client%\repl_scripts
    xcopy %expRepl%%expTrnsltns% %rootPath%%client%\repl_scripts\install-translation-namespaces.js
) else if exist %rootPath%%client%\repl_scripts (
    xcopy %expTrnsltns% %rootPath%%client%\repl_scripts\install-translation-namespaces.js
)

if not exist %impLayoutFldr% (
    mkdir %impLayoutFldr%
    robocopy %expLayoutFldr% %impLayoutFldr% /COPYALL
) else (
    ECHO %impLayoutFldr% folder exists...
)

if not exist %impLayoutJsFldr% (
    mkdir %impLayoutJsFldr%
    robocopy %expLayoutJsFldr% %impLayoutJsFldr% /COPYALL
) else (
    ECHO %impLayoutJsFldr% folder exists...
)

if not exist %impT360Fldr% (
    mkdir %impT360Fldr%
    robocopy %expT360Fldr% %impT360Fldr% /COPYALL
) else (
    ECHO %impT360Fldr% folder exists...
)

if not exist %impT360JsFldr% (
    mkdir %impT360JsFldr%
    robocopy %expT360JsFldr% %impT360JsFldr% /COPYALL
) else (
    ECHO %impT360JsFldr% folder exists...
)

if not exist %impDetFldr% (
    mkdir %impDetFldr%
    robocopy %expDetFldr% %impDetFldr% /COPYALL
) else (
    ECHO %impDetFldr% folder exists...
)

if not exist %impDetJsFldr% (
    mkdir %impDetJsFldr%
    robocopy %expDetJsFldr% %impDetJsFldr% /COPYALL
) else (
    ECHO %impDetJsFldr% folder exists...
)

if not exist %impQvFldr% (
    mkdir %impQvFldr%
    robocopy %expQvFldr% %impQvFldr% /COPYALL
) else (
    ECHO %impQvFldr% folder exists...
)

if not exist %impQvJsFldr% (
    mkdir %impQvJsFldr%
    robocopy %expQvJsFldr% %impQvJsFldr% /COPYALL
) else (
    ECHO %impQvJsFldr% folder exists...
)

(for %%f in (%expAllCss%) do ( 
   if not exist  %rootPath%%client%%impSiteCmnVirts%%%f (
       xcopy %expSitePlgns%%expCmnVirts%%%f %rootPath%%client%%impSiteCmnVirts%%%f*
   ) else (
       ECHO error copying %%f --- it may already exist
   )
))


(for %%f in (%expAllJs%) do ( 
   if not exist  %rootPath%%client%%impSiteCmnVirts%%%f (
       xcopy %expSitePlgns%%expCmnVirts%%%f %rootPath%%client%%impSiteCmnVirts%%%f*
   ) else (
       ECHO error copying %%f --- it may already exist
   )
))

(for %%f in (%expCmnHtml%) do ( 
   if not exist  %rootPath%%client%%impSiteCmnVirts%%%f (
       xcopy %expSitePlgns%%expCmnVirts%%%f %rootPath%%client%%impSiteCmnVirts%%%f*
   ) else (
       ECHO error copying %%f --- it may already exist
   )
))

set expListTmp=%expSitePlgns%\listings\virtuals\templates\widget_layout_list.html
set expEventTmp=%expSitePlgns%\events\virtuals\templates\widget_layout_list.html
set expOfferTmp=%expSitePlgns%\offers\virtuals\templates\widget_layout_list.html

xcopy %expListTmp% %rootPath%%client%%impSitePlgnsFldr%\listings\virtuals\templates\widget_layout_layoutjs_list.html
xcopy %expEventTmp% %rootPath%%client%%impSitePlgnsFldr%\events\virtuals\templates\widget_layout_layoutjs_list.html
xcopy %expOfferTmp% %rootPath%%client%%impSitePlgnsFldr%\offers\virtuals\templates\widget_layout_layoutjs_list.html

START "" %lnp% %leoCfg%



