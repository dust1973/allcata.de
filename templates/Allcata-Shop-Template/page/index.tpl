{if !empty($cFehler)}
    <div class="alert alert-danger">{$cFehler}</div>
{/if}


            <div class="vertical-menu col-md-12 col-lg-3 col-xl-2 js-top-menu position-static hidden-md-down"
                 id="_desktop_vertical_menu ">
                <div class="vertical-menu-inner mega">
                    <div class="block-title">
                        <div class="cat-title-wrapper">
                            <div class="cat-title">Shop By Category</div>
                        </div>
                        <div class="title-arrow"></div>
                    </div>


                    {get_category_array categoryId=0 assign='categories'}
                    {if !empty($categories)}
                        {if !isset($activeId)}
                            {if isset($NaviFilter->Kategorie) && intval($NaviFilter->Kategorie->kKategorie) > 0}
                                {$activeId = $NaviFilter->Kategorie->kKategorie}
                            {elseif $nSeitenTyp == 1 && isset($Artikel)}
                                {assign var='activeId' value=$Artikel->gibKategorie()}
                            {elseif $nSeitenTyp == 1 && isset($smarty.session.LetzteKategorie)}
                                {$activeId = $smarty.session.LetzteKategorie}
                            {else}
                                {$activeId = 0}
                            {/if}
                        {/if}
                        {if !isset($activeParents) && ($nSeitenTyp == 1 || $nSeitenTyp == 2)}
                            {get_category_parents categoryId=$activeId assign='activeParents'}
                        {/if}
                        <ul class="top-vertical-menu block_content" id="top-vertical-menu" data-depth="0">
                            {foreach name='categories' from=$categories item='category'}

                                {assign var='isDropdown' value=false}
                                {if isset($category->bUnterKategorien) && $category->bUnterKategorien}
                                    {assign var='isDropdown' value=true}
                                {/if}
                                <li class="category" id="pstcategory-{$category->kKategorie}">
                                    <a href="{$category->cURL}" class="dropdown-item" data-depth="0">
                                <span class="float-xs-right hidden-lg-up">
                                    <span data-target="#top_sub_menu_5{$category->kKategorie}" data-toggle="collapse"
                                          class="navbar-toggler collapse-icons">
                                    <i class="material-icons add">&#xE145;</i>
                                    <i class="material-icons remove">&#xE15B;</i>
                                </span></span>
                                        {$category->cKurzbezeichnung}
                                    </a>

                                    {if $isDropdown}
                                        {if $category->bUnterKategorien}
                                            {if !empty($category->Unterkategorien)}
                                                {assign var=sub_categories value=$category->Unterkategorien}
                                            {else}
                                                {get_category_array categoryId=$category->kKategorie assign='sub_categories'}
                                            {/if}
                                        <div class="popover sub-menu js-sub-menu collapse"
                                             id="top_sub_menu_5{$category->kKategorie}">
                                            <ul class="top-vertical-menu block_content" data-depth="1">
                                            {foreach name='sub_categories' from=$sub_categories item='sub'}
                                                        <li class="category" id="pstcategory-{$sub->kKategorie}">
                                                            <a href="{$sub->cURL}"
                                                               class="dropdown-item dropdown-submenu" data-depth="1">
                                                                            <span class="float-xs-right hidden-lg-up">
                                                                                <span data-target="#top_sub_menu_{$sub->kKategorie}"
                                                                                      data-toggle="collapse"
                                                                                      class="navbar-toggler collapse-icons">
                                            <i class="material-icons add">&#xE145;</i>
                                            <i class="material-icons remove">&#xE15B;</i>
                                        </span></span>

                                                                {$sub->cKurzbezeichnung}


                                                            </a>
                                                        </li>

                                            {/foreach}
                                            </ul>
                                        </div>
                                        {/if}
                                    {/if}

                                </li>
                            {/foreach}
                        </ul>
                    {/if}
                    </ul>
                </div>
            </div>
            <div class="flexslider col-md-12 col-lg-9 col-xl-8" data-interval="3000" data-pause="true">
                <div class="loadingdiv spinner"></div>
                <ul class="slides">
                    {if isset($oSlider) && count($oSlider->oSlide_arr) > 0}
                        {foreach from=$oSlider->oSlide_arr item=oSlide}
                    <li class="slide">
                            {assign var="slideTitle" value=$oSlide->cTitel}
                            {if !empty($oSlide->cText)}
                                {assign var="slideTitle" value="#slide_caption_{$oSlide->kSlide}"}
                            {/if}
                                {if !empty($oSlide->cLink)}
                                    <a href="{$oSlide->cLink}"{if !empty($oSlide->cText)} title="{$oSlide->cText}"{/if}>
                                {/if}
                                    <img alt="{$oSlide->cTitel}" title="{$slideTitle}" src="{$oSlide->cBildAbsolut}"{if !empty($oSlide->cThumbnailAbsolut) && $oSlider->bThumbnail == '1'} data-thumb="{$oSlide->cThumbnailAbsolut}"{/if}/>
                            {if !empty($oSlide->cLink)}
                                </a></li>
                        {else}
                    </li>
                    {/if}
                        {/foreach}
                    {/if}
                </ul>
            </div>

            <div id="pstsubbanner" class="col-sm-12 col-md-12 col-lg-12 col-xl-2">
                <ul class="subbanner-wrapper row">
                    <li class="slide subbanner-item col-sm-12 col-md-4 col-lg-4 col-xl-12">
				  <span class="subbanner-item-inner">
					<a href="#" title="PSTSubBanner 1">
						<img src="templates/Allcata-Shop-Template/themes/mytheme/slider/kat_1.jpg" alt="PSTSubBanner 1" title="PSTSubBanner 1" />
					</a>
				  </span>
                    </li>
                    <li class="slide subbanner-item col-sm-12 col-md-4 col-lg-4 col-xl-12">
				  <span class="subbanner-item-inner">
					<a href="#" title="PSTSubBanner 2">
						<img src="templates/Allcata-Shop-Template/themes/mytheme/slider/kat_2.jpg" alt="PSTSubBanner 2" title="PSTSubBanner 2" />
					</a>
				  </span>
                    </li>
                    <li class="slide subbanner-item col-sm-12 col-md-4 col-lg-4 col-xl-12">
				  <span class="subbanner-item-inner">
					<a href="#" title="PSTSubBanner 3">
						<img src="templates/Allcata-Shop-Template/themes/mytheme/slider/kat_3.jpg" alt="PSTSubBanner 3" title="PSTSubBanner 3" />
					</a>
				  </span>
                    </li>
                </ul>
            </div>
            <div id="pst_categorycmsblock">

    <div class="container">
        <h2 class="h1 products-section-title text-uppercase">
            Top Kategorie
        </h2>
        <ul class="pst-categorycmsblock-inner row">
            {get_category_array categoryId=0 assign='categories'}
            {foreach name='categories' from=$categories item='category'}
            <li class="pst-cat-item ">
                <div class="pst-cat-item-inner">
                    <a href="{$category->cURL}" class="pst-cat-img"><img src="templates/Allcata-Shop-Template/themes/mytheme/slider/kat_1a.jpg" alt="" />
                        <span class="pst-cat-details">
						<span class="pst-cat-details-inner">
							<span class="pst-cat-name" href="{$category->cURL}">{$category->cKurzbezeichnung}</span>
						</span>
				   </span>
                    </a>
                </div>
            </li>
            {/foreach}
        </ul>

    </div>
