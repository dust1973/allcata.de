{assign var='show_filters' value=false}
{if $Einstellungen.artikeluebersicht.suchfilter_anzeigen_ab == 0 || count($Suchergebnisse->Artikel->elemente) >= $Einstellungen.artikeluebersicht.suchfilter_anzeigen_ab || $NaviFilter->nAnzahlFilter > 0}
    {assign var='show_filters' value=true}
{/if}

{if isset($oErweiterteDarstellung) && isset($Einstellungen.artikeluebersicht.artikeluebersicht_erw_darstellung) &&
$Einstellungen.artikeluebersicht.artikeluebersicht_erw_darstellung === 'Y' && empty($AktuelleKategorie->categoryFunctionAttributes['darstellung'])}
<div class="col-md-8 hidden-md-down total-products">
    <ul class="display hidden-xs grid_list">
        <li id="grid"><a href="{$oErweiterteDarstellung->cURL_arr[2]}" {if $oErweiterteDarstellung->nDarstellung == 1}class="selected"{/if}  title="{lang key="gallery" section="productOverview"}">{lang key="gallery" section="productOverview"}</a></li>
        <li id="list"><a href="{$oErweiterteDarstellung->cURL_arr[1]}" {if $oErweiterteDarstellung->nDarstellung == 1}class="selected"{/if} title="{lang key="list" section="productOverview"}">{lang key="list" section="productOverview"}</a></li>
    </ul>

    <p>There are 20 products.</p>
</div>
{/if}

<div class="col-md-4 sort-select">
    <div class="row sort-by-row">


        <span class="col-sm-3 col-md-3 sort-by">Sortiert nach:</span>
        <div class="col-sm-9 col-xs-8 col-md-9 products-sort-order dropdown">
            <a class="select-title" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {lang key="standard" section="global"}    <i class="material-icons float-xs-right">&#xE5C5;</i>
            </a>
            <div class="dropdown-menu">
                {foreach name=sortierliste from=$Sortierliste item=Sort}
                    <a rel="nofollow" href="navi.php?k={$AktuelleKategorie->kKategorie}&Sortierung={$Sort->value}" class="select-list current js-search-link">
                        {$Sort->angezeigterName}
                    </a>
                {/foreach}
            </div>
        </div>


        <div class="col-sm-3 col-xs-4 hidden-lg-up filter-button">
            <button id="search_filter_toggler" class="btn btn-secondary">
                Filter
            </button>
        </div>
    </div>
</div>

