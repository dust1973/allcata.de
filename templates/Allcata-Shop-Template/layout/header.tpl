{block name="doctype"}<!DOCTYPE html>{/block}
<html {block name="html-attributes"}lang="{$meta_language}" itemscope
      {if $nSeitenTyp == URLART_ARTIKEL}itemtype="http://schema.org/ItemPage"
      {elseif $nSeitenTyp == URLART_KATEGORIE}itemtype="http://schema.org/CollectionPage"
      {else}itemtype="http://schema.org/WebPage"{/if}{/block}>
{block name="head"}
    <head>
        {block name="head-meta"}
            <meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
            <meta name="description" itemprop="description"
                  content={block name="head-meta-description"}"{$meta_description|truncate:1000:"":true}{/block}">
            <meta name="keywords" itemprop="keywords"
                  content="{block name="head-meta-keywords"}{$meta_keywords|truncate:255:"":true}{/block}">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="robots"
                  content="{if $bNoIndex === true  || (isset($Link->cNoFollow) && $Link->cNoFollow === 'Y')}noindex{else}index, follow{/if}">
            <meta itemprop="image" content="{$ShopURL}/{$ShopLogoURL}"/>
            <meta itemprop="url" content="{$cCanonicalURL}"/>
            <meta property="og:type" content="website"/>
            <meta property="og:site_name" content="{$meta_title}"/>
            <meta property="og:title" content="{$meta_title}"/>
            <meta property="og:description" content="{$meta_description|truncate:1000:"":true}"/>
            <meta property="og:image" content="{$ShopLogoURL}"/>
            <meta property="og:url" content="{$cCanonicalURL}"/>
        {/block}

        <title itemprop="name">{block name="head-title"}{$meta_title}{/block}</title>

        {if !empty($cCanonicalURL)}
            <link rel="canonical" href="{$cCanonicalURL}">
        {/if}

        {block name="head-base"}
            <base href="{$ShopURL}/">
        {/block}

        {block name="head-icons"}
            {if !empty($Einstellungen.template.theme.favicon)}
                {if file_exists("{$currentTemplateDir}{$Einstellungen.template.theme.favicon}")}
                    <link type="image/x-icon" href="{$currentTemplateDir}{$Einstellungen.template.theme.favicon}"
                          rel="shortcut icon">
                {else}
                    <link type="image/x-icon"
                          href="{$currentTemplateDir}themes/base/images/{$Einstellungen.template.theme.favicon}"
                          rel="shortcut icon">
                {/if}
            {else}
                <link type="image/x-icon" href="favicon-default.ico" rel="shortcut icon">
            {/if}
            {if $nSeitenTyp == 1 && isset($Artikel) && !empty($Artikel->Bilder)}
                <link rel="image_src" href="{$ShopURL}/{$Artikel->Bilder[0]->cPfadGross}">
                <meta property="og:image" content="{$ShopURL}/{$Artikel->Bilder[0]->cPfadGross}">
            {/if}
        {/block}

        {block name="head-resources"}
            {* css *}
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Alegreya+Sans:500,700|Raleway" rel="stylesheet">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/theme.css" type="text/css"
                  media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/productcomments.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/psblog.css" type="text/css"
                  media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/lightbox.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/psproductcountdown.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/1-simple.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/newsletter_front.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/minified/jquery-ui.min.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/jquery.ui.theme.min.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/jquery.fancybox.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/stsearch.css"
                  type="text/css" media="all">
            <link rel="stylesheet"
                  href="templates/Allcata-Shop-Template/themes/mytheme/css/jquery.autocomplete_productsearch.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/pst_verticalmenu.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/flexslider.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/pst_categorycmsblock.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/pst_testimonialcmsblock.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/pst_blockaboutus.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/pst_serviceblock.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/pst_paymentcmsblock.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/pst_bannercmsblock.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css/font-awesome.css"
                  type="text/css" media="all">
            <link rel="stylesheet" href="templates/Allcata-Shop-Template/themes/mytheme/css//custom.css" type="text/css"
                  media="all">
        {/block}

        {* Pagination *}
        {if isset($Suchergebnisse->Seitenzahlen->maxSeite) && $Suchergebnisse->Seitenzahlen->maxSeite > 1 && isset($oNaviSeite_arr) && $oNaviSeite_arr|@count > 0}
            {if $Suchergebnisse->Seitenzahlen->AktuelleSeite>1}
                <link rel="prev" href="{$oNaviSeite_arr.zurueck->cURL}">
            {/if}
            {if $Suchergebnisse->Seitenzahlen->AktuelleSeite < $Suchergebnisse->Seitenzahlen->maxSeite}
                <link rel="next" href="{$oNaviSeite_arr.vor->cURL}">
            {/if}
        {/if}

        {if !empty($Einstellungen.template.theme.backgroundcolor) && $Einstellungen.template.theme.backgroundcolor|strlen > 1}
            <style>
                body {
                    background-color: {$Einstellungen.template.theme.backgroundcolor} !important;
                }
            </style>
        {/if}
        {block name="head-resources-jquery"}
            <script src="{if empty($parentTemplateDir)}{$currentTemplateDir}{else}{$parentTemplateDir}{/if}js/jquery-1.12.4.min.js"></script>
        {/block}
        {include file='layout/header_inline_js.tpl'}
    </head>
{/block}

