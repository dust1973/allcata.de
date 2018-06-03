{block name="header"}
    {if !isset($bAjaxRequest) || !$bAjaxRequest}
        {include file='layout/header.tpl'}
    {/if}
{/block}

{block name="content"}
    <section id="wrapper">
        <div id="columns_inner">
            <div id="left-column" class="col-xs-12 col-sm-4 col-md-3 col-lg-4 col-xl-3">
                <div class="block-categories block">
                    <h4 class="block_title hidden-md-down">
                        <a href="#"> {$AktuelleKategorie->cKategoriePfad}</a>
                    </h4>
                    <h4 class="block_title hidden-lg-up" data-target="#block_categories_toggle" data-toggle="collapse">
                        <a href="#"> {$AktuelleKategorie->cKategoriePfad}</a>
                        <span class="float-xs-right">
		  <span class="navbar-toggler collapse-icons">
			<i class="material-icons add">&#xE313;</i>
			<i class="material-icons remove">&#xE316;</i>
		  </span>
		</span>
                    </h4>
                    <div id="block_categories_toggle" class="block_content collapse">
                        <ul class="category-top-menu">
                            <li>  </li>
                        </ul>
                    </div>
                </div>

                {include file='boxes/box_manufacturers.tpl'}

                {include file='boxes/box_filter_pricerange.tpl'}


            </div>
            <div id="content-wrapper" class="left-column col-xs-12 col-sm-4 col-md-6 col-lg-8 col-xl-9">

                <section id="main">
                    <div class="block-category card card-block hidden-sm-down">
                        <div class="category-cover">
                            <img src="{$AktuelleKategorie->cBildURL}" alt="">
                        </div>
                        <h1 class="h1"> {$AktuelleKategorie->cKategoriePfad}</h1>
                    </div>
                    <section id="products">
                        <div>
                            <div id="js-product-list-top" class="row products-selection">

                                {if count($Suchergebnisse->Artikel->elemente) > 0}
                                    <form id="improve_search" action="navi.php" method="get" class="form-inline clearfix">
                                        {if isset($NaviFilter->Kategorie->kKategorie) && $NaviFilter->Kategorie->kKategorie > 0}
                                            <input type="hidden" name="k" value="{$NaviFilter->Kategorie->kKategorie}" />{/if}
                                        {if isset($NaviFilter->Hersteller->kHersteller) && $NaviFilter->Hersteller->kHersteller > 0}
                                            <input type="hidden" name="h" value="{$NaviFilter->Hersteller->kHersteller}" />{/if}
                                        {if isset($NaviFilter->Suchanfrage->kSuchanfrage) && $NaviFilter->Suchanfrage->kSuchanfrage > 0}
                                            <input type="hidden" name="l" value="{$NaviFilter->Suchanfrage->kSuchanfrage}" />{/if}
                                        {if isset($NaviFilter->MerkmalWert->kMerkmalWert) && $NaviFilter->MerkmalWert->kMerkmalWert > 0}
                                            <input type="hidden" name="m" value="{$NaviFilter->MerkmalWert->kMerkmalWert}" />{/if}
                                        {if isset($NaviFilter->Suchspecial->kKey) && $NaviFilter->Suchspecial->kKey > 0}
                                            <input type="hidden" name="q" value="{$NaviFilter->Suchspecial->kKey}" />{/if}
                                        {if isset($NaviFilter->Suche->cSuche) && $NaviFilter->Suche->cSuche|count > 0}
                                            <input type="hidden" name="suche" value="{$NaviFilter->Suche->cSuche|escape:'htmlall'}" />{/if}
                                        {if isset($NaviFilter->Tag->kTag) && $NaviFilter->Tag->kTag > 0}
                                            <input type="hidden" name="t" value="{$NaviFilter->Tag->kTag}" />{/if}
                                        {*Suchergebnisfilter*}
                                        {if isset($NaviFilter->KategorieFilter->kKategorie) && $NaviFilter->KategorieFilter->kKategorie > 0}
                                            <input type="hidden" name="kf" value="{$NaviFilter->KategorieFilter->kKategorie}" />{/if}
                                        {if isset($NaviFilter->HerstellerFilter->kHersteller) && $NaviFilter->HerstellerFilter->kHersteller > 0}
                                            <input type="hidden" name="hf" value="{$NaviFilter->HerstellerFilter->kHersteller}" />{/if}
                                        {if isset($NaviFilter->SuchspecialFilter->kKey) && $NaviFilter->SuchspecialFilter->kKey > 0}
                                            <input type="hidden" name="qf" value="{$NaviFilter->SuchspecialFilter->kKey}" />{/if}
                                        {if isset($NaviFilter->BewertungFilter->nSterne) && $NaviFilter->BewertungFilter->nSterne > 0}
                                            <input type="hidden" name="bf" value="{$NaviFilter->BewertungFilter->nSterne}" />{/if}
                                        {if isset($NaviFilter->PreisspannenFilter->cWert) && $NaviFilter->PreisspannenFilter->cWert|count > 0}
                                            <input type="hidden" name="pf" value="{$NaviFilter->PreisspannenFilter->cWert}" />{/if}
                                        {if isset($NaviFilter->MerkmalFilter) && is_array($NaviFilter->MerkmalFilter)}
                                            {foreach name=merkmalfilter from=$NaviFilter->MerkmalFilter item=mmfilter}
                                                <input type="hidden" name="mf{$smarty.foreach.merkmalfilter.iteration}" value="{$mmfilter->kMerkmalWert}" />
                                            {/foreach}
                                        {/if}
                                        {if isset($cJTLSearchStatedFilter_arr) && is_array($cJTLSearchStatedFilter_arr)}
                                            {foreach name=jtlsearchstatedfilter from=$cJTLSearchStatedFilter_arr key=key item=cJTLSearchStatedFilter}
                                                <input name="fq{$key}" type="hidden" value="{$cJTLSearchStatedFilter}" />
                                            {/foreach}
                                        {/if}
                                        {if isset($NaviFilter->TagFilter) && is_array($NaviFilter->TagFilter)}
                                            {foreach name=tagfilter from=$NaviFilter->TagFilter item=tag}
                                                <input type="hidden" name="tf{$smarty.foreach.tagfilter.iteration}" value="{$tag->kTag}" />
                                            {/foreach}
                                        {/if}
                                        {if isset($NaviFilter->SuchFilter) && is_array($NaviFilter->SuchFilter)}
                                            {foreach name=suchfilter from=$NaviFilter->SuchFilter item=oSuche}
                                                <input type="hidden" name="sf{$smarty.foreach.suchfilter.iteration}" value="{$oSuche->kSuchanfrage}" />
                                            {/foreach}
                                        {/if}
                                        {include file='productlist/result_options.tpl'}
                                    </form>
                                {/if}
                            </div>

                        </div>

                        <section id="js-active-search-filters" class="hide"></section>
                    <div>
                        <div id="js-product-list">
                            <div class="products row" itemprop="mainEntity" itemscope itemtype="http://schema.org/ItemList">
                                <ul class="product_list grid gridcount" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                                {foreach name=artikel from=$Suchergebnisse->Artikel->elemente item=Artikel}
                                    <meta itemprop="position" content="{$smarty.foreach.artikel.iteration}">
                                        {if $style === 'list'}
                                            {include file='productlist/item_list.tpl' tplscope=$style}
                                        {else}
                                            {include file='productlist/item_box.tpl' tplscope=$style class='thumbnail'}
                                        {/if}
                                {/foreach}
                                </ul>
                            </div>
                            {/block}

                            {block name="productlist-footer"}
                                {include file='productlist/footer.tpl'}
                            {/block}
                        </div>
                    </div>
                    <div id="js-product-list-bottom">
                            <div id="js-product-list-bottom"></div>
                    </div>
                    </section>
                </section>

            </div>

        </div>
    </section>




{block name="footer"}
    {if !isset($bAjaxRequest) || !$bAjaxRequest}
        {include file='layout/footer.tpl'}
    {/if}
{/block}