</div>

             {block name="header-breadcrumb"}
                    {include file='layout/breadcrumb.tpl'}
        {/block}

<section id="wrapper">

    <div id="columns_inner">



        <div id="content-wrapper" style="width:100% !important;">



            <section id="main">






                <section id="content" class="page-home">


                    <!-- Template start -->


                    <!-- Template end -->
                    <div class="container">
                        <div id="pst_cmsbannerblock" class="pst_cmsbannerblock">
                            <div class="container">
                                <div class="row">
                                    <div class="banner-cmsblock">
                                        <ul class="pst-cmsblock-wrapper">
                                            {foreach name=startboxen from=$StartseiteBoxen item=Box}
                                                {if isset($Box->Artikel->elemente) && count($Box->Artikel->elemente)>0 && isset($Box->cURL)}
                                                    {if $Box->name === 'Sonderangebote'}
                                                        {lang key="topOffer" section="global" assign='title'}
                                                        {lang key='showAllTopOffers' section='global' assign='moreTitle'}
                                                        {assign var='class' value='feature-products product_block'}
                                                    {elseif $Box->name === 'Bestseller'}
                                                        {lang key="bestsellers" section="global" assign='title'}
                                                        {lang key='showAllBestsellers' section='global' assign='moreTitle'}
                                                        {assign var='class' value='bestseller product_block'}
                                                    {elseif $Box->name === 'TopAngebot'}
                                                        {lang key="topOffer" section="global" assign='title'}
                                                        {lang key='showAllTopOffers' section='global' assign='moreTitle'}
                                                        {assign var='class' value='top_angebot'}
                                                    {elseif $Box->name === 'NeuImSortiment'}
                                                        {lang key="newProducts" section="global" assign='title'}
                                                        {lang key='showAllNewProducts' section='global' assign='moreTitle'}
                                                        {assign var='class' value='bestseller product_block'}
                                                    {/if}
                                                    {assign var='moreLink' value=$Box->cURL}
                                                    {include file='snippets/product_startsite.tpl' class=$class boxname=$Box->name productlist=$Box->Artikel->elemente title=$title hideOverlays=true moreLink=$moreLink moreTitle=$moreTitle}
                                                {/if}
                                            {/foreach}

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>




                        <section class="brands">
                            <div class="container">
                                <div class="product-carousel">
                                    <h2 class="h1 products-section-title text-uppercase">
                                        <a href="#" title="Unsere Marken">			Unsere Marken
                                        </a>	</h2>

                                    <div class="products">

                                        <!-- Define Number of product for SLIDER -->

                                        <div class="customNavigation">
                                            <a class="btn prev pstbrand_prev">&nbsp;</a>
                                            <a class="btn next pstbrand_next">&nbsp;</a>
                                        </div>

                                        <ul id="pstbrand-carousel" class="pstbrand-carousel  pst-carousel product_list">

                                            <li class="item">
                                                <div class="brand-image">
                                                    <a href="?id_manufacturer=1&amp;controller=manufacturer&amp;id_lang=13" title="indignation">
                                                        <img src="templates/Allcata-Shop-Template/themes/mytheme/brands/1.jpg.png" alt="indignation" />
                                                    </a>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="brand-image">
                                                    <a href="?id_manufacturer=2&amp;controller=manufacturer&amp;id_lang=13" title="laboriosam">
                                                        <img src="templates/Allcata-Shop-Template/themes/mytheme/brands/2.jpg.png" alt="laboriosam" />
                                                    </a>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="brand-image">
                                                    <a href="?id_manufacturer=3&amp;controller=manufacturer&amp;id_lang=13" title="praesentium">
                                                        <img src="templates/Allcata-Shop-Template/themes/mytheme/brands/3.jpg.png" alt="praesentium" />
                                                    </a>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="brand-image">
                                                    <a href="?id_manufacturer=4&amp;controller=manufacturer&amp;id_lang=13" title="randomised">
                                                        <img src="templates/Allcata-Shop-Template/themes/mytheme/brands/4.jpg.png" alt="randomised" />
                                                    </a>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="brand-image">
                                                    <a href="?id_manufacturer=5&amp;controller=manufacturer&amp;id_lang=13" title="renaissance">
                                                        <img src="templates/Allcata-Shop-Template/themes/mytheme/brands/5.jpg.png" alt="renaissance" />
                                                    </a>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="brand-image">
                                                    <a href="?id_manufacturer=6&amp;controller=manufacturer&amp;id_lang=13" title="reprehenderit">
                                                        <img src="templates/Allcata-Shop-Template/themes/mytheme/brands/6.jpg.png" alt="reprehenderit" />
                                                    </a>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="brand-image">
                                                    <a href="?id_manufacturer=7&amp;controller=manufacturer&amp;id_lang=13" title="untrammelled">
                                                        <img src="templates/Allcata-Shop-Template/themes/mytheme/brands/7.jpg.png" alt="untrammelled" />
                                                    </a>
                                                </div>
                                            </li>

                                        </ul>
                                    </div>
                        </section>



                    </div>
                </section>



                <footer class="page-footer">

                    <!-- Footer content -->

                </footer>


            </section>



        </div>



    </div>

</section>

 {if isset($StartseiteBoxen) && $StartseiteBoxen|@count > 0}
    <hr>
    {assign var='moreLink' value=null}
    {assign var='moreTitle' value=null}
    {foreach name=startboxen from=$StartseiteBoxen item=Box}
        {if isset($Box->Artikel->elemente) && count($Box->Artikel->elemente)>0 && isset($Box->cURL)}
            {if $Box->name === 'TopAngebot'}
                {lang key="topOffer" section="global" assign='title'}
                {lang key='showAllTopOffers' section='global' assign='moreTitle'}
                {assign var='class' value='feature-products product_block'}
                {assign var='moreLink' value=$Box->cURL}
                {include file='snippets/product_slider.tpl' class=$class productlist=$Box->Artikel->elemente title=$title hideOverlays=true moreLink=$moreLink moreTitle=$moreTitle}
            {/if}
        {/if}
    {/foreach}
{/if}