{assign var="isFluidContent" value=false}
{if isset($Einstellungen.template.theme.pagelayout) && $Einstellungen.template.theme.pagelayout === 'fluid' && isset($Link) && $Link->bIsFluid}
    {assign var="isFluidContent" value=true}
{/if}
{has_boxes position='left' assign='hasLeftPanel'}
{block name="body-tag"}
<body {if {$Link->cName} == 'Startseite'} id="index" {/if} data-page="{$nSeitenTyp}"
      class="lang-de country-gb currency-usd layout-full-width page-index tax-display-enabled"{if isset($Link) && !empty($Link->cIdentifier)} id="{$Link->cIdentifier}"{/if}>
{/block}

<main>
    {block name="main-wrapper-starttag"}
    {if !$bExclusive}
        {if isset($bAdminWartungsmodus) && $bAdminWartungsmodus}
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div id="maintenance-mode" class="block-social col-lg-12 col-md-12 col-sm-12">
                            <div class="container">
                                <div class="navbar-text text-center">
                                    {lang key="adminMaintenanceMode" section="global"}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}

        {block name="header"}
            <header id="header">
                {block name="header-container-inner"}
                    <div class="header-banner"></div>
                    <nav class="header-nav">
                        <div class="container">
                            <div class="nav-inner">
                                <div class="hidden-md-down">
                                    <div class="left-nav"></div>
                                    <div class="right-nav"></div>
                                </div>
                                <div class="hidden-lg-up text-xs-center mobile">
                                    <div class="float-xs-left" id="menu-icon">
                                        <i class="material-icons menu-open">&#xE5D2;</i>
                                        <i class="material-icons menu-close">&#xE5CD;</i>
                                    </div>
                                    <div class="float-xs-right" id="_mobile_cart"></div>
                                    <div class="float-xs-right" id="_mobile_user_info"></div>
                                    <div class="top-logo" id="_mobile_logo"></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </nav>
                    {block name="header-branding-content"}
                        <div class="header-top">
                        <div class="container">
                        <div class="header_logo hidden-md-down" id="_desktop_logo" itemprop="publisher" itemscope
                             itemtype="http://schema.org/Organization" itemid="">
                            {block name="logo"}
                                <a href="{$ShopURL}" title="{$Einstellungen.global.global_shopname}">
                                    <span itemprop="name" class="hidden">{$meta_publisher}</span>
                                    <meta itemprop="url" content="{$ShopURL}">
                                    <meta itemprop="logo" content="{$ShopURL}/{$ShopLogoURL}">
                                    {if isset($ShopLogoURL)}
                                        {image src=$ShopLogoURL alt=$Einstellungen.global.global_shopname class="img-responsive" width="200"}
                                    {else}
                                        <span class="h1">{$Einstellungen.global.global_shopname}</span>
                                    {/if}
                                </a>
                            {/block}
                        </div>
                        <div id="_desktop_cart">
                            <div class="blockcart cart-preview inactive"
                                 data-refresh-url="{$ShopURL}">
                                <div class="header blockcart-header dropdown js-dropdown">

                                    <a rel="nofollow" href="{$ShopURL}"
                                       class="cart-icon" data-toggle="dropdown" aria-haspopup="true"
                                       aria-expanded="false">
                                        <!--<span class="cart-title">My Cart</span>-->
                                        <span class="cart-products-count">
									 {include file='basket/cart_dropdown_label.tpl'}
								</span>
                                        <span class="cart-item-count">
					<span class="cart-item">0</span>
				</span>
                                    </a>

                                </div>
                            </div>
                        </div>
                    {/block}

                    <div id="_desktop_user_info">
                        {if empty($smarty.session.Kunde->kKunde)}

                        <div class="pst_userinfotitle"><span class="user-info-icon">My Account</span><i
                                    class="material-icons expand-more hidden-md-down">&#xE5CF;</i></div>

                        <form action="{get_static_route id='jtl.php' secure=true}" method="post" class="form">
                            {$jtl_token}
                            <div class="user-info">
                                <ul class="expand-more">
                                    <li class="signin">
                                        <fieldset>
                                            <div class="form-group">
                                                <input type="email" name="email" id="email_quick" class="form-control"
                                                       placeholder="{lang key='emailadress'}" required/>
                                            </div>
                                            <div class="form-group">
                                                <input type="password" name="passwort" id="password_quick"
                                                       class="form-control" placeholder="{lang key='password'}"
                                                       required/>
                                            </div>
                                            {if isset($showLoginCaptcha) && $showLoginCaptcha}
                                                <div class="form-group text-center float-label-control">
                                                    <div class="g-recaptcha"
                                                         data-sitekey="{$Einstellungen.global.global_google_recaptcha_public}"
                                                         data-callback="captcha_filled"></div>
                                                </div>
                                            {/if}
                                            <div class="form-group">
                                                <input type="hidden" name="login" value="1"/>
                                                {if !empty($oRedirect->cURL)}
                                                    {foreach name=parameter from=$oRedirect->oParameter_arr item=oParameter}
                                                        <input type="hidden" name="{$oParameter->Name}"
                                                               value="{$oParameter->Wert}"/>
                                                    {/foreach}
                                                    <input type="hidden" name="r" value="{$oRedirect->nRedirect} "/>
                                                    <input type="hidden" name="cURL" value="{$oRedirect->cURL}"/>
                                                {/if}
                                                <button type="submit" id="submit-btn"
                                                        class="btn btn-primary btn-block">{lang key="login" section="global"}</button>
                                            </div>
                                        </fieldset>
                                    </li>
                                    <li>
                                        <a href="{get_static_route id='pass.php'}" rel="nofollow"
                                           title="{lang key='forgotPassword'}">{lang key='forgotPassword'}</a>
                                    </li>
                                    <li>
                                        <a href="{get_static_route id='registrieren.php'}"
                                           title="{lang key='registerNow'}">{lang key='newHere'} {lang key='registerNow'}</a>
                                    </li>
                                </ul>
                            </div>
                        </form>
                    </div>
                    {else}
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{lang key='hello'}">
                        <span class="fa fa-user"></span>
                        <span class="hidden-xs hidden-sm hidden-md"> {lang key='hello'} {if $smarty.session.Kunde->cAnrede === 'w'}{$Anrede_w}{elseif $smarty.session.Kunde->cAnrede === 'm'}{$Anrede_m}{/if} {$smarty.session.Kunde->cNachname}</span>
                        <span class="caret"></span>
                    </a>
                    <div class="user-info">
                        <ul class="expand-more">
                            <li class="signin">
                            <li>
                                <a href="{get_static_route id='jtl.php' secure=true}"
                                   title="{lang key='myAccount'}">{lang key='myAccount'}</a>
                            </li>
                            <li>
                                <a href="{get_static_route id='jtl.php' secure=true}?logout=1"
                                   title="{lang key='logOut'}">{lang key='logOut'}</a>
                            </li>
                        </ul>
                    </div>
                {/if}
                    <div id="_desktop_language_selector">
                        <div class="language-selector-wrapper">
                            <!--<span class="hidden-lg-up">Sprache:</span>-->
                        </div>
                    </div>
                    <!-- Block search module -->
                    <div id="st_search_block_top" class="block exclusive">
                        <!--<h4 class="title_block">Search</h4>-->
                        <form method="get" action="" id="stsearchtopbox">
                            <input name="fc" value="module" type="hidden">
                            <input name="module" value="stproductsearch" type="hidden">
                            <input name="controller" value="productsearch" type="hidden">

                            <!--	<label for="search_query_block">Search products:</label>-->
                            <div class="block_content clearfix">


                                <div class="product_search">
                                    <div class="list-cate-wrapper">
                                        <input id="stsearchtop-cate-id" name="cate" value="" type="hidden">
                                        <a id="dropdownListCateTop" class="select-title" rel="nofollow"
                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span>All Categories</span>
                                            <i class="material-icons pull-xs-right">keyboard_arrow_down</i>
                                        </a>
                                        <div class="list-cate dropdown-menu" aria-labelledby="dropdownListCateTop">
                                            {include file="layout/header_category_nav.tpl"}
                                        </div>
                                    </div>
                                    <input class="search_query form-control grey ac_input" id="st_search_query_top"
                                           name="search_query" value="" placeholder="Search here..." autocomplete="off"
                                           type="text">
                                </div>

                                <button type="submit" id="st_search_top_button"
                                        class="btn btn-default button button-small"><span><i
                                                class="material-icons search">search</i></span></button>
                            </div>
                        </form>
                    </div>
                    <script type="text/javascript">
                        var blocksearch_type = 'top';
                    </script>
                    <!-- /Block search module -->
                    <div id="mobile_top_menu_wrapper" class="row hidden-lg-up" style="display:none;">
                        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
                        <div class="js-top-menu mobile" id="_mobile_vertical_menu"></div>
                        <div class="js-top-menu-bottom">
                            <div id="_mobile_pst_categorycmsblock"></div>
                            <div id="_mobile_currency_selector"></div>
                            <div id="_mobile_language_selector"></div>
                            <div id="_mobile_contact_link"></div>
                        </div>
                    </div>
                    </div>{* /container *}
                    </div>
                    <div class="nav-bar">
                    <div class="container">
                        <div class="menu pst-top-menu col-md-12 col-lg-12  js-top-menu position-static hidden-md-down"
                             id="_desktop_top_menu">

                            {include file="layout/header_category_nav.tpl"}

                        </div>

                        <div class="clearfix"></div>
                    </div>
                    {if isset($Einstellungen.template.theme.pagelayout) && $Einstellungen.template.theme.pagelayout !== 'fluid'}
                        </div>{* /container-block *}
                    {/if}
                {/block}
            </header>
        {/block}
    {/if}
    <div class="container">
        {block name="content-wrapper-starttag"}
        <div class="content-wrapper">
            {/block}
            <aside id="notifications">
                <div class="container"></div>
            </aside>
            {block name="header-breadcrumb"}
                {include file='layout/breadcrumb.tpl'}
            {/block}
{/block}{* /content-all-starttags *}